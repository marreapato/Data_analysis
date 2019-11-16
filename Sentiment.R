text <- read.csv("text_emotion.csv")
#reading some libraries
library(tidyverse)
library(ggthemes)

ggplot(text,aes(sentiment,fill=sentiment))+geom_bar()+coord_flip()+
  theme_tufte()+theme(legend.position = "none")+scale_fill_stata()+labs(x="Sentiment",y="Frequency")

#getting the number of calls per tweet

text$count<- sapply(text$content, function(x) str_count(x, '@'))

maxAt <- max(text$count)

quantile(text$count)
sent=NULL
for(i in 1:length(text$sentiment)){
  if(text[i,2]=="neutral"||text[i,2]=="empty"||text[i,2]=="empty"){
  sent[i]="Neutral"  
  }else if(text[i,2]=="sadness"|text[i,2]=="worry"||text[i,2]=="hate"||text[i,2]=="boredom"||text[i,2]=="anger"){
sent[i]="Negative"    
  }else{
    sent[i]="Positive"
  }
}

text<-cbind(text,sent)
#plotting
tabdia<-table(text$sent)#tabela de frequencia
tabdia<-as.data.frame(tabdia)

ggplot(tabdia,aes(y=Freq,x=Var1,fill=Var1))+geom_col()+
  geom_text(aes(label=Freq),vjust=-0.1)  +
  theme_tufte()+theme(legend.position = "top")+scale_fill_stata()+labs(x="Sentiment",y="Frequency")+theme(legend.position = "none")



ggplot(text,aes(sent,count,fill=sentiment))+geom_col(position = "dodge")+
  theme_tufte()+theme(legend.position = "top")+scale_fill_stata()+labs(x="Sentiment",y="Frequency")
  
table(text$sent)




