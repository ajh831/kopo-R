print("Hello Wolrd")

factorial(9)

print(9*8*7*6*5*4*3*2*1)

rep("배고파", times=5)

plot(10,10)

plot(c(10,10))

plot(c(5,7), c(20,30))

plot(runif(100))
plot(runif(100), runif(100))

Object1 <- 1
Object2 <- 2
Object1
Object2

Object1 <- "문자열"
Object2 <- "데이터"
paste(Object1, Object2)

Object1 <- TRUE
Object2 <- FALSE
Object1
Object2

Object1 <- sum(1,8,4,5,9)
Object1

a <- c(1,3,5,6,9)
a

a <- 1
is.vector(a)

a <- c(1,2,5)
is.vector(a)

a <- c("첫 번째", "두 번째", "배고파")
a

Object <- c(1,3,8,9)

Object <- c(Object, 11)
Object

Object <- c(0, Object)
Object

Object <- append(Object, 99, after=2)
Object

Object <- Object[-2]
Object

Object <- Object[-length(Object)]
Object

Object[3] <- 9
Object

Object <- c(1,2,3,1,2,3,1,2,3,5,1,2,3,5,1,2,3)
Object

Object[Object == 5] <- 100
Object

ls()

rm(list=ls())
ls()

#install.packages("rgl")
library("rgl")



library()

List <- read.csv("example_studentlist.csv", fileEncoding="CP949")
List

List <- read.table("studentlist.txt", fileEncoding="CP949", header=TRUE)
List


List <- read.table("studentlist2.txt", fileEncoding="CP949", header=TRUE, sep=";")
List

library("readxl")
DF <- read_excel("studentlist.xlsx", sheet="Sheet1", col_names=TRUE)
DF

s1 <- c(5,3,6,3,1)
is(s1)

a1 <- c(1,2,3)
is(a1)

a1 <- c(5,3,6,3,1)
a1 <- as.integer(a1)
is(a1)

a2 <- c("짬뽕", "짜장면", "짬뽕", "짬뽕", "짜장면")
a2

a2 <- as.factor(a2)
a2

a2 <- factor(a2, ordered=TRUE)
a2

a1 <- c(5,3,6,3,1)
a2 <- c("짬뽕", "짜장면", "짬뽕", "짬뽕", "짜장면")
a3 <- c(3.62, 5.45, 2.54, 3.67, 7.23)

DF <- data.frame(a1, a2, a3)
DF

DF <- data.frame(count=a1, food=a2, meanCount=a3)
DF

DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
DF

is.vector(DF$height)

str(DF)

DF$height


mean(DF$height)

Height <- DF$height
Height

DF[, 7]
DF[[7]]

DF[7]

DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
DF

DF[,c(6,7)]
DF[c(6,7)]

DF[c("bloodtype","height")]

DF[,7]
DF[2,]

DF[DF[c("name")] == "이미린"]

DF[2,1]
DF[,"height"]


DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
DF

attach(DF)

height

detach(DF)


DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
DF

DF["height" > 170]

subset(DF, subset=(height > 170))

subset(c(DF$name, DF$height), subset=(DF$height < 170))

subset(DF, select=c(name, height), subset=(height > 180))

subset(DF, select=-height)

subset(DF, select=c(-height, -weight))

DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
DF

colnames(DF)

colnames(DF)[6] <- "blood"
DF

DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
DF

BMI <- DF$weight/DF$height^2
BMI

DF <- cbind(DF, BMI)
DF

DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
DF

Omit <- read.csv("omit.csv", fileEncoding="CP949")
Omit

DF

DF <- merge(DF, Omit, by="name")
DF


DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
DF

AddCol <- data.frame(name="이미리", sex="여자", age=24, grade=4, absence="무", bloodtype="A", height=175.2, weight=51)
AddCol
DF <- rbind(DF, AddCol)
DF

DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
a <- c(1:20)
s <- c("파스타", "짬뽕", "순두부찌개", "요거트 아이스크림", "커피")
L <- c(T,F,F,T,T,T)

List <- list(DF, a, s, L)
List

List <- list(DataFrame=DF, Number=a, Character=s, Logic=L)
List

List <- List[-1]

List["Number"]

List[1]

class(List[1])

class(List[[1]])

List
List[c("Character", "Logic")]
List[c(1,2)]

List$Number

names(List)[2] <- "Num"
List

