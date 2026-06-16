DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
head(DF)

search()
attach(DF)

mean(height, na.rm=T)

median(height, na.rm=T)
range(height, na.rm=T)

quantile(height, na.rm=T)

IQR(height, na.rm=T)

summary(height, na.rm=T)

boxplot(height)

cor(height, weight)

cor.test(height, weight)

cor(DF[, c(3,7,8)])

cor(height, weight, use="complete.obs")

DF2 <- DF
DF2[2,7] <- NA
DF2[4,8] <- NA
DF2

detach(DF)
attach(DF2)

cor(height, weight, use="everything")
cor(height, weight, use="all.obs")
var(height, na.rm=T)
var(height, weight, na.rm=T)
var(DF[,c(3,7,8)], na.rm=T)

sd(height, na.rm=T)

scale(height)

sd(height, na.rm=T) / mean(height, na.rm=T)
sd(weight, na.rm=T) / mean(weight, na.rm=T)

DF <- read.csv("example_salary.csv", fileEncoding="CP949", na="-")
head(DF, 5)

colnames(DF) <- c("age", "salary", "specialSalary", "workingTime", "numberOfWorker", "career", "sex")

str(DF)

search()
detach(DF2)
attach(DF)

Mean <- mean(salary, na.rm=T)
Mid <- median(salary, na.rm=T)
Range <- range(salary, na.rm=T)

w <- which(salary == 4064286)
DF[w,]

Qnt <- quantile(salary, na.rm=T)

Salary <- list(
평균월급=Mean,
중앙값월급=Mid,
월급범위=Range,
월급사분위=Qnt
)
Salary

DF <- read.csv("example_salary", fileEncoding="CP949", na="-")
head(DF)

colnames(DF) <- c("age", "salary", "specialSalary", "workingTime", "numberOfWorker", "career", "sex")

temp <- tapply(salary, sex, mean, na.rm=T)
temp

library(ggplot2)
library(reshape2)
melt <- melt(temp)
melt

ggplot(
melt,
aes(x=Var1, y=value, fill=Var1)) + 
geom_bar(
stat="identity"
)

tapply(salary, sex, sd, na.rm=T)
tapply(salary, sex, range, na.rm=T)

temp <- tapply(salary, career, mean, na.rm=T)
temp

melt <- melt(temp)
melt

ggplot(melt, aes(x=Var1, y=value, group=1)) +
geom_line(colour="skyblue2", size=2) +
coord_polar() +
ylim(0, max(melt$value))

tapply(salary, career, sd, na.rm=T)

tapply(salary, career, range, na.rm=T)

a1 <- DF[which(salary == 1172399),]
a2 <- DF[which(salary == 1685204),]
a3 <- DF[which(salary == 1117605),]
a4 <- DF[which(salary == 1245540),]
a5 <- DF[which(salary == 1548036),]
list <- list(a1,a2,a3,a4,a5)
list

DF <- read.csv("example_cancer.csv", fileEncoding="CP949", na="기록없음")
DF
str(DF)
search()
detach(DF)
attach(DF)

mean(age, na.rm=T)

summary(age)

boxplot(age, range=1.5)

distIQR <- IQR(age, na.rm=T)
distIQR

posIQR <- quantile(age, prob=c(0.25, 0.75), na.rm=T)
posIQR

DownWhisker <- posIQR[[1]] - distIQR*1.5
UpWhisker <- posIQR[[2]] + distIQR*1.5

DownWhisker; UpWhisker

Outlier <- subset(DF, subset=(DownWhisker > age | UpWhisker < age))
Outlier

DF <- read.csv("example_salary.csv", fileEncoding="CP949", na="-")
head(DF, 5)

colnames(DF) <- c("age", "salary", "specialSalary", "workingTime", "numberOfWorker", "career", "sex")
str(DF)

search()
detach(DF)
attach(DF)

Scale <- scale(salary)
head(Scale, 5)

