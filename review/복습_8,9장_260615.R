library(wordcloud)
library(RmecabKo)
library(XML)
library(httr)

searchUrl <- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- Sys.getenv("NAVER_CLIENT_ID")
Client_Secret <- Sys.getenv("NAVER_CLIENT_SECRET")

query <- URLencode(iconv("빅데이터", "euc-kr", "UTF-8"))

query <- URLencode("빅데이터")

url <- paste(searchUrl, "?query=", query, "&display=20", sep="")
url

response <- GET(url,
add_headers(
'X-Naver-Client-id' = Client_ID,
'X-Naver-Client-Secret' = Client_Secret
))

response

doc <- content(response, "text", encoding = "UTF-8")

doc

xmlFile <- xmlParse(doc)

df <- xmlToDataFrame(getNodeSet(xmlFile, "//item"))
str(df)

description <- subset(df, select=c(4))
description

description <- df[,4]
description

description2 <- gsub("[0-9]|<b>|</b>|&quot;", "", description)
description2


description2 <- gsub("\\d|<b>|</b>|&quot;", "", description)
description2

nouns <- nouns(iconv(description2, "utf-8"))
nouns

nouns.all <- unlist(nouns, use.names=F)
nouns.all

nouns.all1 <- nouns.all[nchar(nouns.all) <= 1]
nouns.all1

nouns.all2 <- nouns.all[nchar(nouns.all) >= 2]
nouns.all2

nouns.freq <- table(nouns.all2)
nouns.freq

nouns.df <- data.frame(nouns.freq, stringAsFactors=F)
nouns.df

nouns.df.sort <- nouns.df[order(-nouns.df$Freq), ]
nouns.df.sort

wordcloud(
nouns.df.sort[,1],
freq=nouns.df.sort[,2],
min.freq=1,
scale=c(5,0,7),
rot.per=0.25,
random.order=F,
random.color=T,
colors=rainbow(10))

library(wordcloud2)

wordcloud2(
nouns.df.sort
)

word_data <- readLines("애국가(가사).txt")
word_data

word_data2 <- gsub("\\d|<b>|</b>|&quot;", "", word_data)
word_data2

nouns <- nouns(iconv(word_data2, "utf-8"))
nouns

nouns.all <- unlist(nouns, use.names=T)
nouns.all

nouns.all2 <- nouns.all[nchar(nouns.all) >= 2]
nouns.all2

nouns.freq <- table(nouns.all2)
nouns.freq

nouns.df <- data.frame(nouns.freq, stringAsFactor=F)
nouns.df

nouns.df.sort <- nouns.df[order(-nouns.df$Freq), ]
nouns.df.sort

wordcloud2(
nouns.df.sort
)

wordcloud2(
nouns.df.sort,
color="random-light",
backgroundColor="black"
)

wordcloud2(
nouns.df.sort,
fontFamily="맑은고딕", 
size=1.2,
color="random-light",
backgroundColor="black",
shape="star")

library(tm)

text <- readLines("wordcloud.txt")
text

corpus <- VCorpus(VectorSource(text))
corpus

inspect(tm_map(tm_map(corpus, tolower), removePunctuation)[1])

corpus <- tm_map(corpus, content_transformer(stripWhitespace))
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, content_transformer(removePunctuation))
corpus <- tm_map(corpus, content_transformer(removeNumbers))
corpus <- tm_map(corpus, removeWords, stopwords('english'))

tdm <- TermDocumentMatrix(corpus)
tdm

m <- as.matrix(tdm)
m

wordFreq <- sort(rowSums(m), decreasing = TRUE)
wordFreq

library(wordcloud)
library(RColorBrewer)
pal <- brewer.pal(8, "Dark2")
wordcloud(
words=names(wordFreq),
freq = wordFreq,
scale = c(8, .4),
min.freq = 2,
rot.per = .5,
random.order=F,
random.color=T,
colors=pal
)

# ==========================================================================================
library(wordcloud)
library(RmecabKo)
library(XML)
library(httr)

searchUrl <- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- Sys.getenv("NAVER_CLIENT_ID")
Client_Secret <- Sys.getenv("NAVER_CLIENT_SECRET")

query <- URLencode(iconv("빅데이터", "euc-kr", "utf-8"))
query

query <- URLencode(iconv("빅데이터"))
query

url <- paste(searchUrl, "?query=", query, "&display=20", sep="")
url

response <- GET(url,
add_headers(
'X-Naver-Client-Id' = Client_ID,
'X-Naver-Client-Secret' = Client_Secret
))

response

doc <- content(response, "text", encoding="UTF-8")
doc <- content(response, as = "text", encoding = "UTF-8")

doc <- httr::content(response, as = "text", encoding = "UTF-8")
doc

