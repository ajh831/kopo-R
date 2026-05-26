=============================================================
    # 6장. 5.지진 발생 지역 지도 출력
=============================================================
library(ggmap)
library(ggplot2)
library(openxlsx)
register_google(
	key = Sys.getenv("GOOGLE_API_KEY")
)

df <- read.xlsx(file.choose(), sheet=1, startRow=4)
head(df)

tail(df)

df [,6] <- gsub(" N", "", df [, 6] )
df [,7] <- gsub(" E", "", df [, 7])
df2 <- data.frame(lon=df [,7], lat=df [,6], mag=df [,3])
str (df2)

df2 [,1] <- as.numeric(as.character(df2[,1]))
df2[,2] <- as.numeric(as.character(df2[,2]))
str (df2)


cen <- c(
  (max(df2$lon, na.rm=TRUE) + min(df2$lon, na.rm=TRUE)) / 2,
  (max(df2$lat, na.rm=TRUE) + min(df2$lat, na.rm=TRUE)) / 2
)

cen

map <- get_googlemap(center=cen, zoom=6)

gmap <- ggmap(map)
gmap + geom_point(data=df2,
				aes(x=lon, y=lat),
				color="red",
				size=df2$mag,
				alpha=0.5)

=============================================================
    # 8장. 2. 뉴스 검색
=============================================================
install.packages("wordcloud")
install.packages("RmecabKo")
install.packages("XML")
install.packages("httr")

library(wordcloud)
library(RmecabKo)
library(XML)
library(httr)

install_mecab("C:/Rlibs/mecab")

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

doc <- content(response, "text", encoding = "UTF-8")

xmlFile <- xmlParse(doc)

df <- xmlToDataFrame(getNodeSet(xmlFile, "//item"))
str(df)
=============================================================
    # 8장. 3. 뉴스 내용 텍스트 마이닝
=============================================================
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

=============================================================
    # 8장. 4. 애국가 텍스트 마이닝
=============================================================
library(RmecabKo)
library(wordcloud2)
install_mecab("C:/Rlibs/mecab")

word_data <- readLines("애국가(가사).txt")
word_data

word_data2 <- gsub("\\d|<b>|</b>|&quot;", "", word_data)
word_data2

nouns <- nouns(iconv(word_data2, "utf-8"))
nouns

nouns.all <- unlist(nouns, use.names = F)
nouns.all

nouns.all2 <- nouns.all[nchar(nouns.all) >= 2]
nouns.all2

nouns.freq <- table(nouns.all2)
nouns.freq

nouns.df <- data.frame(nouns.freq, stringsAsFactors = F)
nouns.df

nouns.df.sort <- nouns.df[order(-nouns.df$Freq), ]
nouns.df.sort

wordcloud2(nouns.df.sort)

wordcloud2(nouns.df.sort, color="random-light", backgroundColor="black")

wordcloud2(nouns.df.sort, fontFamily="맑은고딕", size=1.2,
		color="random-light", backgroundColor="black", shape="star")

=============================================================
    # 8장. 5. 영문 텍스트 마이닝
=============================================================
install.packages("tm")

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
wordcloud(words=names(wordFreq),
		freq = wordFreq,
		scale = c(8, .4),
		min.freq = 2,
		rot.per = .5,
		random.order=F,
		random.color=T,
		colors=pal)

=============================================================
    # 8장. 6. 치킨집 분포 트리맵
=============================================================
install.packages("readxl")

library(readxl)

ck <- read_xlsx("치킨집_가공.xlsx")
head(ck)

addr <- substr(ck$소재지전체주소, 11, 16)
head(addr)

addr_num <- gsub("[0-9]", "", addr)
addr_trim <- gsub(" ", "", addr_num)
head(addr_trim)

install.packages("dplyr")

library(dplyr)
addr_count <- addr_trim %>% table() %>% data.frame()
head(addr_count)

install.packages("treemap")

library(treemap)
treemap(addr_count, index=".", vSize="Freq", title="서대문구 동별 치킨집 분포")

arrange(addr_count, desc(Freq)) %>% head(17)



