DF <- cbind(DF, scale=Scale)
str(DF)

g1 <- ggplot(DF, aes(x=scale, y=age))
g2 <- geom_segment(aes(yend=age), xend=0)
g3 <- g1 + g2 + geom_point(
size=7,
aes(color=sex,
shape=career)
) + theme_minimal()
g3

library(ggmap)

register_google(key=Sys.getenv("GOOGLE_API_KEY"))

map <- get_googlemap(
center=c(126.975684, 37.572752)
)
ggmap(map)

map <- get_googlemap(
center=c(126.975684, 37.572752),
maptype="roadmap"
)
ggmap(map)

map <- get_googlemap(
center=c(126.975684, 37.572752),
maptype="roadmap",
zoom=17
)
ggmap(map)

map <- get_googlemap(
center=c(126.975684, 37.572752),
maptype="roadmap",
zoom=17,
size=c(320,320)
)
ggmap(map)

map <- get_googlemap(
center=c(126.975684, 37.572752),
maptype="roadmap",
zoom=17,
size=c(320,320)
)
ggmap(map, extent="device")

gc <- geocode(enc2utf8("호미곶"))
gc

lonlat <- c(gc$lon, gc$lat)
lonlat

map <- get_googlemap(
center=lonlat
)
ggmap(map)

gc <- geocode(enc2utf8("호미곶"))
gc

lonlat <- c(gc$lon, gc$lat)
lonlat

map <- get_googlemap(
center=lonlat,
marker=gc
)
ggmap(map)

names <- c("도담상봉/석문", "구담/옥순봉", "사인암", "하선암", "중선암", "상선암")

addr <- c(
"충청북도 단양군 매포읍 삼봉로 644-33",
"충청북도 단양군 단성면 월악로 3827",
"충청북도 단양군 대강면 사인암2길 42",
"충청북도 단양군 단성면  선암계곡로 1337",
"충청북도 단양군 단성면  선암계곡로 868-2",
"충청북도 단양군 단성면  선암계곡로 790"
)

gc <- geocode(enc2utf8(addr))
gc

df <- data.frame(
name=names,
lon=gc$lon,
lat=gc$lat
)

df

cen <- c(
(max(df$lon) + min(df$lon)) / 2,
(max(df$lat) + min(df$lat)) / 2
)
cen

map <- get_googlemap(
center=cen,
maptype="roadmap",
marker=gc,
zoom=12
)
ggmap(map)

gmap <- ggmap(map)

gmap + geom_text(
data=df,
aes(x=lon, y=lat),
size=5,
label=df$name
)

library(ggmap)
library(ggplot2)
library(openxlsx)
register_google(key=Sys.getenv("GOOGLE_API_KEY"))

df <- read.xlsx(file.choose(), sheet=1, startRow=4)
head(df)
tail(df)

df[,6] <- gsub(" N", "", df[,6])
df[,7] <- gsub(" E", "", df[,7])
lon <- df[,7]
lat <- df[,6]
mag <- df[,3]

df2 <- data.frame(lon, lat, mag)
str(df2)

df2[,1] <- as.numeric(as.character(df2[,1]))
df2[,2] <- as.numeric(as.character(df2[,2]))

str(df2)

cen <- c(
(max(df2$lon) + min(df2$lon)) / 2,
(max(df2$lat) + min(df2$lat)) / 2
)
cen

map <- get_googlemap(
center=cen,
zoom=6
)
gmap <- ggmap(map)

gmap + geom_point(
data=df2,
aes(x=df2$lon, y=df2$lat),
color="red",
size=df2$mag,
alpha=0.5
)

library(XML)

api <- "http://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst"
api_key <- Sys.getenv("DATA_GO_API")
api_key

returnType<-"xml"
numOfRows<-10
pageNo<-1
itemCode<-"PM10"
dataGubun<-"HOUR"
searchCondition<-"MONTH"

