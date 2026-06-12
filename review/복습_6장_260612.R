library(kormaps2014)

str(kormap1)

str(korpop1)

library(ggplot2)

ggplot(data = korpop1, aes(map_id = code, fill = 총인구_명)) +
geom_map(map = kormap1, color = "black", size = 0.2) +
expand_limits(x = kormap1$long, y = kormap1$lat) +
scale_fill_gradientn(colours = c("yellow", "red", "purple"),
labels = scales::comma)

library(maps)

us_map <- map_data("state")
head(us_map, 3)

head(USArrests, 3)

state <- tolower(rownames(USArrests))
crime_map <- data.frame(region = state, USArrests)
rownames(crime_map) <- NULL
head(crime_map)

library(ggiraphExtra)
ggChoropleth(data = crime_map, aes(fill = Murder, map_id = region),
map = us_map,
interactive = T)

library(ggpolot2)
library(ggiraphExtra)
library(kormaps2014)
ggChoropleth(data = korpop1,
aes(fill=총인구_명, map_id=code),
map=kormap1)

ggChoropleth(data=korpop3,
aes(fill=총인구_명,
map_id=code,
tooltip=name),
map=kormap3,
interactive=T)

str(tbc)

ggChoropleth(data=tbc,
aes(fill=NewPts, map_id=code),
map=kormap1)

install.packages("ggmap")

library(ggmap)

register_google(
	key = Sys.getenv("GOOGLE_API_KEY")
)

map <- get_googlemap(center=c(126.975684, 37.572752))
ggmap(map)

map <- get_googlemap(center=c(126.975684, 37.572752),
maptype="roadmap")

ggmap(map)

map <- get_googlemap(center=c(126.975684, 37.572752),
maptype="roadmap",
zoom=17)

ggmap(map)

map <- get_googlemap(center=c(126.975684, 37.572752),
maptype="roadmap",
zoom=17,
size=c(320,320))

ggmap(map)

map <- get_googlemap(center=c(126.975684, 37.572752),
maptype="roadmap",
zoom=17,
size=c(320,320))

ggmap(map, extent="device")

gc <- geocode(enc2utf8("호미곶"))

gc

lonlat <- c(gc$lon, gc$lat)
lonlat

map <- get_googlemap(center=lonlat)
ggmap(map)

gc <- geocode(enc2utf8("호미곶"))
lonlat <- c(gc$lon, gc$lat)
map <- get_googlemap(center=lonlat, marker=gc)

ggmap(map)

library(ggmap)
library(ggplot2)
library(openxlsx)
register_google(key = Sys.getenv("GOOGLE_API_KEY"))
df <- read.xlsx(file.choose(), sheet=1, startRow=4)

head(df)

tail(df)


library(ggmap)

register_google(key=Sys.getenv("GOOGLE_API_KEY"))
map <- get_googlemap(center=c(126.975684, 37.572752))
ggmap(map)

map <- get_googlemap(center=c(126.975684, 37.572752),
maptype="roadmap")

ggmap(map)


map <- get_googlemap(center=c(126.975684, 37.572752),
maptype="roadmap",
zoom=17)

ggmap(map)


map <- get_googlemap(center=c(126.975684, 37.572752),
maptype="roadmap",
zoom=17,
size=c(320,320))

ggmap(map)

map <- get_googlemap(center=c(126.975684, 37.572752),
maptype="roadmap",
zoom=17,
size=c(320,320))

ggmap(map, extent="device")

gc <- geocode(enc2utf8("호미곶"))
gc
lonlat <- c(gc$lon, gc$lat)
lonlat

map <- get_googlemap(center=lonlat)
ggmap(map)

gc <- geocode(enc2utf8("호미곶"))
gc

lonlat <- c(gc$lon, gc$lat)
lonlat

map <- get_googlemap(center=lonlat)
map

ggmap(map)

gc <- geocode(enc2utf8("호미곶"))
lonlat <- c(gc$lon, gc$lat)
map <- get_googlemap(center=lonlat, marker=gc)
ggmap(map)


library(ggmap)
library(ggplot2)

register_google(key = Sys.getenv("GOOGLE_API_KEY"))

names <- c("도담삼봉/석문", "구담/옥순봉", "사인암", "하선암", "중선암", "상선암")
addr <- c("충청북도 단양군 매포읍 삼봉로 644-33",
"충청북도 단양군 단성면 월악로 3827",
"충청북도 단양군 대강면 사인암2길 42",
"충청북도 단양군 단성면 선암계곡로 1337",
"충청북도 단양군 단성면 선암계곡로 868-2",
"충청북도 단양군 단성면 선암계곡로 790")

gc <- geocode(addr)
gc
df <- data.frame(name=names, lon=gc$lon, lat=gc$lat)
df

cen <- c((max(df$lon) + min(df$lon))/2,
(max(df$lat)+min(df$lat))/2)
cen

map <- get_googlemap(center=cen,
maptype="roadmap",
zoom=12,
marker=gc)

ggmap(map)


gmap <- ggmap(map)
gmap + geom_text(data=df,
aes(x=lon, y=lat),
size=5,
label=df$name)

library(ggmap)
library(ggplot2)
library(openxlsx)
register_google(key=Sys.getenv("GOOGLE_API_KEY"))


df <- read.xlsx(file.choose(), sheet=1, startRow=4)

head(df)
tail(df)

df[,6] <- gsub(" N", "", df[,6])
df[,7] <- gsub(" E", "", df[,7])

df2 <- data.frame(lon=df[,7], lat=df[,6], mag=df[,3])
str(df2)

df2[,1] <- as.numeric(as.character(df2[,1]))
df2[,2] <- as.numeric(as.character(df2[,2]))
str(df2)

cen <- c((max(df2$lon) + min(df2$lon))/2,
(max(df2$lat) +min(df2$lat))/2)
cen

map <- get_googlemap(center=cen, zoom=6)
gmap <- ggmap(map)
gmap + geom_point(data=df2,
aes(x=lon, y=lat),
color="red",
size=df$mag,
alpha=0.5)















































