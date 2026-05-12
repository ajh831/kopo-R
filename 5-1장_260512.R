DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
DF

attach(DF)

# 평균
mean(height, na.rm=T)

# 중앙값
median(height, na.rm=T)

# 범위
range(height, na.rm=T)

# 사분위
quantile(height, na.rm=T)

# IQR: 사분위에서 Q1과 Q3의 범위를 나타냄
IQR(height, na.rm=T)


# 평균, 중앙값, Q1, Q3 한 번에 보기
summary(height, na.rm=T)

boxplot(height)

# 상관계수
cor(height, weight)

# 상관계수, P-value(<0.05), 신뢰구간
cor.test(height, weight)

# 여러가지 변수들간 상관계수
cor(DF[,c(3,7,8)])

# 여러 변수를 다루는 함수에서 결측치 다루기
cor(height, weight, use="complete.obs")

DF2 <- DF
DF2[2,7] <- NA
DF2[4,8] <- NA
DF2

attach(DF2)

cor(height, weight)

cor(height, weight, use="complete.obs")

cor(height, weight, use="everything")

cor(height, weight, use="all.obs")

# 분산과 공분산 구하기
var(height, na.rm=T)

var(height, weight, na.rm=T)

var(DF[,c(3,7,8)], na.rm=T)

# 표준편차
sd(height, na.rm=T)

# 표준화
scale(height)

# 변동계수
sd(height, na.rm=T) / mean(height, na.rm=T)

sd(weight, na.rm=T) / mean(weight, na.rm=T)

search()
detach(pos = 2)
DF <- read.csv("example_salary.csv", fileEncoding="CP949", na="-")
head(DF,5)

colnames(DF)

colnames(DF) <- c("age", "salary", "specialSalary", "workingTime", "numberOfWorker", "career", "sex")
str(DF)

attach(DF)

Mean <- mean(salary, na.rm=T)
Mean

Mid <- median(salary, na.rm=T)
Mid

Range <- range(salary, na.rm=T)
Range

w <- which(DF$salary==4064286)
DF[w,]

Qnt <- quantile(salary, na.rm=T)
Qnt

Salary <- list(평균월급=Mean, 중앙값월급=Mid, 월급범위=Range, 월급사분위=Qnt)
Salary

DF <- read.csv("example_salary.csv", fileEncoding="CP949", na="-")
head(DF, 5)

colnames(DF)

colnames(DF) <- c("age", "salary", "specialSalary", "workingTime", "numberOfWorker", "career", "sex")
str(DF)

temp <- tapply(salary, sex, mean, na.rm=T)
temp

library("ggplot2")
library("reshape2")
melt <- melt(temp)
melt
ggplot(melt, aes(x=Var1, y=value, fill=Var1)) + geom_bar(stat="identity")

tapply(salary, sex, sd, na.rm=T)

tapply(salary, sex, range, na.rm=T)

temp <- tapply(salary, career, mean, na.rm=T)
temp

melt <- melt(temp)
melt

ggplot(melt, aes(x=Var1, y=value, group=1))+
geom_line(colour="skyblue2", size=2) +
coord_polar() + ylim(0, max(melt$value))

tapply(salary, career, sd, na.rm=T)

tapply(salary, career, range, na.rm=T)


a1 <- DF[which(salary == 1172399), ]
a2 <- DF[which(salary == 1685204), ]
a3 <- DF[which(salary == 1117605), ]
a4 <- DF[which(salary == 1245540), ]
a5 <- DF[which(salary == 1548036), ]
list <- list(a1, a2, a3, a4, a5)
list

DF <- read.csv("example_cancer.csv", fileEncoding="CP949", na="기록없음")
str(DF)

search()
detach(pos = 2)

attach(DF)

mean(age)

summary(age)

boxplot(age, range=1.5)
grid()

search()
str(age)
distIQR <- IQR(age, na.rm=T)
distIQR

posIQR <- quantile(age, prob=c(0.25, 0.75), na.rm=T)
posIQR

DownWhisker <- posIQR[[1]] - distIQR*1.5
UpWhisker <- posIQR[[2]] + distIQR*1.5
DownWhisker; UpWhisker

Outlier <- subset(DF, subset=(DF$age < DownWhisker | DF$age > UpWhisker))
Outlier

DF <- read.csv("example_salary.csv", fileEncoding = "CP949", na="-")
head(DF, 5)

colnames(DF) <- c("age", "salary", "specialSalary", "workingTime", "numberOfWorker", "career", "sex")
str(DF)

Scale <- scale(DF$salary)
head(Scale, 10)

DF <- cbind(DF, scale=Scale)
str(DF)































































