# 2장 복습
List <- read.csv("example_studentlist.csv", fileEncoding = "CP949")

List

List <- read.table("studentlist.txt", fileEncoding = "CP949")
List

List <- read.table("studentlist.txt", fileEncoding = "CP949", header=TRUE)
List

List <- read.table("studentlist2.txt", fileEncoding = "CP949", header=TRUE, sep=";")
List

library("readxl")
DF <- read_excel(path="studentlist.xlsx", sheet="Sheet1", col_names=TRUE)
DF

# 3-1장 복습
a1 <- c(5,3,6,3,1)
a1

a2 <- c("짬뽕", "짜장면", "짬뽕", "짬뽕", "짜장면")
a2

a3 <- c(3.62, 5.45, 2.54,3.67, 7.23)
a3

DF <- data.frame(a1,a2,a3)
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

DF <- read.csv("example_studentlist.csv", fileEncoding = "CP949")

DF[c(6,7)]

DF[c("bloodtype", "height")]

DF[,7]

DF[2,]

DF[2,1]

DF[,"height"]

DF <- read.csv("example_studentlist.csv", fileEncoding = "CP949")


attach(DF)

height

detach(DF)

DF <- read.csv("example_studentlist.csv", fileEncoding = "CP949")

subset(DF, subset=(height>170))

subset(DF, select=c(name, height), subset=(height>180))

subset(DF, select=-height)

subset(DF, select=c(-height, -weight))

subset(DF, subset=(height>170))

colnames(DF)

colnames(DF)[6] <- "blood"
DF 

OldList <- colnames(DF)
NewList <- c("na", "se", "ag", "gr", "ab", "bl", "he", "we")
colnames(DF) <- NewList
DF

DF <- read.csv("example_studentlist.csv", fileEncoding = "CP949")

BMI <- DF$weight/DF$height^2
BMI

DF <- cbind(DF, BMI)
DF