names(List) <- c("List", "Cha", "Log")
List

DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
DF

HeightBySex <- split(DF$height, DF$sex)
HeightBySex

mean(HeightBySex[[1]])

mean(HeightBySex[[2]])

sapply(HeightBySex, mean)

sapply(HeightBySex, sd)

sapply(HeightBySex, range)

DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
DF

Freq <- table(DF$bloodtype)
Freq

ReleativeFreq <- prop.table(Freq)
ReleativeFreq

Table <- rbind(Freq, ReleativeFreq)
Table

Table <- addmargins(Table, margin=2)
Table


DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
DF

FactorOfHeight <- cut(DF$height, breaks=4)
FactorOfHeight

FreqOfHeight <- table(FactorOfHeight)
FreqOfHeight 

FreqOfHeight <- rbind(FreqOfHeight, prop.table(FreqOfHeight))
FreqOfHeight 


rownames(FreqOfHeight)[2] <- "ReleativeFreq"

FreqOfHeight

CumuFreq <- cumsum(FreqOfHeight[2,])
CumuFreq

FreqOfHeight<- rbind(FreqOfHeight, CumuFreq)
FreqOfHeight

rownames(FreqOfHeight) <- c("도수", "상대도수", "누적도수")
FreqOfHeight

FreqOfHeight <- addmargins(FreqOfHeight, margin=2)
FreqOfHeight

DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
DF

CT <- table(DF$sex, DF$bloodtype)
CT

PropCT <- prop.table(CT, margin=1)
PropCT

addmargins(PropCT, margin=2)

a <- c(1,2,3,4,NA,6,7,8,9,10)
a

a <- a[complete.cases(a)]

a <- c(1,2,3,4,NA,6,7,8,9,10)
a <- na.omit(a)
a

library("hflights")

head(hflights, 5)

CountOfDest <- table(hflights$Dest)
CountOfDest

length(CountOfDest)

range(CountOfDest)

CountOfDest[CountOfDest == 1]
CountOfDest[CountOfDest == 9820]

SelectedDest <- CountOfDest[CountOfDest > 6000]
SelectedDest

addmargins(SelectedDest, margin=1)

barplot(SelectedDest)

DF <- read.csv("example_cancer.csv", fileEncoding="CP949")
DF


DegreeOfAge <- table(cut(DF$age, breaks=(1:11)*10))
DegreeOfAge


library("stringr")

temp <- str_split_fixed(DF[,1], "\\(", 2)
temp

DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
DF
attach(DF)
plot(weight,height)
plot(height~weight)

sex <- as.factor(sex)
sex

plot(height,sex)
plot(height~sex)


DF2 <- data.frame(height, weight)
DF2

plot(DF2)

DF2 <- cbind(DF2, age)
DF2

plot(DF2)

plot(weight~height, pch=as.integer(sex))

legend("topleft", c("남", "여"), pch=sex)

coplot(weight~height | sex)


1. csv 파일 읽어서 객체에 담기 -> read.csv(".csv", fileEncoding="CP949")
2. 데이터 프레임 생성 -> data.frame()
3. 도수, 상대도수, 누적상대도수 구하는 함수 -> table(), prop.table(), cumsum()
4. addmargins() -> margin=1열의 합, margin=2 행의합
5. 
6. 그래프 2행 3열로 만들기 -> par(mfrow=c(2, 3))
7. filter() -> filter(DF, Provinces=="충청북도" | Provinces=="충청남도")
8. 새로운 변수 추가 - mutate()
    -> mutate(DF, SexF = ifelse(SexRatio < 1, "여자비율높음",
		ifelse(SexRatio > 1, "남자비율높음", "남여비율같음")))
9. 도별 합
	-> group <- group_by(DF, Provinces)
	   DF2 <- summarise(group, SumPopuation=sum(Population), Male=sum(Male), Female=sum(Female))
10. 남녀 변수를 하나의 명목현 변수로 변경
	DF <- melt(DF, id.vars=c("Provinces", "SumPopulation"), 
		measure.vars=c("Male", "Female")

11. 데이터 csv 파일로 저장 -> write.csv(데이터픞레임, file="파일명.csv")
12. 조인 -> left_join(데이터, 데이터, by="기준컬럼")
13. 데이터프레임 합침 -> merge(데이터, 데이터, by="기준컬럼")

























































































