url <- paste(api,
"?serviceKey=", api_key,
"&returnType=", returnType,
"&numOfRows=", numOfRows,
"&pageNo=", pageNo,
"&itemCode=", itemCode,
"&dataGubun=", dataGubun,
"&searchCondition=", searchCondition,
sep=""
)

url

xmlFile <- xmlParse(url)
xmlRoot(xmlFile)

df <- xmlToDataFrame(getNodeSet(xmlFile, "//items/item"))
head(df)

ggplot(df, aes(x=dataTime, y=seoul, fill=dataTime)) +
geom_bar(stat="identity", fill="green")

ggplot(df, aes(x=dataTime, y=seoul, fill=dataTime)) +
geom_bar(stat="identity", fill="green") +
theme(axis.text.x=element_text(angle=90)) +
labs(
title="시간대별 서울지역의 미세먼지 농도 변화",
x="측정일시",
y="농도"
)

ggplot(df, aes(x=dataTime, y=seoul, fill=dataTime)) +
geom_bar(stat="identity") +
theme(axis.text.x=element_text(angle=90)) +
labs(
title="시간대별 서울지역의 미세먼지 농도 변화",
x="측정일시",
y="농도"
) +
scale_fill_manual(values=rainbow(10))

ggplot(df, aes(x=dataTime, y=seoul, fill=dataTime)) +
geom_bar(stat="identity") +
theme(axis.text.x=element_text(angle=90),
legend.position="none"
) +
labs(
title="시간대별 서울지역의 미세먼지 농도 변화",
x="측정일시",
y="농도"
) +
scale_fill_manual(values=rainbow(10))

ggplot(df, aes(x=dataTime, y=seoul, fill=dataTime)) +
geom_bar(stat="identity") +
theme(legend.position="none") +
labs(
title="시간대별 서울지역의 ...",
x="측정일시",
y="농도") +
scale_fill_manual(values=rainbow(10)) +
coord_flip()

api <- "http://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst"

returnType<-"xml"
numOfRows<-10
pageNo<-1
itemCode<-"PM10"
dataGubun<-"HOUR"
searchCondition<-"MONTH"

url <- paste(api,
"?serviceKey=", api_key,
"&returnType=", returnType,
"&numOfRows=", numOfRows,
"&pageNo=", pageNo,
"&itemCode=", itemCode,
"&dataGubun=", dataGubun,
"&searchCondition=", searchCondition,
sep=""
)

xmlFile <- xmlParse(url)
xmlRoot(xmlFile)
df <- xmlToDataFrame(getNodeSet(xmlFile, "//items/item"))
head(df)

df <- subset(df, select=c(-dataTime, -dataGubun, -itemCode))
str(df)

pm <- df[1, 1:17]
pm

cities <- c("대구시", "충청남도", "인천시", "대전시", "경상북도",
"세종시", "광주시", "전라북도", "강원도", "울산시",
"전라남도", "서울시", "부산시", "제주시", "충청북도",
"경상남도", "경기도")

gc <- geocode(enc2utf8(cities))
gc

cities 

df2 <- data.frame(
지역명=cities,
미세먼지=t(pm),
경도=gc$lon,
위도=gc$lat,
stringsAsFactors=F
)
head(df2)

names(df2)[2] <- "미세먼지"

str(df2)

df2[,2] <- as.numeric(df2[,2])

gc <- geocode(enc2utf8("전라북도"))

cen <- as.numeric(gc)
cen

map <- get_googlemap(
center=cen,
zoom=7
)

gmap <- ggmap(map)

gmap + geom_point(
data=df2,
aes(x=경도, y=위도),
color=rainbow(length(df2$미세먼지)),
size=df2$미세먼지*0.3,
alpha=0.5
)


api <- "http://apis.data.go.kr/B551172/Kidney01/patientNumber"
api_key <- Sys.getenv("DATA_GO_API")

