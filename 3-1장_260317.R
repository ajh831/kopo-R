DF <- read.csv("example_studentlist.csv", fileEncoding = "CP949")

HeightBySex <- split(DF$height, DF$sex)
HeightBySex

mean(HeightBySex[[1]])

mean(HeightBySex[[2]])

sapply(HeightBySex, mean)

sapply(HeightBySex, sd)

sapply(HeightBySex, range)


# 5. 도수분포표 만들기 => 함수 외우기
## 예제1
DF <- read.csv("example_studentlist.csv", fileEncoding = "CP949")
DF
### 도수
Freq <- table(DF$bloodtype)
Freq
### 상대도수
ReleativeFreq <- prop.table(Freq)
ReleativeFreq

Table <- rbind(Freq, ReleativeFreq)
Table

### 합구하기
#### margin 생략: 행,열 합 / margin 1:열 합 / margin 2: 행 합
Table <- addmargins(Table, margin=2)
Table

## 예제2
DF <- read.csv("example_studentlist.csv", fileEncoding = "CP949")
DF
### 구간 나누기: cut
FactorOfHeight <- cut(DF$height, breaks=4)
FactorOfHeight

### 빈도수(도수): table
FreqOfHeight <- table(FactorOfHeight)
FreqOfHeight

### 상대도수: prop.table
FreqOfHeight <- rbind(FreqOfHeight, prop.table(FreqOfHeight))
FreqOfHeight

### 이름 바꾸기: rownames
rownames(FreqOfHeight)[2] <- "RelativeFreq"
FreqOfHeight

### 누적 상대 도수: cumsum
FreqOfHeight[2,]
CumuFreq <- cumsum(FreqOfHeight[2,])
CumuFreq

FreqOfHeight <- rbind(FreqOfHeight, CumuFreq)
FreqOfHeight

### 이름 바꾸기
rownames(FreqOfHeight) <- c("도수", "상대도수", "누적도수")
FreqOfHeight

### 합을 구하기
FreqOfHeight <- addmargins(FreqOfHeight, margin=2)
FreqOfHeight

## 예제3. 분할표 만들기
DF <- read.csv("example_studentlist.csv", fileEncoding = "CP949")

### 빈도수
CT <- table(DF$sex, DF$bloodtype)
CT

### 상대도수
PropCT <- prop.table(CT, margin=1)
PropCT

### 상대도수 합
addmargins(PropCT, margin=2)

## 결측치 확인: complete.cases(), na.omit()
a <- c(1,2,3,4,NA,6,7,8,9,10)
a

complete.cases(a)

### 결측치 제거
a <- a[complete.cases(a)]
a

### 결측치 완전 제거
a <- c(1,2,3,4,NA,6,7,8,9,10)
a

a <- na.omit(a)
a