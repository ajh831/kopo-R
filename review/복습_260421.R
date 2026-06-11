# 3-1장. 데이터 개념 이해하기

DF <- read.csv("example_studentlist.csv", fileEncoding = "CP949")
DF

attach(DF)

height

detach(DF)

DF <- read.csv("example_studentlist.csv", fileEncoding = "CP949")
DF

subset(DF, subset=(height>170))

subset(DF, select=c(name, height), subset=(height>180))

subset(DF[-height])

subset(DF, select=-height)

subset(DF, select=c(-height, -weight))

DF <- read.csv("example_studentlist.csv", fileEncoding = "CP949")
DF

colnames(DF)

colnames(DF)[6]

colnames(DF)[6] <- "blood"
DF

colnames(DF) <- c("na", "se", "ag", "gr", "ab", "bl", "he", "we")
DF

OldList <- colnames(DF)
NewList <- c("na", "se", "ag", "gr", "ab", "bl", "he", "we")
colnames(DF) <- NewList
DF

DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
DF

BMI <- DF$weight/DF$height^2
BMI

DF <- cbind(DF, BMI)
DF

DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
DF

Omit <- read.csv("omit.csv", fileEncoding = "CP949")
Omit

merge(DF, Omit, by="name")

DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
DF

AddCol <- data.frame(name="이미리", sex="여자", age="24", grade=4, absence="무", bloodtype="A", height=175.2, weight=51)

AddCol

DF <- rbind(DF, AddCol)
DF

DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
DF

a <- c(1:20)
s <- c("파스타", "짬뽕", "순두부찌개", "요거트 아이스크림", "커피")
L <- c(T, F, F, T, T, T)

List <- list(DF, a, s, L)
List

List <- list(DataFrame=DF, Number=a, Character=s, Logic=L)
List

List[1] <- NULL

List

List["Number"]


List[1]

class(List[1])

List[[1]]

class(List[1])

is(List[1])

class(List[1])

List

List[c(2, 3)]

List[c("Character", "Logic")]

List[c("Number", "Character")]


List


List[[1]]

names(List)[2] <- "Num"
List[2]

List
names(List) <- c("Num", "Cha", "Log")
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
is(DF)

RelativeFreq <- prop.table(Freq)
RelativeFreq

Table <- rbind(Freq, RelativeFreq)
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

DF <- read.csv("example_studentlist.csv", fileEncoding="CP494")
DF

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





















































