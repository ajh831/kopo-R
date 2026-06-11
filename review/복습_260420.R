# 2장. R의 기초
print("Hello World")

factorial(9)
print(9*8*7*6*5*4*3*2*1)

rep(x="배고파", times=5)

plot(10, 10)

plot(c(5,7), c(20,30))

plot(runif(100), runif(100))

Object1 <- 1
Object2 <- 2

Object1
Object2

Object1 <- "문자열"
Object2 <- "데이터"

Object1 + Object2

paste(Object1, Object2)


Object1 <- TRUE
Object2 <- FALSE

Object1
Object2

Object1 <- sum(1,8,4,5,9)
Object1

a <- c(1, 3, 5, 6, 9)
a

a <- 1

is.vector(a)

a <- c(1,2,3,4)

is.vector(a)

a <- c(1, 2, "문자")
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

# install.package("rgl")
library(rgl)


example(plot3d)

library()


List <- read.csv("example_studentlist.csv", fileEncoding="CP949")
List

List <- read.table("studentlist.txt", fileEncoding="CP949")
List

List <- read.table("studentlist.txt", fileEncoding="CP949", header=TRUE)
List

List <- read.table("studentlist2.txt", fileEncoding="CP949", header=TRUE, sep=";")
List


library(readxl)

DF <- read_excel(path="studentlist.xlsx", sheet="Sheet1", col_names=FALSE)
DF

DF <- read_excel(path="studentlist.xlsx", sheet="Sheet1", col_names=TRUE)
DF

# 3-1장. 데이터 개념 이해하기
a1 <- c(5,3,6,3,1)
a1

type(a1)
is(a1)

a1 <- as.integer(a1)
a1

is(a1)

b <- c(1.23, 6.63452, 4.34234)
b
is(b)

a2 <- c("짬뽕", "짜장면", "짬뽕", "짬뽕", "짜장면")
a2

a3 <- c(7,3,7,5,2,"짜장면")
a3
is(a3)

a2

factor(a2)

is(a2)


a2 <- factor(a2)
a2

a2 <- factor(a2, ordered=T)
a2

a2 <- c("짬뽕", "짜장면", "짬뽕", "짬뽕", "짜장면", "탕수육")
a2
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

mean(DF$height)


Height <- DF$height
Height

DF

DF[[7]]

DF[7]

DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
DF

DF[c(6,7)]

DF[c("bloodtype", "height")]

DF[2,1]

DF[, "height"]



