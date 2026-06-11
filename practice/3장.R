a1 <- c(5,3,6,3,1)
a1

is(a1)

a1 <- c(1L,2L,3L)
a1

is(a1)

a1 <- as.integer(a1)
is(a1)

b <- c(1.23, 6.63452, 4.34234)
b
is(b)

a2 <- c("짬뽕", "짜장면", "짬뽕", "짬뽕", "짜장면")
a2

is(a2)

a3 <- c(7,4,7,5,2,"짜장면")
a3
is(a3)

a2 <- as.factor(a2)
a2

is(a2)

a2 <- factor(a2, ordered=T)
a2

a1 <- c(5,3,6,3,1)
a1

a2 <- c("짬뽕", "짜장면", "짬뽕", "짬뽕", "짜장면")
a2

a3 <- c(3.62, 5.45, 2.54, 3.67, 7.23)
a3

DF <- data.frame(a1, a2, a3)
DF

DF <- data.frame(count=a1, food=a2, meanCount=a3)
DF


DF <- read.csv("example_studentlist.csv", fileEncoding = "CP949")
DF

is.vector(DF$height)

str(DF)

DF$height

mean(DF$height)

Height <- DF$height
Height

DF[[7]]

DF[7]

class(DF[[7]])

class(DF[7])

DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
DF


DF[c(6,7)]

DF[6,7]

DF[c("bloodtype", "height")]

DF[,7]

DF[2,]

DF[2,1]

DF[,"height"]

DF <- read.csv("example_studentlist.csv", fileEncoding = "CP949")
DF

attach(DF)

height

detach(DF)

height

subset(DF, subset=(height > 170))

subset(DF, select=c(name, height), subset=(height>180))

subset(DF, select=-height)

subset(DF, select=c(-height, -weight))

colnames(DF)

colnames(DF[6])

colnames(DF)[6] <- "blood"

colnames(DF)[6]

colnames(DF[6])


OldList <- colnames(DF)
OldList

NewList <- c("na", "se", "ag", "gr", "ab", "bl", "he", "we")
NewList

colnames(DF) <- NewList
DF


DF <- read.csv("example_studentlist.csv", fileEncoding = "CP949")
DF

BMI <- DF$weight/DF$height^2
BMI

DF <- cbind(DF, BMI)
DF

DF <- read.csv("example_studentlist.csv", fileEncoding = "CP949")
DF


Omit <- read.csv("omit.csv", fileEncoding = "CP949")
Omit

DF <- merge(DF, Omit, by="name")
DF

DF <- read.csv("example_studentlist.csv", fileEncoding = "CP949")
DF

AddCol <- data.frame(name="이미리", sex="여자", age="24",grade="4", absence="무", bloodtype="A", height=175.2, weight=51)
AddCol

DF <- rbind(DF, AddCol)
DF

DF <-read.csv("example_studentlist.csv", fileEncoding="CP949")
a <- c(1:20)
s <- c("파스타", "짬뽕", "순두부찌개", "요거트 아이스크림", "커피")
L <- c(T,F,F,T,T,T)

List <- list(DF, a, s, L)
List

List <- list(DataFrame=DF, Number=a, Character=s, Logic=L)
List

List[1] <- NULL

List["Number"]

List$Number

List[1]

class(List[1])

List[[1]]

List[c(2,3)]

List[c("Number", "Character")]

List$Number

class(List$Number)

List$Character

class(List$Character)

names(List)[2] <- "Num"
List[2]

List

names(List) <- c("Num", "Cha", "Log")
List

DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")

