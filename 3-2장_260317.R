# ------------------------------------------------------------------
# ------------------------------------------------------------------
# 예제1. 20만건 관측치가 넘는 데이터셋의 명목형 변수 ‘도수분포표‘ 만들기
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

# ------------------------------------------------------------------
4장 진도 후에 이어서 실습!!!!!
# ------------------------------------------------------------------
# 예제2. 대장암 환자 자료 분석
DF <- read.csv("example_cancer.csv", fileEncoding = "CP949")

## 데이터 구조 살펴보기
str(DF)

## 연령대별 도수값 구하기
DegreeOfAge <- table(cut(DF$age, breaks=(1:11)*10))
DegreeOfAge 






# ------------------------------------------------------------------
# ------------------------------------------------------------------
# 예제3. 전국 커피숍 폐업/영업 상황 살펴보기











# ------------------------------------------------------------------
# ------------------------------------------------------------------
# 예제4. 전국 커피숍 규모 파악하기








# ------------------------------------------------------------------
# ------------------------------------------------------------------
# 예제5. 전국 인구조사 자료 정리하기
install.packages("stringr")





























































