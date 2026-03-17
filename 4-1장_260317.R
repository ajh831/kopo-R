# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# 1. 고수준 그래프 함수
DF <- read.csv("example_studentlist.csv", fileEncoding = "CP949")
attach(DF)
str(DF)

## 산포도 확인
### 변수 1개
plot(age)

### 변수 2개(독립,종속)
plot(height, weight)

### 정규식으로 쓰기(종속~독립)
plot(weight~height)

## 명목형 변수와 수치형 변수의 관계
sex <- as.factor(sex)
plot(height, sex)

is(sex)

## 성별에 따른 키 Boxplot
plot(sex, height)

## plot()에 데이터 프레임 객체 넣기
DF2 <- data.frame(height, weight)
DF2

plot(DF2)

## 3개로 이루어진 데이터 프레임 넣기
DF3 <- cbind(DF2, age)
DF3

plot(DF3)

## 모든 변수가 있는 데이터프레임 자체 넣기
plot(DF)

# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# 2. Plot과 ggplot로 그래프 그리기
## Level별 그래프 보기
plot(weight~height, pch=as.integer(sex))

## legend 추가
legend("topleft", c("남", "여"), pch=sex)

## Levels별 그래프 보기(조건화 그래프): coplot() => 잘 사용하진 않음
coplot(weight~height | sex)

## 저수준 그래프 함수 - 제목 달기, X축 이름 달기 등
#plot(weight~height)
plot(weight~height, ann=F) # ann=F 라벨없이 출력
title(main="A대학 B학과생 몸무게와 키의 상관관계")
title(xlab="키")
title(ylab="몸무게")

## 그래프에 격자 추가
grid()

## 그래프에 선을 그음. 키의 평균값을 세로선으로 그음
heightMean <- mean(height)
abline(v=heightMean, col="red")

## 다른 고수준 그래프 알아보기(바 그래프)
FreqBlood <- table(bloodtype)
FreqBlood

barplot(FreqBlood)

### 타이틀과 각 축에 이름을 달아줌
title(main="혈액형별 빈도수")
title(xlab="혈액형")
title(ylab="빈도수")

### 그룹별 평균값 나타내기
#### 혈액형별 키의 평균값
Height <- tapply(height, bloodtype, mean)
Height

barplot(Height, ylim=c(0,200)) # tapply: 명목형 변수의 각 Levels별로 어떤 함수를 적용해 값을 구할 때 사용

## 다른 고수준 그래프 알아보기(boxplot)
boxplot(height)

### Levels별로 boxplot 그림
boxplot(height~bloodtype)

## 다른 고수준 그래프 알아보기(hist)
hist(height)

### 막대의 개수 바꾸고 싶다면 인자를 추가
hist(height, breaks=10)
hist(height, breaks=15)

### 상대도수밀도로 변경
hist(height, breaks=10, prob=T)

### 곡선을 추가로 그리기
lines(density(height))

### breaks인자를 이용하여 계급의 위치 값을 직접 입력하기
seq(min(height), max(height)+7, by=7)

BreakPoint <- seq(min(height), max(height)+7, by=7)
hist(height, breaks=BreakPoint)

### 계급이 서로 다른 경우: breaks 인자에 쪼개지는 포인트를 입력한 것처럼 일일이 입력하기
DiffPoint <- c(min(height), 165, 170, 180, 185, 190)
hist(height, breaks=DiffPoint)

## 응용-기본 그래프 함수 활용하기
### 한 화면에 여러 개 그래프 그리기: par
#par(mfrow=c(1,2))
par(mfrow=c(2,3))

plot(weight, height)
plot(sex, height)
barplot(table(bloodtype))
boxplot(height)
boxplot(height~bloodtype)
hist(height, breaks=10)

### 원래대로 돌리기
par(mfrow=c(1,1))

### 한 그래프에 두 그래프를 겹쳐 나태내기
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


# -----------------------------------------------------------------------
# 정교한 시각화로 분석하기: ggplot2
library("ggplot2")
library("ggthemes")
ggplot(data=diamonds, aes(x=carat, y=price, colour=clarity)) + geom_point() + theme_wsj()

a <- plot(height)
a

g1 <- ggplot(data=diamonds, aes(x=carat, y=price, colour=clarity))
g2 <- geom_point()
g3 <- theme_wsj()
g1+g2+g3

g1 + g2 + theme_bw()

## ggplot()함수 알아보기
DF <- read.csv("example_studentlist.csv", fileEncoding = "CP949")
g1 <- ggplot(DF, aes(x=height, y=weight, colour=bloodtype))

## 점 그리기
g1 + geom_point()
## 라인 그리기
g1 + geom_line()

## 라인과 점을 함께 사용하기
g1 + geom_line() + geom_point()

## 라인과 점 크기 키우기
g1 + geom_line(size=1) + geom_point(size=10)






