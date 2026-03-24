# ===============================================================
#					3-1 장. 예제1
# ===============================================================
DF <- read.csv("example_studentlist.csv", fileEncoding = "CP949")

HeightBySex <- split(DF$height, DF$sex)
HeightBySex 

mean(HeightBySex[[1]])
mean(HeightBySex[[2]])

sapply(HeightBySex, mean)

sapply(HeightBySex, sd)

sapply(HeightBySex, range)


DF <- read.csv("example_studentlist.csv", fileEncoding = "CP949")

Freq <- table(DF$bloodtype)
Freq

ReleativeFreq <- prop.table(Freq)
ReleativeFreq

Table <- rbind(Freq, ReleativeFreq)
Table

Table <- addmargins(Table, margin=2)
Table

# ===============================================================
#					3-1 장. 예제2
# ===============================================================
DF <- read.csv("example_studentlist.csv", fileEncoding = "CP949")

FactorOfHeight <- cut(DF$height, breaks=4)
FactorOfHeight

FreqOfHeight <- table(FactorOfHeight)
FreqOfHeight

FreqOfHeight <- rbind(FreqOfHeight, prop.table(FreqOfHeight))
FreqOfHeight

rownames(FreqOfHeight)[2] <- "RelativeFreq"
FreqOfHeight

CumuFreq <- cumsum(FreqOfHeight[2,])
CumuFreq

FreqOfHeight <- rbind(FreqOfHeight, CumuFreq)
FreqOfHeight

rownames(FreqOfHeight) <- c("도수", "상대도수", "누적도수")
FreqOfHeight

FreqOfHeight <- addmargins(FreqOfHeight, margin=2)
FreqOfHeight

# ===============================================================
#					3-1 장. 예제2
# ===============================================================
DF <- read.csv("example_studentlist.csv", fileEncoding = "CP949")

CT <- table(DF$sex, DF$bloodtype)
CT

PropCT <- prop.table(CT, margin=1)
PropCT

addmargins(PropCT, margin=2)

a <- c(1,2,3,4,NA,6,7,8,9,10)
a

complete.cases(a)

a <- a[complete.cases(a)]
a

a <- c(1,2,3,4,NA,6,7,8,9,10)
a

a <- na.omit(a)
a

# ===============================================================
#		4-1 장. 고수준 그래프 함수 시작하기 – plot()
# ===============================================================
DF <- read.csv("example_studentlist.csv", fileEncoding = "CP949")
attach(DF)
str(DF)

plot(age)

plot(height, weight)

plot(weight, height)


# ===============================================================
#		4-1 장.Level 별 그래프 보기
# ===============================================================
sex <- as.factor(sex)
plot(weight~height, pch=as.integer(sex))
legend("topleft", c("남", "여"), pch=sex)
coplot(weight~height | sex)

plot(weight~height, ann=F)
title(main="A대학 B학과생 몸무게와 키의 상관관계")
title(xlab="키")
titile(ylab="몸무게")

grid()

heightMean <- mean(height)
abline(v=heightMean, col="red")


# ===============================================================
#		4-1 장. 다른 고수준 그래프 알아보기 – barplot()
# ===============================================================
FreqBlood <- table(bloodtype)
FreqBlood

barplot(FreqBlood)

title(main="혈액형별 빈도수")
title(xlab="혈액형")
title(ylab="빈도수")

Height <- tapply(height, bloodtype, mean)
Height

barplot(Height, ylim=c(0,200))

# ===============================================================
#		4-1 장. 다른 고수준 그래프 알아보기 – boxplot()
# ===============================================================
boxplot(height)

boxplot(height~bloodtype)

# ===============================================================
#		4-1 장. 다른 고수준 그래프 알아보기 – hist()
# ===============================================================
hist(height)

hist(height, breaks=10)

hist(height, breaks=10, prop=T) # 상대도수밀도는 막대면적에 의미 있음

lines(density(height))

BreakPoint <- seq(min(height), max(height)+7, by=7)
hist(height, breaks=BreakPoint)

DiffPoint <- c(min(height), 165, 170, 180, 185, 190)
hist(height, breaks=DiffPoint)

# ===============================================================
#		4-1 장. 응용 - 기본 그래프 함수 활용하기
# ===============================================================
par(mfrow=c(2,3))

plot(weight, height)
plot(sex, height)
barplot(table(bloodtype))
boxplot(height)
boxplot(height~bloodtype)
hist(height, breaks=10)

par(mfrow=c(1,1))

TS1 <- c(round(runif(30)*100))

TS1

TS2 <- c(round(runif(30)*100))
TS2

TS1 <- sort(TS1, decreasing=F)
TS2 <- sort(TS2, decreasing=F)
TS1
TS2

plot(TS1, type="l")
lines(TS2, lty="dashed", col="red")