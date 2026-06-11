# ====================================================
#	    4-2장.예제6. 클리블랜드 점 그래프 그리기
# ====================================================
library("dplyr")
library("ggplot2")
library("ggthemes")

DF <- read.csv("example_population_f.csv", fileEncoding="CP949")
DF <- DF[,-1]

DF2 <- mutate(DF, SexF=ifelse(SexRatio > 1, "남자비율높음",
ifelse(SexRatio == 1, "남녀비율같음", "여자비율높음")))

DF3 <- filter(DF2, Provinces=="경기도")

Graph <- ggplot(DF3, aes(x=(SexRatio-1), y=reorder(City, SexRatio))) +
geom_segment(aes(yend=City), xend=0, colour="grey50") + geom_point(size=4,
aes(colour=SexF)) + theme_minimal()
Graph

# ============================================================
#	  4-2장.예제7. 시간에 따른 연령별 인구 변화 그래프 그리기
# ============================================================
library("dplyr")
library("ggplot2")
library("ggthemes")
library("reshape2")
library("scales")

DF <- read.csv("example_population2.csv")

group <- group_by(DF, Time)
DF2 <- summarise(group,
s0=sum(age0to4,   age5to9),
s10=sum(age10to14, age15to19),
s20=sum(age20to24, age25to29),
s30=sum(age30to34, age35to39),
s40=sum(age40to44, age45to49),
s50=sum(age50to54, age55to59),
s60=sum(age60to64, age65to69),
s70=sum(age70to74, age75to79),
s80=sum(age80to84, age85to89),
s90=sum(age90to94, age95to99),
s100=sum(age100to104, age105to109))

head(DF2, 5)

DF3 <- melt(DF2,
id.vars="Time",
measure.vars=c("s0", "s10", "s20", "s30", "s40",
"s50", "s60", "s70", "s80", "s90", "s100"))

colnames(DF3) <- c("Time", "Generation", "Population")

G1 <- ggplot(DF3, aes(x=Time, y=Population, colour=Generation, fill=Generation)) +
geom_area(alpha=.6) + theme_wsj()
G1

G2 <- ggplot(DF3, aes(x=Time, y=Population, colour=Generation, fill=Generation)) +
geom_area(alpha=.6) + theme_wsj()
G2 + scale_y_continuous(labels = scales::comma)


# ============================================================
#	             4-3장.예제1. 타이타닉호의 생존율
# ============================================================

tit <- as.data.frame(Titanic)
str(tit)

head(tit)

library(dplyr)

# %>% : 파이프랑 같은거임
tit_class <- tit %>%
group_by(Class, Survived) %>%
summarise(sur_tot = sum(Freq)) %>%
mutate(total = sum(sur_tot), perc = sur_tot/total * 100)

tit_class

tit_sur <- tit_class %>%
filter(Survived == "Yes")
tit_sur

label = tit_sur$Class
colors = c("blue", "green", "yellow", "red")
pie(tit_sur$perc,
labels = label,
main = "Survivor Rate",
col = colors,
init.angle = 90)

library(ggplot2)

# 변수가 2개 있을 때 geom_col()로 그림
# 변수가 1개면 geom_bar()로 그림(높이에만 의미 있음)
ggplot(tit_sur, aes(x = Class, y = perc, fill = Class)) + geom_col()

tit_sex <- tit %>%
group_by(Class, Sex, Survived) %>%
summarise(tot_sur = sum(Freq)) %>%
mutate(tot = sum(tot_sur), perc = tot_sur/tot * 100) %>%
filter(Survived == "Yes")

tit_sex

ggplot(data = tit_sex, aes(x = Class, y = perc, fill = Sex)) +
geom_col(position = "dodge") + ggtitle("Survivor Rate")

ggplot(data = tit_sex, aes(x = Class, y = perc, group = Sex, color = Sex)) +
geom_line() + geom_point() + ggtitle("Survivor Rate")

# ============================================================
#	            4-3장.예제2. 다이아몬드의 품질
# ============================================================
library(ggplot2)
library(dplyr)
cut_price <- diamonds %>%
group_by(cut) %>%
summarise(p_mean = mean(price))
cut_price

ggplot(data = cut_price, aes(x = cut, y = p_mean)) + geom_col()

dia <- diamonds %>%
mutate(mass = ifelse(carat <= 1, "W1",
				ifelse(carat <= 2, "W2",
					ifelse(carat <= 3, "W3", "W4"))))
head(dia, 3)

dia_price <- dia %>%
select(cut, price, mass) %>%
group_by(mass, cut) %>%
mutate(mean = mean(price))
head(dia_price, 3)

ggplot(data = dia_price, aes(x = mass, y = mean, group = cut, color = cut)) +
geom_line(size = 1) + geom_point()

dia_3 <- diamonds %>%
filter(carat > 3)
dia_3

ggplot(data = dia_3, aes(x = color, fill = clarity)) + geom_bar()

# ============================================================
#   4-3장.예제3. 2019년도 관광객 가자아 많이 방문한 제주도 관광지
# ============================================================
library(readxl)

library(dplyr)
jeju_2019 <- read_excel("jeju-visitors-2019.xls")
head(jeju_2019)

jeju_2019 <- rename(jeju_2019,
				year = 년도,
				month = 월,
				city = 군구,
				loc = 관광지,
				kor = 내국인,
				forn = 외국인)

head(jeju_2019)

write.csv(jeju_2019, file = "jeju_2019.csv")

top_loc <- jeju_2019 %>%
group_by(loc) %>%
summarise(tot = sum(kor))
head(top_loc)

dim(top_loc)

table(is.na(top_loc$loc))

table(is.na(top_loc$tot))

top_10 <- top_loc %>%
filter(!is.na(tot)) %>%
arrange(desc(tot)) %>%
head(10)
top_10

library(ggplot2)
ggplot(data = top_10, aes(x = reorder(loc, tot), y = tot)) +
geom_col() + coord_flip() +
scale_y_continuous(labels = scales::comma)

# ============================================================
#	        예제4. 제주도를 가장 많이 찾아오는 시기
# ============================================================
jeju_2019 <- read.csv("jeju_2019.csv")
head(jeju_2019)

table(is.na(jeju_2019$kor))

kor_mon <- jeju_2019 %>%
filter(!is.na(kor)) %>%
group_by(month) %>%
summarise(mon_tot = sum(kor))
head(kor_mon)

dim(kor_mon)

library(ggplot2)
ggplot(data = kor_mon, aes(x = month, y = mon_tot)) +
geom_line() + geom_point() +
scale_x_continuous(breaks=seq(1, 12, 1))

mu_mon <- jeju_2019 %>%
select(month, loc, kor) %>%
filter(!is.na(kor) & loc == "국립제주박물관")
head(mu_mon)

ggplot(data = mu_mon, aes(x = month, y = kor)) +
geom_line() + geom_point() +
scale_x_continuous(breaks=seq(1, 12, 1))






