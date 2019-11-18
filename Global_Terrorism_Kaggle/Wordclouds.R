library(tidyverse)
terrorism <- read.csv("Terrorism.csv")

name
#filtering by region and creating word cloud

listaregion=list()

listaregion$nortam <- terrorism %>% filter(region_txt=="North America")
listaregion$austr <- terrorism %>% filter(region_txt=="Australasia & Oceania")
listaregion$cent <- terrorism %>% filter(region_txt=="Central Asia")
listaregion$east <- terrorism %>% filter(region_txt=="Eastern Europe")
listaregion$centrame <- terrorism %>% filter(region_txt=="Central America & Caribbean")
listaregion$eastas <- terrorism %>% filter(region_txt=="East Asia")
listaregion$middleast <- terrorism %>% filter(region_txt=="Middle East & North Africa")
listaregion$southam <- terrorism %>% filter(region_txt=="South America")
listaregion$southas <- terrorism %>% filter(region_txt=="South Asia")
listaregion$southeasas <- terrorism %>% filter(region_txt=="Southeast Asia")
listaregion$subafr <- terrorism %>% filter(region_txt=="Sub-Saharan Africa")
listaregion$west <- terrorism %>% filter(region_txt=="Western Europe")

listaword<-list()
#install.packages("wordcloud")
#install.packages("tm")
library(wordcloud)
library(tm)
for(i in 1:12){

iconv(listaregion[[i]]$gname,to="UTF-8")
  
corpus<-Corpus(VectorSource(listaregion[[i]]$gname))
#setting the corpus structure

#you can also clean the text

#corpus<-tm_map(corpus,removeWords,c("DE"))

#creatting term documment matrix

tdm<-TermDocumentMatrix(corpus)
m<-as.matrix(tdm)
v<-sort(rowSums(m),decreasing = T)
diagn<-data.frame(word=names(v),freq=v)

#wordcloud for now
wordcloud(words=diagn$word,freq=diagn$freq,min.freq = 100,colors=brewer.pal(8,"Dark2"),max.words = 64,random.color = T,,rot.per = 0.2,random.order = F,scale = c(7,0.7))

}
#rot.per rotate the words, scale goes to the maximum at x-axis and minor in y-axis

#saving to make some maps

#listaperiodos=list()
#listaperiodos$until90 <-terrorism %>%  filter(iyear<=1990)
#listaperiodos$until210 <- terrorism %>% filter(iyear>1990&iyear<=2010)
#listaperiodos$untl217 <- terrorism %>% filter(iyear>2010)

#write.csv(listaperiodos$until90$country_txt,file="terror90.csv",row.names = F)
#write.csv(listaperiodos$until210$country_txt,file="terror2010.csv",row.names = F)
#write.csv(listaperiodos$untl217$country_txt,file="terror2017.csv",row.names = F)
listab=list()
for(i in 1:12){
listab[[i]]=table(as.character(listaregion[[i]]$country_txt))
}
names(listab)=names(listaregion)#names

