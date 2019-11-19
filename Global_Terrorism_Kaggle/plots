library(tidyverse)
  #install.packages("tidyverse")
#summary statistics
#install.packages("psych")
#install.packages("pastecs")
#install.packages("skimr")
#library(psych)
#library(pastecs)
#library(skimr)
terrorism <- read.csv("Terrorism.csv")
attach(terrorism)
table(terrorism$region_txt)
summary(terrorism)

#describe(terrorism)
ggplot(data = terrorism, aes(x = iyear, y = nkill,color=region_txt))+
  geom_line()
#describing data by region

avgkill=terrorism %>% group_by(region=region_txt) %>%summarise(mean=round( mean(nkill,na.rm = T)),sd=round(sd(nkill,na.rm=T)),quartile3=trunc(quantile(nkill,probs = (0.75),na.rm=T)) )
avgkill
#average n of kills per region
#?quantile()
statsperp=terrorism %>% group_by(region_txt) %>% summarise(mean=round(mean(nperps,na.rm=T)),sd=round(sd(nperps,na.rm=T)),quartile3=trunc(median(nperps,na.rm=T)))
statsperp

propextreg<-terrorism[,c(20,5)]

library(ggthemes)
detach(terrorism)

#damage barplot
propextreg1 <-propextreg %>%  filter(propextent_txt=="Minor (likely < $1 million)")
propextreg2 <-propextreg %>%  filter(propextent_txt=="Major (likely >= $1 million but < $1 billion)")
propextreg3 <-propextreg %>%  filter(propextent_txt=="Catastrophic (likely >= $1 billion)")
?theme()
g1=ggplot(na.omit(propextreg1),aes(propextent_txt,fill=region_txt))+geom_bar(position = "dodge")+theme_few()+theme(legend.position = "none")+scale_fill_ptol()+labs(y="Frequency",title = "Damage caused per region",x="Regiões",fill="Regiões")+
  geom_text(stat='count',vjust=0.5, position = position_dodge(width = .9),aes(label=paste0(..count..))) 
g2=ggplot(na.omit(propextreg2),aes(propextent_txt,fill=region_txt))+geom_bar(position = "dodge")+theme_few()+scale_fill_ptol()+labs(y="Frequency",title="Damage caused per region",x="Regions",fill="Region")+
  geom_text(stat='count',vjust=0.5, position = position_dodge(width = .9),aes(label=paste0(..count..))) 
g3=ggplot(na.omit(propextreg3),aes(propextent_txt,fill=region_txt))+geom_bar(position = "dodge")+scale_fill_ptol()+theme_few()+labs(y="Frequency",title="Damage caused per region",x="Regions",fill="Region")+
  geom_text(stat='count',vjust=0.5, position = position_dodge(width = .9),aes(label=paste0(..count..))) 
                                                                                                 
#plotting with opnly one legend
#install.packages("digest")
library(digest)
library(gridExtra)
grid.arrange(g1, g2,g3, ncol=2)#i'm gonna see what to do here now,
#in order to be able to change the third plot

g3
#install.packages("devtools")

northam <-terrorism %>%  filter(region_txt=="North America")

westeur <- terrorism %>% filter(region_txt=="Western Europe")
westeur


westeurt <- table(westeur$country_txt)
westeurt <- as.data.frame(westeurt)
westeurt <- westeurt %>% filter(Freq>=1)

nort <- table(northam$country_txt)
nort <- as.data.frame(nort)
nort <- nort %>% filter(Freq>=1)
ggplot(nort,aes(x=reorder(nort$Var1,Freq),y=Freq,fill=nort$Freq))+geom_col()+coord_flip()+geom_text(aes(label=Freq),vjust=-0.1)+labs(y="Frequency",x="Countries",fill="Frequency",title="North american countries")+theme_fivethirtyeight()#+
# geom_text(stat='count',vjust=0.5, position = position_dodge(width = .9),aes(label=paste0(round(..count../sum(..count..)*100, 1), 
"%")))      
                                                                                           "%")))      
ggplot(westeurt,aes(x=reorder(westeurt$Var1,Freq),y=Freq,fill=westeurt$Freq))+geom_col()+coord_flip()+geom_text(aes(label=Freq),vjust=-0.1)+labs(y="Frequency",x="Countries",fill="Frequency",title="European countries")+theme_fivethirtyeight()+theme(legend.position = "none")#+
# geom_text(stat='count',vjust=0.5, position = position_dodge(width = .9),aes(label=paste0(round(..count../sum(..count..)*100, 1), 
"%")))      

cor.test(northam$nkill,northam$propvalue)#in north america

northcheck <- cbind(northam$nkill,northam$propvalue)

northcheck <- na.omit(northcheck)

northcheck <- as.data.frame(northcheck)

library(ggthemes)

terrorgrup <- as.data.frame(table(terrorism$gname))
terrog <-terrorgrup %>%  filter(Freq>=3000)
terrog

ggplot(terrog,aes(x=reorder(terrog$Var1,-Freq),y=Freq,fill=Var1))+geom_col()+theme_fivethirtyeight()+scale_fill_tableau()+theme(legend.position = "none")+
  labs(y="Frequency",title = "Groups with more than 3000 attacks registred",x="Groups")+geom_text(aes(label=Freq),vjust=-0.1) +coord_flip()
