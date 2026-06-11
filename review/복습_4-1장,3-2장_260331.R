# ====================================================================
#   고수준 그래프 함수 시작하기 – plot()
# ====================================================================
DF <- read. csv("example_studentList.csv", fileEncoding = "CP949")
attach(DF)
str(DF)

plot(age)

plot(height, weight)

plot(weight~height)

sex <- as.factor(sex) # 내부적으로 factor변수는 1,2로 변경해줌
plot(height, sex)

plot(sex, height)

DF2 <- data.frame(height, weight)
DF2

plot(DF2)

DF3 <- cbind(DF2, age)
DF3

plot(DF3)

plot(DF)

plot(weight~height, pch=as.integer(sex))

legend("topleft", c("남","여"), pch=sex)

coplot(weight~height | sex)

plot(weight~height, ann=F)
title(main="A대학 B학과생 몸무게와 키의 상관관계")
title(xlab="키")
title(ylab="몸무게")

grid()

heightMean <- mean(height)
abline(v=heightMean, col="red")

# ====================================================================
#   다른 고수준 그래프 알아보기 – barplot()
# ====================================================================
FreqBlood <- table(bloodtype)
FreqBlood
barplot(FreqBlood)

title(main="혈액형별 빈도수")
title(xlab="혈액형")
title(ylab="빈도수")

Height <- tapply(height, bloodtype, mean)
Height

barplot(Height, ylim=c(0,200))

# ====================================================================
#   다른 고수준 그래프 알아보기 - boxplot
# ====================================================================
boxplot(height)

barplot(height~bloodtype)

# ====================================================================
#   다른 고수준 그래프 알아보기 - hist()
# ====================================================================
hist(height)

hist(height, breaks=10)

hist(height,breaks=10, prob=T)

lines(density(height))

BreakPoint <- seq(min(height), max(height)+7, by=7)
hist(height, breaks=BreakPoint)

DiffPoint <- c(min(height), 165, 170, 180, 185, 190)
hist(height, breaks=DiffPoint)

# ====================================================================
#   응용 – 기본 그래프 함수 활용하기
# ====================================================================
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

# ===============================================================
#		4-1 장. 정교한 시각화로 분석하기(ggplot2)
# ===============================================================
library("ggplot2")
library("ggthemes")
ggplot(data=diamonds, aes(x=carat, y=price, colour=clarity)) + geom_point() + theme_wsj()

a <- plot(height)
a

g1 <- ggplot(data=diamonds, aes(x=carat, y=price, colour=clarity))
g2 <- geom_point()
g3 <- theme_wsj()
g1+g2+g3

g1+g2+theme_bw()

DF <- read.csv("example_studentlist.csv", fileEncoding = "CP949")
g1 <- ggplot(DF, aes(x=height, y=weight, colour=bloodtype))
g1 + geom_line()

g1 + geom_line() + geom_point()

g1 + geom_line(size=1) + geom_point(size=10)

# facet_grid()함수 사용하기
g1 + geom_point(size=10) + geom_line(size=1) + facet_grid(.~sex)

g1 + geom_point(size=10) + geom_line(size=1) + facet_grid(sex~.)

g1 + geom_point(size=10) + geom_line(size=1) + facet_grid(sex~., scales="free")

g1 + geom_point(size=10) + geom_line(size=1) + facet_wrap(~sex, scales="free")

g <- ggplot(mpg, aes(displ, hwy))
g + geom_point()

g + geom_point() + facet_grid(.~class)

g + geom_point(alpha=.3) + facet_grid(cyl~class, scales="free")

g + geom_point(alpha=.3) + facet_wrap(cyl~class, scales="free")

g + geom_point(alpha=.3) + facet_wrap(cyl~class, scales="free", ncol=3)

ggplot(DF, aes(x=bloodtype)) + geom_bar()

# 바그래프 그리기(geom_bar)
ggplot(DF, aes(x=bloodtype, fill=sex)) + geom_bar()

ggplot(DF, aes(x=bloodtype, fill=sex)) + geom_bar(position="dodge")

ggplot(DF, aes(x=bloodtype, fill=sex)) + geom_bar(position="identity")

ggplot(DF, aes(x=bloodtype, fill=sex)) + geom_bar(position="fill")

ggplot(DF, aes(x=bloodtype, fill=sex)) + geom_bar(position="dodge", width=0.3)

g1 <- ggplot(diamonds, aes(x=carat))
g1 + geom_histogram(binwidth=0.1, fill="orange")

g1 <- ggplot(DF, aes(x=weight, y=height))
g1 + geom_point()

g1 + geom_point(aes(color=sex), size=7)

g1 + geom_point(aes(color=sex, shape=sex), size=7)

g1 + geom_point(aes(color=sex, shape=bloodtype), size=7)

g1 + geom_point(aes(color=height, shape=sex), size=7)

g1 + geom_point(aes(size=height, shape=sex), colour="orange")

g1 + geom_point(aes(color=height, shape=bloodtype), size=7, alpha=0.6)

g1 + geom_point(aes(color=sex), size=7) + geom_smooth(method="lm")

g1 + geom_point(aes(color=sex), size=7) + geom_text(aes(label=name))

library("ggthemes")
g1 + geom_histogram(aes(y=..ndensity..), binwidth=1, fill="orange") + theme_wsj()


# ==================================================================================
#	       예제1. 20만건 관측치가 넘는 데이터셋의 명목형 변수 ‘도수분포표‘ 만들기
# ==================================================================================
install.packages("hflights")

