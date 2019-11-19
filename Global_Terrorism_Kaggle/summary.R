library(tidyverse)
#summary statistics
#install.packages("psych")
#install.packages("pastecs")
#install.packages("skimr")
library(psych)
library(pastecs)
library(skimr)

attach(terrorism)

summary(terrorism)

#describe(terrorism)

terrorism <- read.csv("Terrorism.csv")

#describing data by region

sumkill=terrorism %>% group_by(region=region_txt) %>%summarise(sum(nkill,na.rm = T))
library(ggthemes)
ggplot(sumkill,aes(x=reorder(sumkill$region,-sumkill$`sum(nkill, na.rm = T)`),y=sumkill$`sum(nkill, na.rm = T)`,fill=region))+geom_col()+theme_fivethirtyeight()+scale_fill_ptol()+theme(legend.position = "none")+
  labs(y="Frequency",title = "Number of kills per region from 1970 to 2017",x="Regions")+geom_text(aes(label=sumkill$`sum(nkill, na.rm = T)`),vjust=-0.1) +coord_flip() 


#n of kills per region
#?quantile()
statsperp=terrorism %>% group_by(region_txt) %>% summarise(mean=round(mean(nperps,na.rm=T)),sd=round(sd(nperps,na.rm=T)),quartile3=trunc(quantile(nperps,probs = (0.75),na.rm=T)))
