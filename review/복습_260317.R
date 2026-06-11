#################################################################################
#                                                                               #
#                           3-1장. 데이터 개념 이해하기                             #
#                                                                               #
#################################################################################

DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
DF

HeightBySex <- split(DF$height, DF$sex)
HeightBySex

mean(HeightBySex[[1]])

mean(HeightBySex[[2]])

sapply(HeightBySex, mean)

sapply(HeightBySex, sd)

sapply(HeightBySex, range)

result <- sapply(HeightBySex, range)
rownames(result) <- c("최소", "최대")
result

DF <- read.csv("student_list.csv", fileEncoding="CP949")
DF

Freq <- table(DF$bloodtype)
Freq

ReleativeFreq <- prop.table(Freq)
ReleativeFreq

Table <- rbind(Freq, ReleativeFreq)
Table

Table <- addmargins(Table, margin=2)
Table

ls()
rm(list=ls())


DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
DF

FactorOfHeight <- cut(DF$height, breaks=4)
FactorOfHeight

FreqOfHeight <- table(FactorOfHeight)
FreqOfHeight

FreqOfHeight <- rbind(FreqOfHeight, prop.table(FreqOfHeight))
FreqOfHeight

rownames(FreqOfHeight)[2] <- c("RelativeFreq")
FreqOfHeight

CumuFreq <- cumsum(FreqOfHeight[2,])
CumuFreq

FreqOfHeight <- rbind(FreqOfHeight, CumuFreq)
FreqOfHeight

rownames(FreqOfHeight) <- c("도수", "상대도수", "누적도수")
FreqOfHeight

FreqOfHeight <- addmargins(FreqOfHeight, margin=2)
FreqOfHeight

ls()
remove(list=ls())

DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
DF

CT <- table(DF$sex, DF$bloodtype)
CT

PropCT <- prop.table(CT)
PropCT

PropCT <- prop.table(CT, margin=1)
PropCT

addmargins(PropCT, margin=2)

a <- c(1,2,3,4,NA,6,7,8,9,10)
a

a <- a[complete.cases(a)]
a


a <- c(1,2,3,4,NA,6,7,8,9,10)
a

a <- na.omit(a)
a


#################################################################################
#                                                                               #
#                       3-2장. 데이터 개념 이해하기 예제                            #
#                                                                               #
#################################################################################
library("hflights")

head(hflights, 5)

str(hflights)

CountOfDest <- table(hflights$Dest)
CountOfDest

length(CountOfDest)

range(CountOfDest)

# range(CountOfDest)[[2]]

CountOfDest[CountOfDest==1]
CountOfDest[CountOfDest==9820]

SelectedOfDest <- CountOfDest[CountOfDest > 6000]
SelectedOfDest

addmargins(SelectedOfDest, margin=1)

barplot(SelectedOfDest)


#################################################################################
#                                                                               #
#                                  4-1장. 시각화                                 #
#                                                                               #
#################################################################################
ls()
remove(list=ls())
ls()

DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
DF
attach(DF)
str(DF)

plot(age)
plot(height, weight)
plot(weight~height)

sex <- as.factor(sex)
sex

plot(height, sex)

plot(sex, height)

DF2 <- data.frame(height, weight)
DF2

plot(DF2)

DF3 <- data.frame(DF2, age)
DF3

plot(DF3)

plot(DF)

plot(weight~height, pch=as.integer(sex))

legend("topleft", c("남", "여"), pch=sex)

coplot(weight~height | sex)

plot(weight~height, ann=F)
title(main="A대학 B학과생 몸무게와 키의 상관관계")
title(xlab="키")
title(ylab="몸무게")


plot(weight~height, ann=F, pch=as.integer(sex))
title(main="A대학 B학과생 몸무게와 키의 상관관계")
title(xlab="키")
title(ylab="몸무게")
legend("topleft", c("남", "여"), pch=sex)

plot(weight~height, ann=F)
title(main="A대학 B학과생 몸무게와 키의 상관관계")
title(xlab="키")
title(ylab="몸무게")
grid()

heightMean <- mean(height)
heightMean

abline(v=heightMean, col="red")

FreqBlood <- table(bloodtype)
FreqBlood

barplot(FreqBlood)
title(main="혈액형별 빈도수")
title(ylab="빈도수")
title(xlab="혈액형")


Height <- tapply(height, bloodtype, mean)
Height

barplot(Height, ylim=c(0,200))

plot(height)

boxplot(height)

boxplot(height~bloodtype)

hist(height)

hist(height, breaks=10)

hist(height, breaks=10, prob=T)

density(height)

lines(density(height))

BreakPoint <- seq(min(height), max(height)+7, by=7)
hist(height, breaks=BreakPoint)

DiffPoint <- c(min(height), 165, 170, 180, 185, 190)
hist(height, breaks=DiffPoint)

par(mfrow=c(2,3))

plot(weight, height)
plot(sex, height)
barplot(table(bloodtype))
boxplot(height)
boxplot(height~bloodtype)
hist(height, breaks=10)

par(mfrow=c(1,1))

runif(30)

TS1 <- round(runif(30)*100)
TS1

TS2 <- round(runif(30)*100)
TS2

TS1 <- sort(TS1, decreasing=F)
TS1
TS2 <- sort(TS2, decreasing=F)
TS2

plot(TS1, type="l")
lines(TS2, lty="dashed", col="red")

library("ggplot2")
library("ggthemes")
ggplot(data=diamonds, aes(x=carat, y=price, colour=clarity)) + geom_point() + theme_wsj()