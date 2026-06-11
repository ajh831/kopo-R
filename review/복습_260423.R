DF <- read.esv("example_studentlist.csv", fileEncoding = "CP949")
DF

Freq <- table(DF$bloodtype)
Freq

ReleativeFreq <- prop.table(Freq)
ReleativeFreq

Table <- rbind(Freq, ReleativeFreq)
Table

Table <- addmargins(Table, margin=2)
Table

DF <- read.csv("student_list.csv", fileEncoding="CP949")
DF

FactorOfHeight <- cut(DF$height, breaks=4)
FactorOfHeight

FreqOfHeight <- table(FactorOfHeight)
FreqOfHeight

FreqOfHeight <- rbind(FreqOfHeight, prop.table(FreqOfHeight))
FreqOfHeight

CumuFreq <- cumsum(FreqOfHeight[2,])
CumuFreq

FreqOfHeight <- rbind(FreqOfHeight, CumuFreq)
FreqOfHeight

rownames(FreqOfHeight) <- c("도수", "상대도수", "누적상대도수")
FreqOfHeight

FreqOfHeight <- addmargins(FreqOfHeight, margin=2)
FreqOfHeight

DF <- read.csv("wxample_studentList.csv", fileEncoding="CP949")
DF

CT <- table(DF$sex, DF$bloodtype)
CT


PropCT <- prop.table(CT, margin=1)
PropCT

addmargins(PropCT, margin=2)

a <- c(1,2,3,4,NA,6,7,8,9,10)
a

complete.cases(a)

DF <- read.csv("example_studnetlist.csv", fileEncoding="CP949")
DF

attach(DF)

str(DF)

plot(age)

plot(height, weight)

plot(weight~height)

plot(sex, height)

sex <- as.factor(sex)
plot(height, sex)

plot(sex, height)


DF2 <- data.frame(height, weight)
DF2

plot(DF2)

DF2 <- cbind(DF2, age)
DF2

plot(DF2)

plot(weight~height, pch=as.integer(sex))

legend("topleft", c("남", "여"), pch=sex)

coplot(weight~height | sex)

plot(weight~height, ann=F)
title("A대학 B과학생 몸무게와 키의 상관관계")
title(xlab="키")
title(ylab="몸무게")
grid()

heightMean <- mean(height)
heightMean

abline(v=heightMean, col="red")

FreqBlood <- table(bloodtype)

FreqBlood

barplot(FreqBlood)
title("혈액형별 빈도수")
title(xlab="혈액형")
title(ylab="빈도수")

Height <- tapply(height, bloodtype, mean)
Height

barplot(Height, ylim=c(0,200))

boxplot(height)

boxplot(height~bloodtype)

hist(height)

hist(height, breaks=10)

BreakPoint <- seq(min(height), max(height)+7, by=7)
hist(height, breaks=BreakPoint)

DiffPoint <- c(min(height), 165, 170, 180, 185, 190)
DiffPoint
hist(height, breaks=DiffPoint)

par(mfrow=c(2,3))

plot(weight, height)

plot(sex, height)

barplot(table(bloodtype))

boxplot(height)

boxplot(height~bloodtype)

hist(height, breaks=10)

par(mfrow=c(1,1))

TS1 <- c(round(runif(30) * 100))
TS1

TS2 <- c(round(runif(30)*100))
TS2

TS1 <- sort(TS1, decreasing=F)
TS2 <- sort(TS2, decreasing=F)

plot(TS1, type="l")
lines(TS2, lty="dashed", col="red")

library("ggplot2")
library("ggthemes")

ggplot(data=diamonds, aes(x=carat, y=price, colour=clarity)) +
geom_point() +
theme_wsj()

DF <- read.csv("example_studentlist.csv", fileEncoding = "CP949")
g1 <- ggplot(DF, aes(x=height, y=weight, colour=bloodtype))

g1 + geom_point()

g1 + geom_line()


g1 + geom_line() + geom_point()

g1 + geom_line(size=1) + geom_point(size=10)

g1 + geom_line(size=1) + geom_point(size=10) + facet_grid(.~sex)


g <- ggplot(mpg, aes(displ, hwy))
g + geom_point()

g + geom_point() + facet_grid(.~class)

g + geom_point(alpha=.3) + facet_grid(cyl~class, scales="free")

g + geom_point(alpha=.3) + facet_wrap(cyl~class, scales="free")

g + geom_point(alpha=.3) + facet_wrap(cyl~class, scales="free")


ggplot(DF, aes(x=bloodtype)) + geom_bar()

g1 <- ggplot(DF, aes(x=weight, y-heitth)
g1 + geom_poinset()

g1 + geom_point(aes(color=sex), size=7) + geom_smooth(method="lm")

g1 + geom_point(aes(color=sex), size=7) + geom_text(aes(label=name))

















































