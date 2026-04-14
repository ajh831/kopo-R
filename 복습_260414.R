# =================================================================================
#	  4-2장.예제5. reshape2패키지의 melt()을 이용해 데이터를 가공 후 그래프로 나타내기 
# =================================================================================
library("dplyr")
library("ggplot2")
library("ggthemes")
library("reshape2")

rm(list = ls())

DF <- read.csv('example_population_f.csv', fileEncoding='CP949')
DF

DF <- DF[,-1]
DF

str(DF)

names(DF)

group <- group_by(DF, Provinces)
DF2 <- summarise(group, SumPopulation=sum(Population), Male=sum(Male),
Female=sum(Female))

DF2

DF3 <- melt(DF2, id.vars = c("Provinces", "SumPopulation"),
measure.vars = c("Male", "Female"))

DF2

DF3

colnames(DF3)[3] <- "Sex"
colnames(DF3)[4] <- "Population"

DF3

DF4 <- mutate(DF3, Ratio = Population / SumPopulation)
DF4$Ratio <- round(DF4$Ratio, 3)


G1 <- ggplot(DF4, aes(x=Provinces, y=Ratio, fill=Sex)) + geom_bar(stat='identity') +
coord_cartesian(ylim=c(0.45, 0.55)) + theme_wsj()

G2 <- geom_text(aes(y=Ratio, label=Ratio), colour="white")
G1 + G2

DF4 <- mutate(DF4, Position = ifelse(Sex == "Male", 0.475, 0.525))
DF4

# =============================================
#	  4-2장.예제6. 클리블랜드 점 그래프 그리기 
# =============================================
library("dplyr")
library("ggplot2")
library("ggthemes")

DF <- read.csv("example_population_f.csv", fileEncoding="CP949")
DF <- DF[,-1]
DF

DF2 <- mutate(DF, SexF=ifelse(SexRatio > 1, "남자비율높음",
ifelse(SexRatio == 1, "남녀비율같음", "여자비율높음")))

DF3 <- filter(DF2, Provinces=="경기도")

Graph <- ggplot(DF3, aes(x=(SexRatio-1), y=reorder(City, SexRatio))) +
geom_segment(aes(yend=City), xend=0, colour="grey50") + geom_point(size=4,
aes(colour=SexF)) + theme_minimal()

Graph


# =========================================================
#	  4-2장.예제7. 시간에 따른 연령별 인구 변화 그래프 그리기 
# =========================================================
library("dplyr")
library("ggplot2")
library("ggthemes")
library("reshape2")
library("scales")

DF <- read.csv("example_population2.csv")


group <- group_by(DF, Time)
DF2 <- summarise(group, s0=sum(age0to4, age5to9),
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

DF3 <- melt(DF2, id.vars="Time", measure.vars=c("s0", "s10", "s20", "s30", "s40",
										"s50", "s60", "s70", "s80", "s90", "s100"))

colnames(DF3) <- c("Time", "Generation", "Population")

G1 <- ggplot(DF3, aes(x=Time, y=Population, colour=Generation, fill=Generation)) +
geom_area(alpha=.6) + theme_wsj()
G1


G2 <- ggplot(DF3, aes(x=Time, y=Population, colour=Generation, fill=Generation)) +
geom_area(alpha=.6) + theme_wsj()
G2 + scale_y_continuous(labels = scales::comma)






