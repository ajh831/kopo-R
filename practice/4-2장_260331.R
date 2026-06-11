# ==============================================
#	     예제1. 상관관계가 높은 변수쌍을 찾아라
# ==============================================
DF <- mtcars
str(DF)
attach(DF)

plot(DF[,c(1:5)])
plot(DF[,c(6:11)])

plot(mpg~disp)

cor(mpg, disp)

boxplot(mpg)

hist(mpg)

hist(mpg, breaks=10)

boxplot(disp)

hist(disp)

# ====================================================
#	     예제2. 섬세한 그래프를 그려 데이터 분석하기
# ====================================================
library("ggplot2")
str(diamonds)

library("ggthemes")

ggplot(diamonds, aes(x=x, y=price)) + geom_point()

ggplot(diamonds, aes(x=x, y=price, colour=clarity)) + geom_point()

ggplot(diamonds, aes(x=x, y=price, colour=clarity)) +
geom_point() + theme_solarized_2()

ggplot(diamonds, aes(x=x, y=price, colour=clarity)) +
geom_point(alpha=0.03) + theme_solarized_2()

ggplot(diamonds, aes(x=x, y=price, colour=clarity)) +
geom_point(alpha=0.03) +
guides(colour = guide_legend(override.aes = list(alpha = 1))) +
theme_solarized_2()

ggplot(diamonds, aes(x=x, y=price, colour=clarity)) +
geom_point(alpha=0.03) +
geom_hline(yintercept=mean(diamonds$price), color="turquoise3", alpha=8) +
guides(colour = guide_legend(override.aes = list(alpha = 1))) +
xlim(3,9) + theme_solarized_2()

# ====================================================
#	     예제3. 시계열 데이터 라인 그래프 그리기
# ====================================================
TS <- read.csv("example_ts.csv")
TS

library("ggplot2")
library("ggthemes")

ggplot(TS, aes(x=Date, y=Sales)) + geom_line()

ggplot(TS, aes(x=factor(Date), y=Sales, group=1)) + geom_line()

ggplot(TS, aes(x=factor(Date), y=Sales, group=1)) + geom_line() + geom_point()

ggplot(TS, aes(x=factor(Date), y=Sales, group=1)) + geom_line() +
geom_point() + theme_light()

ggplot(TS, aes(x=factor(Date), y=Sales, group=1)) +
geom_line(colour="orange1", size=1) + geom_point(colour="orangered2", size=4) +
theme_light()

ggplot(TS, aes(x=factor(Date), y=Sales, group=1)) +
geom_line(colour="orange1", size=1) +
geom_point(colour="orangered2", size=4) +
xlab("년도") + ylab("매출") + ggtitle("A기업 월별 매출") +
theme_light()

# =============================================================================
#	     예제4. dplyr패키지를 이용해 원하는 데이터 쉽게 선택해 그래프고 나타내기
# =============================================================================
library("dplyr")
library("ggplot2")
library("ggthemes")

DF <- read.csv("example_population_f.csv", fileEncoding = "CP949")
DF <- DF[,-1]
DF

DF2 <- filter(DF, Provinces=="충청북도"|Provinces=="충청남도")

Graph <- ggplot(DF2, aes(x=City, y=Population,
fill=Provinces)) + geom_bar(stat="identity") + theme_wsj()+ scale_y_continuous(labels=scales::comma)
Graph


GraphReorder <- ggplot(DF2, aes(x=reorder(City,Population),
y=Population, fill=Provinces)) + geom_bar(stat="identity") + theme_wsj() +
scale_y_continuous(labels=scales::comma)
GraphReorder

DF3 <- filter(DF, SexRatio > 1, PersInHou < 2)

Graph <- ggplot(DF3, aes(x=City, y=SexRatio, fill=Provinces)) +
geom_bar(stat="identity") + theme_wsj()
Graph


library("dplyr")
library("ggplot2")
library("ggthemes")

DF <- read.csv("example_population_f.csv", fileEncoding = "CP949")
DF <- DF[,-1]
DF

DF <- mutate(DF, SexF = ifelse(SexRatio < 1, "여자비율높음",
ifelse(SexRatio > 1, "남자비율높음", "남여비율같음")))

DF$SexF <- factor(DF$SexF)
DF$SexF <- ordered(DF$SexF, c("여자비율높음", "남여비율같음", "남자비율높음"))

DF2 <- filter(DF, Provinces=="경기도")

Graph <- ggplot(DF2, aes(x=City, y=(SexRatio-1), fill=SexF)) +
geom_bar(stat="identity", position="identity") + theme_wsj()
Graph

DF4 <- filter(DF, Provinces=="서울특별시")

Graph2 <- ggplot(DF4, aes(x=City, y=(SexRatio-1), fill=SexF)) +
geom_bar(stat='identity', position='identity') + theme_wsj()
Graph2

DF5 <- filter(DF, Provinces=="제주특별자치도")

Graph3 <- ggplot(DF5, aes(x=City, y=(SexRatio-1), fill=SexF)) +
geom_bar(stat='identity', position='identity') + theme_wsj()
Graph3

DF6 <- filter(DF, Provinces=="전라북도"|Provinces=="전라남도")

Graph4 <- ggplot(DF6, aes(x=City, y=(SexRatio-1), fill=SexF)) +
geom_bar(stat='identity', position='identity') + theme_wsj()
Graph4

# =============================================================================
#	  예제5. reshape2 패키지의 melt()을 이용해 데이터를 가공 후 그래프로 나타내기
# =============================================================================
library("dplyr")
library("ggplot2")
library("ggthemes")
library("reshape2")

DF <- read.csv("example_population_f.csv", fileEncoding="CP949")
DF <- DF[,-1]

group <- group_by(DF, Provinces)
DF2 <- summarise(group, SumPopulation=sum(Population), Male=sum(Male),
Female=sum(Female))

DF3 <- melt(DF2, id.vars = c("Provinces", "SumPopulation"),
measure.vars = c("Male", "Female"))

DF2

DF3

colnames(DF3)[3] <- "Sex"
colnames(DF3)[4] <- "Population"
DF3

DF4 <- mutate(DF3, Ratio = Population/SumPopulation)
DF4$Ration <- round(DF4$Ratio, 3)

G1 <- ggplot(DF4, aes(x=Provinces, y=Ratio, fill=Sex)) + geom_bar(stat='identity') +
coord_cartesian(ylim=c(0.45, 0.55)) + theme_wsj()

G2 <- geom_text(aes(y=Ratio, label=Ratio), colour="white")
G1 + G2

DF4 <- mutate(DF4, Position = ifelse(Sex == "Male", 0.475, 0.525))
DF4

G1 <- ggplot(DF4, aes(x=Provinces, y=Ratio, fill=Sex)) + geom_bar(stat='identity') +
coord_cartesian(ylim=c(0.45, 0.55)) + theme_wsj()

G2 <- geom_text(aes(y=Position, label=Ratio), colour="white")
G1 + G2


# ====================================================
#	     예제6. 클리블랜드 점 그래프 그리기
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
#	     예제7. 시간에 따른 연령별 인구 변화 그래프 그리기
# ============================================================
library("dplyr")
library("ggplot2")
library("ggthemes")
library("reshape2")
library("scales")

DF <- read.csv("example_population2.csv")