pageNo <- 1
numOfRows <- 10
centerNm <- URLencode("국립암센터")
fromYear <- "2010"
toYear <- "2019"
type <- "xml"

url <- paste(api,
"?serviceKey=", api_key,
"&pageNo=", pageNo,
"&numOfRows=", numOfRows,
"&centerNm=", centerNm,
"&fromYear=", fromYear,
"&toYear=", toYear,
"&type=", type,
sep="")

url

xmlFile <- xmlParse(url)

xmlRoot(xmlFile)

df <- xmlToDataFrame(getNodeSet(xmlFile, "//items/items"))
df

df2 <- subset(df, select=c(3:5))
df2
str(df2)

df2$ptAge <- as.numeric(df$ptAge)
str(df2)

critYr_f = table(df$critYr)
critYr_f

barplot(
critYr_f,
col=rainbow(10),
main="국립암센터...",
xlab="연도",
ylab="인원",
ylib=c(0, 20)
)

ptAge_f <- factor(
df2$ptAge %/% 10,
levels=c(3,4,5,6,7,8),
labels=c('30대', '40대', '50대', '60대', '70대', '80대')
)
ptAge_f
summary(ptAge_f)

ptSexCd_f <- factor(
df2$ptSexCd,
levels=c('M', 'F'),
labels=c('남성', '여성')
)
summary(ptSexCd_f)

ptSexAge_f <- table(ptSexCd_f, ptAge_f)
ptSexAge_f

barplot(
ptSexAge_f,
main="연령대에 따른 성별 분포 비교",
xlab="연령대",
ylab="인원수",
ylim=c(0, 35),
col=c('skyblue2', 'pink'),
legend=rownames(df2$PtSexCd_f)
)

df <- read.csv("치킨집_가공_26년.csv")
df

head(df)

addr <- substr(df$지번주소, 12, 16)
head(addr)

addr_num <- gsub("[0-9]", "", addr)
addr_trim <- gsub(" ", "", addr_num)

head(addr_trim)

library(dplyr)

addr_count <- addr_trim %>% table() %>% data.frame()

head(addr_count)

library("treemap")

treemap(
addr_count,
index=".",
vSize="Freq",
title="서대문구 동별 치킨집 분포"
)

arrange(addr_count, desc=T)

library(wordcloud)
library(RmecabKo)
library(XML)
library(httr)

searchUrl <- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- Sys.getenv("NAVER_CLIENT_ID")
Client_Secret <- Sys.getenv("NAVER_CLIENT_SECRET")

query <- URLencode(inconv("빅데이터", "euc-kr", "UTF-8"))
query <- URLencode("빅데이터")
query

url <- paste(searchUrl, "?query=", query, "&display=20", sep="")
url

response <- GET(
url,
add_headers(
	'X-Naver-Client-Id' = Client_ID,
	'X-Naver-Client-Secret' = Client_Secret
))

doc <- content(response, "text", encoding="UTF-8")

xmlFile <- xmlParse(doc)
xmlRoot(xmlFile)

df <- xmlToDataFrame(getNodeSet(xmlFile, "//item"))
str(df)

description <- df[,4]
description

description2 <- gsub("\\d|<b>|</b>|&quot;", "", description)
description2

nouns <- nouns(iconv(description2, "UTF-8"))
nouns

nouns.all <- unlist(nouns, use.names=F)
nouns.all

nouns.all1 <- nouns.all[nchar(nouns.all) <= 1]
nouns.all1

nouns.all2 <- nouns.all[nchar(nouns.all) >= 2]
nouns.all2

nouns.freq <- table(nouns.all2)
nouns.freq

nouns.df <- data.frame(nouns.freq, stringsAsFactors=F)
nouns.df

nouns.df.sort <- nouns.df[order(-nouns.df$Freq),]
head(nouns.df.sort)

wordcloud(
nouns.df.sort[,1],
freq=nouns.df.sort[,2],
min.freq=1,
scale=c(5,0.7),
rot.per=0.25,
random.order=F,
random.color=T,
colors=rainbow(10)
)

