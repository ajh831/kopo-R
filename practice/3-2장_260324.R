# ==============================================
#	       예제2. 대장암 환자 자료 분석
# ==============================================
DF <- read.csv("example_cancer.csv", fileEncoding="CP949")
DF

str(DF)

DegreeOfAge <- table(cut(DF$age, breaks=(1:11)*10))
DegreeOfAge

rownames(DegreeOfAge) <- c("10s", "20s", "30s", "40s", "50s", "60s", "70s", "80s", "90s", "100s")
DegreeOfAge

library("ggplot2")
library("ggthemes")
ggplot(data=DF, aes(x=age)) + geom_freqpoly(binwidth=10, size=1.4, colour="orange") + theme_wsj()


# ==============================================
#	  예제3. 전국 커피숍 폐업/영업 상황 살펴보기
# ==============================================
library("ggplot2")
library("ggthemes")
DF <- read.csv("example_coffee.csv", fileEncoding="CP949")

str(DF)

DF <- subset(DF, select=c(-adress, -adressBystreet, -dateOfclosure, -startdateOfcessation, -duedateOfcessation, -dateOfreOpen, -zip))

str(DF)

range(DF$yearOfStart, na.rm=T)

DFFilter <- subset(DF, subset=(stateOfbusiness=="운영중"))
range(DFFilter$yearOfStart, na.rm=T)
subset(DFFilter, subset=(yearOfStart==1967))

table(DF$yearOfStart)

qplot(yearOfStart, data=DF, geom="bar")

Freq <- table(DF$stateOfbusiness, DF$yearOfStart)
Freq

which(colnames(Freq)=="1997")
which.max(colnames(Freq))
Freq <- Freq[,c(30:47)]
Freq

PFreq <- prop.table(Freq, margin=2)
PFreq

NewDF <- data.frame(colnames(Freq), Freq[1,], Freq[2,], PFreq[1,], PFreq[2,])
NewDF

rownames(NewDF) <- NULL
colnames(NewDF) <- c("Time", "Open", "Close", "POpen", "Pclose")
NewDF

ggplot(NewDF, aes(x=factor(Time), y=Close, group=1)) +
geom_line(colour="steelblue1", size=1) +
geom_point(colour="steelblue", size=3) +
geom_line(aes(y=Open), colour="tomato2", size=1) +
geom_point(aes(y=Open), colour="red", size=6) +
theme_bw()


# ==============================================
#	     예제4. 전국 커피숍 규모 파악하기
# ==============================================
DF <- read.csv("example_coffee.csv", fileEncoding="CP949")

Size <- DF$sizeOfsite
str(Size)

summary(Size)

plot(Size)

Size[Size > 10000] <- NA
summary(Size)

Size[Size==0] <- NA
Size <- Size[complete.cases(Size)]
summary(Size)

DegreeOfSize <- table(cut(Size, breaks=(0:72)*20))
DegreeOfSize

library("ggplot2")
library("ggthemes")
ggplot(data=DF, aes(x=sizeOfsite)) +
geom_freqpoly(binwidth=10, size=1.2, colour="orange") +
scale_x_continuous(limits=c(0,300), breaks=seq(0,300,20)) +
theme_wsj()

# ==============================================
#	     예제5. 전국 인구조사 자료 정리하기
# ==============================================
DF <- read.csv("example_population.csv", fileEncoding="CP949")
str(DF)

head(DF,5)

install.packages("stringr")

library("stringr")

temp <- str_split_fixed(DF[,1], "\\(",2)

head(temp, 10)

NewCity <- str_split_fixed(temp[,1], " ", 2)
head(NewCity, 10)

colnames(NewCity) <- c("Provinces", "City")

DF <- data.frame(NewCity, DF[,c(2:7)])
head(DF,3)

DF[DF==" "] <- NA
head(DF,10)

DF <- DF[complete.cases(DF),]
head(DF,10)

for(i in 3:8) {
DF[,i] <- sapply(DF[,i], function(x) gsub(",", "", x))
DF[,i] <- as.numeric(DF[,i])
}
str(DF)

ProPopul <- tapply(DF$Population, DF$Provinces, sum)
ProPopul

library("ggplot2")
library("ggthemes")
Graph <- ggplot(DF, aes(x=Provinces, y=Population, fill=Provinces)) + geom_bar(stat="identity") + theme_wsj()
Graph + scale_y_continuous(labels = scales::comma)

# write.csv(DF, "example_population_f.csv")
















































































































