xmlFile <- xmlParse(doc)
xmlFile

df <- xmlToDataFrame(getNodeSet(xmlFile, "//item"))
str(df)

description <- df[,4]
head(description)

description2 <- gsub("\\b|<b>|</b>|&quot;", "", description)
head(description2)

nouns <- nouns(iconv(description2, "utf-8"))
nouns

nouns.all <- unlist(nouns, use.names=F)
nouns.all

nouns.all1 <- nouns.all[nchar(nouns.all) <= 1]
nouns.all1

nouns.all2 <- nouns.all[nchar(nouns.all) >= 2]
nouns.all2

nouns.freq <- table(nouns.all2)
nouns.freq

nouns.df <- data.frame(nouns.freq, stringsAsFractors=F)
nouns.df

nouns.df.sort <- nouns.df[order(-nouns.df$Freq), ]
nouns.df.sort

wordcloud(
nouns.df.sort[,1],
freq = nouns.df.sort[,2],
min.freq = 1,
scale=c(5,0.7),
rot.per=0.25,
random.order=F,
random.color=T,
colors=rainbow(10))
)

wordcloud2(nouns.df.sort)

word_data <- readLines("애국가(가사).txt")
word_data

word_data2 <- gsub("\\d,<b>,</b>,&quot;", "", word_data)
word_data2

nouns <- nouns(iconv(word_data2, "utf-8"))
nouns

nouns.all <- unlist(nouns, use.names=F)
nouns.all

nouns.all2 <- nouns.all[nchar(nouns.all) >= 2]
nouns.all2

nouns.freq <- table(nouns.all2)
nouns.freq

nouns.df <- data.frame(nouns.freq, stringsAsFactors=F)
nouns.df

nouns.df.sort <- nouns.df[order(-nouns.df$Freq), ]
head(nouns.df.sort)

wordcloud2(nouns.df.sort)

wordcloud2(
nouns.df.sort,
color="random-light",
backgroundColor="black"
)

wordcloud2(
nouns.df.sort,
color="random-light",
size=1.2,
fontFamily="맑은고딕",
shape="star",
backgroundColor="dark"
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
corpus <- tm_map(corpus, content_transformer(removeNumbers))
corpus <- tm_map(corpus, removeWords, stopwords('english'))

tdm <- TermDocumentMatrix(corpus)
tdm

m <- as.matrix(tdm)
m

wordFreq <- sort(rowSums(m), decreasing=T)
wordFreq

library(wordcloud)
library(RColorBrewer)
pal <- brewer.pal(8, "Dark2")
wordcloud(words=names(wordFreq),
freq=wordFreq,
scale=c(8,.4),
min.freq=2,
rot.per=.5,
random.order=F,
random.color=T,
colors=pal)

# ===========================================================================================
library("sqldf")

DF <- read.csv("example_studentlist.csv", fileEncoding="CP949")
DF

Omit <- read.csv("omit.csv", fileEncoding="CP949")
Omit

sqldf("SELECT name, sex, age FROM DF")

sqldf("SELECT * FROM DF")

sqldf("SELECT * FROM DF WHERE age >= 23")

sqldf("SELECT * FROM DF WHERE age >= 23 AND age < 25")

sqldf("SELECT * FROM DF ORDER BY age DESC")

sqldf("SELECT * FROM DF ORDER BY age DESC, name")

sqldf("SELECT * FROM DF WHERE age <= 23
ORDER BY age DESC, name")

sqldf("SELECT * FROM DF WHERE name LIKE '김%'")

sqldf("SELECT * FROM DF WHERE name LIKE '%수'")

sqldf("SELECT * FROM DF WHERE name LIKE '%수%'")

sqldf("SELECT COUNT(*) '전체학생수' FROM DF")

sqldf("SELECT grade, COUNT(*) '반별학생수' FROM DF GROUP BY grade")

sqldf("SELECT grade, COUNT(*) '반별학생수' FROM DF GROUP BY grade
HAVING grade = 1 OR grade = 2")

DF <- DF[-1,]
DF
Omit <- Omit[-1,]
Omit

sqldf("SELECT d.name, d.sex, d.age, o.footsize
FROM DF d
INNER JOIN Omit o
ON d.NAME = o.NAME")

sqldf("SELECT d.name, d.sex, d.age, o.footsize
FROM DF d
LEFT JOIN Omit o
ON d.name = o.name")

sqldf("select d.name, d.sex, d.age, ifnull(o.footsize, 0)
from DF d
left join Omit o
on d.name = o.name")

sqldf("select d.name, d.sex, d.age, o.footsize
from DF d
full outer join Omit o
on d.name = o.name")

sqldf("select d.name, d.sex, d.age, o.footsize
from DF d
right join Omit o
on d.name = o.name")




