library(wordcloud2)

wordcloud2(nouns.df.sort)

word_data <- readLines("애국가(가사).txt")
word_data

word_data2 <- gsub("\\d|<b>|</b>|&quot;", "", word_data)
word_data2

nouns <- nouns(iconv(word_data2, "UTF-8"))
nouns

nouns.all <- unlist(nouns, use.names=F)
nouns.all

nouns.all2 <- nouns.all[nchar(nouns.all) >= 2]
nouns.all2

nouns.freq <- table(nouns.all2)
nouns.freq

nouns.df <- data.frame(nouns.freq, stringsAsFactors=F)
nouns.df

nouns.df.sort <- nouns.df[order(-nouns.df$Freq),]
nouns.df.sort

wordcloud2(nouns.df.sort)

wordcloud2(nouns.df.sort,
backgroundColor="black",
color="random-light"
)

wordcloud2(nouns.df.sort,
backgroundColor="black",
color="random-light",
size=1.2,
fontFamily="맑은고딕",
shape="star"
)

library(tm)

text <- readLines("wordcloud.txt")
text

corpus <- VCorpus(VectorSource(text))
corpus

inspect(tm_map(tm_map(corpus, tolower), removePunctuation)[1])

corpus <- tm_map(corpus, content_transformer(stripWhitespace))
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, content_transformer(removePunctuation))
corpus <- tm_map(corpus, removeWords, stopWords("english"))

tdm <- TermDocumentMatrix(corpus)
tdm

m <- as.matrix(tdm)
m

wordFreq <- sort(rowSums(m), decreasing=T)
wordFreq

pal <- brewer.pal(8, "Dark2")

wordcloud(
words=names(wordFreq),
freq=wordFreq,
scale=c(8,0.4),
min.freq=2,
rot.per=0.5,
random.order=F,
random.color=T,
colors=pal
)

text <- readLines("wordcloud.txt")
text

corpus <- VCorpus(VectorSource(text))
corpus

inspect(tm_map(tm_map(corpus, tolower), removePunctuation)[1])

corpus <- tm_map(corpus, content_transformer(stripWhitespace))
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, content_transformer(removePunctuation))
corpus <- tm_map(corpus, removeWords, stopwords('english'))

corpus

tdm <- TermDocumentMatrix(corpus)
tdm

m <- as.matrix(tdm)
m

wordFreq <- sort(rowSums(m), decreasing=T)
wordFreq

DF <- read.csv("example_cancer.csv", fileEncoding="CP949", na="기록없음")
DF
str(DF)
search()
detach(DF)
attach(DF)

mean(age, na.rm=T)

summary(age)

boxplot(age, range=1.5)

distIQR <- IQR(age, na.rm=T)
distIQR

posIQR <- quantile(age, prob=c(0.25, 0.75), na.rm=T)
posIQR

DownWhisker <- posIQR[[1]] - distIQR*1.5
UpWhisker <- posIQR[[2]] + distIQR*1.5

DownWhisker; UpWhisker

Outlier <- subset(DF, subset=(DownWhisker > age | UpWhisker < age))
Outlier

DF <- read.csv("example_salary.csv", fileEncoding="CP949", na="-")
head(DF, 5)

colnames(DF) <- c("age", "salary", "specialSalary", "workingTime", "numberOfWorker", "career", "sex")
str(DF)

search()
detach(DF)
attach(DF)

Scale <- scale(salary)
head(Scale, 5)

DF <- cbind(DF, scale=Scale)
str(DF)

g1 <- ggplot(
DF, aes(x=scale, y=age)
)
g2 <- geom_segment(aes(yend=age), xend=0)
g3 <- g1 + g2 + geom_point(
size=7,
aes(color=sex,
shape=career)
) + theme_minimal()

g3

library(ggplot)
library(ggmap)
library(reshape2)

