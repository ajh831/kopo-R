DF <- mtcars
DF

str(DF)
attach(DF)

plot(DF[,c(1:5)])

plot(DF[,c(6:11)])

plot(disp, mpg)
plot(mpg ~ disp)

cor(mpg, disp)

boxplot(mpg)

hist(mpg)

hist(mpg, breaks=10)

boxplot(disp)

hist(disp)

library("ggplot2")

str(diamonds)

library("ggthemes")

ggplot(diamonds, aes(x=x, y=price)) + geom_point()

ggplot(diamonds, aes(x=x, y=price, colour=clarity)) + geom_point()

ggplot(diamonds, aes(x=x, y=price, colour=clarity)) + geom_point() + theme_solarized_2()

ggplot(diamonds, aes(x=x, y=price, colour=clarity)) + geom_point(alpha=.03) + theme_solarized_2()

ggplot(diamonds, aes(x=x, y=price, colour=clarity)) +
geom_point(alpha=.03) +
guides(colour = guide_legend(override.aes = list(alpha=1))) +
theme_solarized_2()


ggplot(diamonds, aes(x=x, y=price, colour=clarity)) +
geom_point(alpha=0.03) +
geom_hline(yintercept=mean(diamonds$price), color="turquoise3", alpha=.8) +
guides(colour = guide_legend(override.aes = list(alpha=1))) +
theme_solarized_2() +
xlim(3,9)


TS <- read.csv("example_ts.csv", fileEncoding="CP949")
TS

library("ggplot2")
library("ggthemes")

ggplot(TS, aes(x=Date, y=Sales)) + geom_line()

ggplot(TS, aes(x=factor(Date), y=Sales, group=1)) + geom_line()


ggplot(TS, aes(x=factor(Date), y=Sales, group=1)) +
geom_point() +
geom_line()

ggplot(TS, aes(x=factor(Date), y=Sales, group=1)) +
geom_line() +
geom_point() +
theme_light()

ggplot(TS, aes(x=factor(Date) , y=Sales, group=1)) +
geom_line(colour="orange1", size=1) +
geom_point(colour="orangered2", size=4) +
theme_light()

ggplot(TS, aes(x=factor(Date), y=Sales, group=1)) +
geom_line(colour="orange1", size=1) +
geom_point(colour="orangered2", size=4) +
xlab("년도") + ylab("매출") + ggtitle("A기업 월별 매출") +
theme_light()

library("dplyr")
library("ggplot2")
library("ggthemes")

DF <- read.csv("example_population_f.csv", fileEncoding="CP949")
DF <- DF[, -1]
DF

DF2 <- filter(DF, Provinces=="충청북도"|Provinces=="충청남도")
DF2


Graph <- ggplot(DF2, aes(x=City, y=Population, fill=Provinces)) +
geom_bar(stat="identity") +
theme_wsj() +
scale_y_continuous(labels=scales::comma)

Graph 

GraphReorder <- ggplot(DF2, aes(x=reorder(City,Population), y=Population,
fill=Provinces)) +
geom_bar(stat="identity") +
theme_wsj() +
scale_y_continuous(labels=scales::comma)

DF3 <- filter(DF, SexRatio > 1, PersInHou < 2)
DF3

Graph <- ggplot(DF3, aes(x=City, y=SexRatio, fill=Provinces)) +
geom_bar(stat="identity") +
theme_wsj()

Graph

library("dplyr")
library("ggplot2")
library("ggthemes")

DF <- read.csv("example_population_f.csv", fileEncoding="CP949")
DF <- DF[,-1]
DF

DF <- mutate(DF, SexF = ifelse(SexRatio < 1, "여자비율높음",
ifelse(SexRatio > 1, "남자비율높음", "남여비율같음")))

DF

DF$SexF <- factor(DF$SexF)
DF$SexF <- ordered(DF$SexF, c("여자비율높음", "남여비율같음", "남자비율높음"))

DF2 <- filter(DF, Provinces=="경기도")
DF2

Graph <- ggplot(DF2, aes(x=City, y=(SexRatio-1), fill=SexF)) +
geom_bar(stat="identity", position="identity") +
theme_wsj()

Graph

DF4 <- filter(DF, Provinces=="서울특별시")
DF4

Graph2 <- ggplot(DF4, aes(x=City, y=(SexRatio-1), fill=SexF)) +
geom_bar(stat="identity", position="identity") +
theme_wsj()
Graph2

DF5 <- filter(DF, Provinces=="제주특별자치도")
DF5

Graph3 <- ggplot(DF5, aes(x=City, y=(SexRatio-1), fill=SexF)) +
geom_bar(stat="identity", position="identity") +
theme_wsj()
Graph3

library("dplyr")
library("ggplot2")
library("ggthemes")
library("reshape2")


DF <- read.csv("example_population_f.csv", fileEncoding="CP949")
DF <- DF[,-1]

group <- group_by(DF, Provinces)
group

DF2 <- summarise(group, SumPopulation=sum(Population), Male=sum(Male),
Female=sum(Female))
DF2

DF3 <- melt(DF2, id.vars = c("Provinces", "SumPopulation"),
measure.vars = c("Male", "Female"))
DF3

colnames(DF3)[3] <- "Sex"
colnames(DF3)[4] <- "Population"
DF3

DF4 <- mutate(DF3, Ratio = Population/SumPopulation)
DF4$Ratio <- round(DF4$Ratio, 3)

DF4

G1 <- ggplot(DF4, aes(x=Provinces, y=Ratio, fill=Sex)) +
geom_bar(stat="identity") +
coord_cartesian(ylim = c(0.45, 0.55)) + theme_wsj()

G2 <- geom_text(aes(y=Ratio, label=Ratio), colour="white")

G1 + G2

DF4 <- mutate(DF4, Position=ifelse(Sex=="Male", 0.475, 0.525))
DF4

G1 <- ggplot(DF4, aes(x=Provinces, y=Ratio, fill=Sex) +
geom_bar(stat="identity") +
coord_cartesian(ylim = c(0.45, 0.55)) +
theme_wsj()

G2 <- geom_text(aes(y=Ratio, label=Ratio), color="white")

G1 + G2

DF <- read.csv("example_population_f.csv", fileEncoding="CP949")
DF <- DF[,-1]

DF2 <- mutate(DF, SexF=ifelse(SexRatio > 1, "남자비율높음",
ifelse(SexRatio==1, "남녀비율같음", "여자비율높음")))

DF3 <- filter(DF2, Provinces=="경기도")

Graph <- ggplot(DF3, aes(x=(SexRatio-1), y=reorder(City, SexRatio))) +
geom_segment(aes(yend=City), xend=0, colour="gray50") +
geom_point(size=4, aes(colour=SexF)) +
theme_minimal()

Graph

Graph




























































