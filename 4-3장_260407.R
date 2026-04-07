# ============================================================
#	               예제1. 타이타닉호의 생존율
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
iinit.angle = 90)

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
#	               예제2. 다이아몬드의 품질
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
#	   예제3. 2019년도 관광객 가자아 많이 방문한 제주도 관광지
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