names <- c("도담상봉/석문", "구담/옥순봉", "사인암", "하선암", "중선암", "상선암")

addr <- c(
"충청북도 단양군 매포읍 삼봉로 644-33",
"충청북도 단양군 단성면 월악로 3827",
"충청북도 단양군 대강면 사인암2길 42",
"충청북도 단양군 단성면  선암계곡로 1337",
"충청북도 단양군 단성면  선암계곡로 868-2",
"충청북도 단양군 단성면  선암계곡로 790"
)

register_google(key=Sys.getenv("GOOGLE_API_KEY"))

gc <- geocode(enc2utf8(addr))
gc

df <- data.frame(
name=names,
lon=gc$lon,
lat=gc$lat
)

df

cen <- c(
(max(df$lon) + min(df$lon)) / 2,
(max(df$lat) + min(df$lat)) / 2
)
cen

map <- get_googlemap(
center=cen,
maptype="roadmap",
marker=gc,
zoom=12
)
ggmap(map)

gmap <- ggmap(map)

gmap + geom_text(
data=df,
aes(x=lon, y=lat),
size=5,
label=df$name
)

library(openxlsx)
df <- read.xlsx(file.choose(), sheet=1, startRow=4)
df

df[,6] <- gsub(" N", "", df[,6])
df[,7] <- gsub(" E", "", df[,7])

lon <- df[,7]
lat <- df[,6]
mag <- df[,3]

df2 <- data.frame(lon, lat, mag)
df2
str(df2)

df2[,1] <- as.numeric(as.character(df2[,1]))
df2[,2] <- as.numeric(as.character(df2[,2]))

cen <- c(
(max(df2$lon) + min(df2$lon)) / 2,
(max(df2$lat) + min(df2$lat)) / 2
)
cen

map <- get_googlemap(
center=cen,
zoom=6
)

gmap <- ggmap(map)

gmap + geom_point(
data=df2,
aes(x=lon, y=lat),
color="red",
size=mag,
alpha=0.5
)

library(XML)

api <- "http://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst"
api_key <- Sys.getenv("DATA_GO_API")
api_key

returnType<-"xml"
numOfRows<-10
pageNo<-1
itemCode<-"PM10"
dataGubun<-"HOUR"
searchCondition<-"MONTH"

url <- paste(api,
"?serviceKey=", api_key,
"&returnType=", returnType,
"&numOfRows=", numOfRows,
"&pageNo=", pageNo,
"&itemCode=", itemCode,
"&dataGubun=", dataGubun,
"&searchCondition=", searchCondition,
sep=""
)

url

xmlFile <- xmlParse(url)
xmlRoot(xmlFile)

df <- xmlToDataFrame(getNodeSet(xmlFile, "//items/item"))
head(df)

ggplot(df, aes(x=dataTime, y=seoul, fill=dataTime)) +
geom_bar(stat="identity", fill="green")

ggplot(df, aes(x=dataTime, y=seoul, fill=dataTime)) +
geom_bar(stat="identity", fill="green") +
theme(axis.text.x=element_text(angle=90)) +
labs(
title="시간대별...",
x="측정일시",
y="농도"
)

ggplot(df, aes(x=dataTime, y=seoul, fill=dataTime)) +
geom_bar(stat="identity") +
theme(axis.text.x=element_text(angle=90)) +
labs(
title="시간대별...",
x="측정일시",
y="농도"
) +
scale_fill_manual(values=rainbow(10))

ggplot(df, aes(x=dataTime, y=seoul, fill=dataTime)) +
geom_bar(stat="identity") +
theme(axis.text.x=element_text(angle=90),
legend.position="none") +
labs(
title="시간대별...",
x="측정일시",
y="농도"
) +
scale_fill_manual(values=rainbow(10))

ggplot(df, aes(x=dataTime, y=seoul, fill=dataTime)) +
geom_bar(stat="identity") +
theme(legend.position="none") +
labs(
title="시간대별...",
x="측정일시",
y="농도"
) +
scale_fill_manual(values=rainbow(10)) +
coord_flip()