## 패키지 불러오기
library("hflights")

## 데이터 살펴보기
head(hflights, 5)

## 데이터 구조 살펴보기
str(hflights)

## 특정 변수 살펴보기
CountOfDest <- table(hflights$Dest)
CountOfDest

## 명복형 변수 세기: length
length(CountOfDest)

## 범위 살펴보기: range
range(CountOfDest)

## 최소값과 최대값 이름찾기
CountOfDest[CountOfDest==1]
CountOfDest[CountOfDest==9820]

min(CountOfDest)
max(CountOfDest)

CountOfDest[CountOfDest==min(CountOfDest)]
CountOfDest[CountOfDest==max(CountOfDest)]


## 6000 횟수 넘는 공항 찾기
SelectedDest <- CountOfDest[CountOfDest > 6000]
SelectedDest

## 6000횟수 넘는 공항들의 전체 합 구하기
addmargins(SelectedDest, margin=1)

## 막대 그래프 그리기
barplot(SelectedDest)

# ==============================================
#	       예제2. 대장암 환자 자료 분석
# ==============================================
DF <- read.csv("example_cancer.csv", fileEncoding="CP949")
DF

str(DF)

DegreeOfAge <- table(cut(DF$age, breaks=(1:11)*10))
DegreeOfAge

rownames(DegreeOfAge) <- c("10s", "20s", "30s", "40s", "50s", "60s", "70s", "80s", "90s", "100s")
DegreeOfAge

library("ggplot2")
library("ggthemes")
ggplot(data=DF, aes(x=age)) + geom_freqpoly(binwidth=10, size=1.4, colour="orange") + theme_wsj()


# ==============================================
#	  예제3. 전국 커피숍 폐업/영업 상황 살펴보기
# ==============================================
library("ggplot2")
library("ggthemes")
DF <- read.csv("example_coffee.csv", fileEncoding="CP949")

str(DF)

DF <- subset(DF, select=c(-adress, -adressBystreet, -dateOfclosure, -startdateOfcessation, -duedateOfcessation, -dateOfreOpen, -zip))

str(DF)

range(DF$yearOfStart, na.rm=T)

DFFilter <- subset(DF, subset=(stateOfbusiness=="운영중"))
range(DFFilter$yearOfStart, na.rm=T)
subset(DFFilter, subset=(yearOfStart==1967))

table(DF$yearOfStart)

qplot(yearOfStart, data=DF, geom="bar")

Freq <- table(DF$stateOfbusiness, DF$yearOfStart)
Freq

which(colnames(Freq)=="1997")
which.max(colnames(Freq))
Freq <- Freq[,c(30:47)]
Freq

PFreq <- prop.table(Freq, margin=2)
PFreq

NewDF <- data.frame(colnames(Freq), Freq[1,], Freq[2,], PFreq[1,], PFreq[2,])
NewDF

rownames(NewDF) <- NULL
colnames(NewDF) <- c("Time", "Open", "Close", "POpen", "Pclose")
NewDF

ggplot(NewDF, aes(x=factor(Time), y=Close, group=1)) +
geom_line(colour="steelblue1", size=1) +
geom_point(colour="steelblue", size=3) +
geom_line(aes(y=Open), colour="tomato2", size=1) +
geom_point(aes(y=Open), colour="red", size=6) +
theme_bw()


# ==============================================
#	     예제4. 전국 커피숍 규모 파악하기
# ==============================================
DF <- read.csv("example_coffee.csv", fileEncoding="CP949")

Size <- DF$sizeOfsite
str(Size)

summary(Size)

plot(Size)

Size[Size > 10000] <- NA
summary(Size)

Size[Size==0] <- NA
Size <- Size[complete.cases(Size)]
summary(Size)

DegreeOfSize <- table(cut(Size, breaks=(0:72)*20))
DegreeOfSize

library("ggplot2")
library("ggthemes")
ggplot(data=DF, aes(x=sizeOfsite)) +
geom_freqpoly(binwidth=10, size=1.2, colour="orange") +
scale_x_continuous(limits=c(0,300), breaks=seq(0,300,20)) +
theme_wsj()

# ==============================================
#	     예제5. 전국 인구조사 자료 정리하기
# ==============================================
DF <- read.csv("example_population.csv", fileEncoding="CP949")
str(DF)

head(DF,5)

install.packages("stringr")

library("stringr")

temp <- str_split_fixed(DF[,1], "\\(",2)

head(temp, 10)

NewCity <- str_split_fixed(temp[,1], " ", 2)
head(NewCity, 10)

colnames(NewCity) <- c("Provinces", "City")

DF <- data.frame(NewCity, DF[,c(2:7)])
head(DF,3)

DF[DF==" "] <- NA
head(DF,10)

DF <- DF[complete.cases(DF),]
head(DF,10)

for(i in 3:8) {
DF[,i] <- sapply(DF[,i], function(x) gsub(",", "", x))
DF[,i] <- as.numeric(DF[,i])
}
str(DF)

ProPopul <- tapply(DF$Population, DF$Provinces, sum)
ProPopul

library("ggplot2")
library("ggthemes")
Graph <- ggplot(DF, aes(x=Provinces, y=Population, fill=Provinces)) + geom_bar(stat="identity") + theme_wsj()
Graph + scale_y_continuous(labels = scales::comma)

# write.csv(DF, "example_population_f.csv")


















































































































































