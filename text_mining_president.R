#######################################################################
# 전현직 대통령 연설문 연습문제
#######################################################################
park <- file("data\\park.txt", encoding="UTF-8")
myline <- readLines(park)
myline
myword <- sapply(myline, extractNoun, USE.NAMES=F)
myword
result <- unlist(myword)
head(result, 20)
result2 <- Filter(function(x){ nchar(x) >=2 }, result)
head(result2, 20)
result3 <- Filter(function(x){nchar(x) ==3}, result)
head(result3, 20)
result4 <- Filter(function(x){nchar(x) >=2 & nchar(x) <= 4},result)
head(result4, 20)
result2<- gsub("것","",result2)
result2<- gsub("저","",result2)
result2<- gsub("원","",result2)
result2<- gsub("\\n","",result2)
result2<- gsub("\\d","",result2)
result2<- gsub("\\.","",result2)
head(result2, 20)
write(unlist(result2),"myresult.txt")
myword <- read.table("myresult.txt")
nrow(myword)
wordcount <- table(myword)
head(sort(wordcount, decreasing=T), 20)
palete <- brewer.pal(9, "Set1")
#x11()
wordcloud(
  names(wordcount),
  freq=wordcount,
  scale=c(5,1),
  rot.per=0.5,
  min.freq=4,
  random.order=F,
  random.color=T,
  colors=palete
)
a<-head(sort(wordcount, decreasing=T), 20)
pie(a, col=rainbow(10), radius=1)
pct<- round(a/sum(a)*100, 1)
names(a)
lab <- paste(names(a), "\n", pct, "%")
pie(a, mail="대통령연설문", col=rainbow(10), cex=0.8, lables=lab)
par(new=T)
pie(a, radius=0.6, col="white", lables=NA, border=NA)