api <- "http://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst"

returnType<-"xml"
numOfRows<-10
pageNo<-1
itemCode<-"PM10"
dataGubun<-"HOUR"
searchCondition<-"MONTH"

url <- paste(api,
"?serviceKey=", api_key,
"&returnType=", returnType,
"&numOfRows=", numOfRows,
"&pageNo=", pageNo,
"&itemCode=", itemCode,
"&dataGubun=", dataGubun,
"&searchCondition=", searchCondition,
sep=""
)

xmlFile <- xmlParse(url)
xmlRoot(xmlFile)
df <- xmlToDataFrame(getNodeSet(xmlFile, "//items/item"))
head(df)

df <- subset(df, select=c(-dataTime, -dataGubun, -itemCode))
str(df)

pm <- df[1, 1:17]
pm

cities <- c("대구시", "충청남도", "인천시", "대전시", "경상북도",
"세종시", "광주시", "전라북도", "강원도", "울산시",
"전라남도", "서울시", "부산시", "제주시", "충청북도",
"경상남도", "경기도")

gc <- geocode(enc2utf8(cities))
gc

cities 

df2 <- data.frame(
지역명=cities,
미세먼지=t(pm),
경도=gc$lon,
위도=gc$lat,
stringsAsFactors=F
)
head(df2)

names(df2)[2] <- "미세먼지"

str(df2)

df2[,2] <- as.numeric(df2[,2])

gc <- geocode(enc2utf8("전라북도"))

cen <- as.numeric(gc)
cen

map <- get_googlemap(
center=cen,
zoom=7
)

gmap <- ggmap(map)

gmap + geom_point(
data=df2,
aes(x=경도, y=위도),
color=rainbow(length(df2$미세먼지)),
size=df2$미세먼지 * 0.3,
alpha=0.5
)



api <- "http://apis.data.go.kr/B551172/Kidney01/patientNumber"
api_key <- Sys.getenv("DATA_GO_API")

pageNo <- 1
numOfRows <- 10
centerNm <- URLencode("국립암센터")
fromYear <- "2010"
toYear <- "2019"
type <- "xml"

url <- paste(api,
"?serviceKey=", api_key,
"&pageNo=", pageNo,
"&numOfRows=", numOfRows,
"&centerNm=", centerNm,
"&fromYear=", fromYear,
"&toYear=", toYear,
"&type=", type,
sep="")

url

xmlFile <- xmlParse(url)

xmlRoot(xmlFile)

df <- xmlToDataFrame(getNodeSet(xmlFile, "//items/items"))
df

df2 <- subset(df, select=c(3:5))
df2
str(df2)

df2$ptAge <- as.numeric(df$ptAge)
str(df2)

critYr_f <- table(df2$critYr)
critYr_f

barplot(
critYr_f,
main="국립암센터...",
xlab="연도",
ylab="인원",
ylib=c(0,20),
col=rainbow(10)
)

ptAge_f <- factor(df2$ptAge %/% 10,
levels=c(3,4,5,6,7,8),
labels=c('30대', '40대', '50대', '60대', '70대', '80대')
)
summary(ptAge_f)

ptSexCd_f <- factor(df$ptSexCd,
levels=c('M', 'F'),
labels=c('남성', '여성')
)
summary(ptSexCd_f)

ptSexAge_f <- table(ptSexCd_f, ptAge_f)
ptSexAge_f

barplot(
ptSexAge_f,
main="연령대...",
xlab="연령대",
ylab="인원수",
ylim=c(0,35),
col=c("skyblue", "pink"),
legend=rownames(ptSexAge_f)
)


library(wordcloud)
library(RmecabKo)
library(XML)
library(httr)

searchUrl <- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- Sys.getenv("NAVER_CLIENT_ID")
Client_Secret <- Sys.getenv("NAVER_CLIENT_SECRET")

