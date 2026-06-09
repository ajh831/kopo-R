DF <- read.csv("example_salary.csv", fileEncoding = "CP949", na="-")
head(DF, 5)

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
DF[2,]

Qnt <- quantile(salary, na.rm=T)
Qnt

Salary <- list(평균월급=Mean, 중앙값월급=Mid, 월급범위=Range, 월급사분위=Qnt)
Salary

temp <- tapply(DF$salary, DF$sex, mean, na.rm=T)
temp

library("ggplot2")
library("reshape2")
melt <- melt(temp)
ggplot(melt, aes(x=Var1, y=value, fill=Var1)) +
geom_bar(stat="identity")

melt

tapply(DF$salary, DF$sex, sd, na.rm=T)

tapply(DF$salary, DF$sex, range, na.rm=T)

temp <- tapply(DF$salary, DF$career, mean, na.rm=T)
temp

melt <- melt(temp)
melt

ggplot(melt, aes(x=Var1, y=value, group=1)) +
geom_line(colour="skyblue2", size=2) +
coord_polar() + ylim(0, max(melt$value))

tapply(DF$salary, DF$career, sd, na.rm=T)

tapply(DF$salary, DF$career, range, na.rm=T)


a1 <- DF[which(DF$salary == 1172399),]
a2 <- DF[which(DF$salary == 1685204),]
a3 <- DF[which(DF$salary == 1117605),]
a4 <- DF[which(DF$salary == 1245540),]
a5 <- DF[which(DF$salary == 1548036),]
list <- list(a1, a2, a3, a4, a5)
list


DF <- read.csv("example_cancer.csv", fileEncoding="CP949", na="기록없음")
str(DF)

attach(DF)

mean(age)

summary(age)

boxplot(age, range=1.5)
grid()

distIQR <- IQR(age, na.rm=T)
distIQR

posIQR<- quantile(age, prob=c(0.25, 0.75), na.rm=T)
posIQR


DownWhisker <- posIQR[[1]] - distIQR*1.5
UpWhisker <- posIQR[[2]] + distIQR*1.5
DownWhisker; UpWhisker

Outlier <- subset(DF, subset=(DF$age < DownWhisker | DF$age > UpWhisker))
Outlier

DF <- read.csv("example_salary.csv", fileEncoding="CP949", na="-")
head(DF, 5)

colnames(DF) <- c("age", "salary", "specialSalary", "workingTime", "numberOfWorker", "career", "sex")
str(DF)



















