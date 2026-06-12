install.packages("wordcloud")
install.packages("RmecabKo")
install.packages("XML")
install.packages("httr")

library(wordcloud)
library(RmecabKo)
library(XML)
library(httr)

install_mecab("C:/Ribs/mecab")

searchUrl <- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- Sys.getenv("NAVER_CLIENT_ID")
Client_Secret <- Sys.getenv("NAVER_CLIENT_SECRET")

query <- URLencode(iconv("빅데이터", "euc-kr", "UTF-8"))

url <- paste(searchUrl, "?query=", query, "&display=20", sep="")

response <- GET(url,
add_headers(
'X-Naver-Client-Id' = Client_ID,
'X-Naver-Client-Secret' = Client_Secret
))

doc <- content(response, "text", encoding="UTF-8")

xmlFile <- xmlParse(doc)

df <- xmlToDataFrame(getNodeSet(xmlFile, "//item"))
str(df)

description <- df[,4]
description

description2 <- gsub("\\d|<b>|</b>|&quot;", "", description)
description2

nouns <- nouns(iconv(description2, "utf-8"))
nouns

nouns.all <- unlist(nouns, use.names = F)
nouns.all

nouns.all1 <- nouns.all[nchar(nouns.all) <= 1]
nouns.all1

nouns.all2 <- nouns.all[nchar(nouns.all) >= 2]
nouns.all2

nouns.freq <- table(nouns.all2)
nouns.freq

nouns.df <- data.frame(nouns.freq, stringsAsFactors = F)
nouns.df

nouns.df.sort <- nouns.df[order(-nouns.df$Freq), ]
nouns.df.sort

wordcloud(nouns.df.sort[,1],
freq=nouns.df.sort[,2],
min.freq=1,
scale=c(5,0.7),
rot.per=0.25,
random.order=F,
random.color=T,
colors=rainbow(10))

install.packages("wordcloud2")

library(wordcloud2)
wordcloud2(nouns.df.sort)

word_data <- readLines("애국가(가사).txt")
word_data

word_data2 <- gsub("\\d|<b>|</b>|&quot;", "", word_data)
word_data2

nouns <- nouns(iconv(word_data2, "utf-8"))
nouns

install.packages("tm")

library(tm)















