query <- URLencode(inconv("빅데이터", "euc-kr", "UTF-8"))
query <- URLencode("빅데이터")
query

url <- paste(searchUrl, "?query=", query, "&display=20", sep="")
url

response <- GET(
url,
add_headers(
	'X-Naver-Client-Id' = Client_ID,
	'X-Naver-Client-Secret' = Client_Secret)
)

doc <- content(response, "text", encoding="UTF-8")

xmlFile <- xmlParse(doc)
xmlRoot(xmlFile)

df <- xmlToDataFrame(getNodeSet(xmlFile, "//item"))
str(df)

description <- df[,4]
description2 <- gsub("\\d|<b>|</b>|&quot;", "", description)
description2

nouns <- nouns(iconv(description2, "utf-8"))
nouns

nouns.all <- unlist(nouns, use.names=F)
nouns.all

nouns.all1 <- nouns.all[nchar(nouns.all) <= 1]
nouns.all2 <- nouns.all[nchar(nouns.all) >= 2]
nouns.all2

nouns.freq <- table(nouns.all2)
nouns.freq

nouns.df <- data.frame(nouns.freq, stringsAsFactors=F)
nouns.df

nouns.df.sort <- nouns.df[order(-nouns.df$Freq),]
nouns.df.sort

wordcloud(
nouns.df.sort[,1],
freq=nouns.df.sort[,2],
min.freq=1,
scale=c(5,.7),
rot.per=0.25,
random.order=F,
random.color=T,
colors=rainbow(10)
)

library(tm)

text <- readLines("wordcloud.txt")
text

corpus <- VCorpus(VectorSource(text))
corpus

inspect(tm_map(tm_map(corpus, tolower), removePunctuation)[1])

corpus <- tm_map(corpus, content_transformer(stripWhitespace))
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, content_transformer(removePunctuation))
corpus <- tm_map(corpus, removeWords, stopwords('english'))

tdm <- TermDocumentMatrix(corpus)
tdm

m <- as.matrix(tdm)
m

wordFreq <- sort(rowSums(m), decreasing=T)
wordFreq


pal <- brewer.pal(8, "Dark2")

wordcloud(
words=names(wordFreq),
freq=wordFreq,
scale=c(8,.4),
min.freq=2,
rot.per=0.5,
random.order=F,
random.color=T,
colors=pal
)


DF <- read.csv("example_salary.csv", fileEncoding="CP949", na="-")
head(DF)

search()
detach(DF)
attach(DF)

colnames(DF) <- c("age", "salary", "specialSalary", "workingTime", "numberOfWorker", "career", "sex")

temp <- tapply(salary, sex, mean, na.rm=T)
temp

library(ggplot2)
library(reshape2)
melt <- melt(temp)
melt

ggplot(
melt,
aes(x=Var1, y=value, fill=Var1)) + 
geom_bar(
stat="identity"
)

tapply(salary, sex, sd, na.rm=T)
tapply(salary, sex, range, na.rm=T)

temp <- tapply(salary, career, mean, na.rm=T)
temp

melt <- melt(temp)
melt

ggplot(
melt,
aes(x=Var1, y=value, group=1)
) +
geom_line(
color="skyblue2",
size=2
) +
coord_polar() +
ylim(0, max(melt$value))






DF <- read.csv("example_salary.csv", fileEncoding="CP949", na="-")
head(DF)

colnames(DF) <- c("age", "salary", "specialSalary", "workingTime", "numberOfWorker", "career", "sex")

search()
detach(DF)
attach(DF)

Scale <- scale(salary)
DF <- cbind(DF, scale=Scale)
str(DF)

g1 <- ggplot(DF, aes(x=scale, y=age))
g2 <- geom_segment(aes(yend=age), xend=0)
g3 <- g1 + g2 + geom_point(size=7, aes(color=sex, shape=career)) + theme_minimal()
g3


















