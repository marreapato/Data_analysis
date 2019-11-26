library(tidyverse)
#summary statistics
#install.packages("psych")
#install.packages("pastecs")
#install.packages("skimr")
library(psych)
library(pastecs)
library(skimr)

attach(terrorism)
terrorism <- read.csv("Terrorism.csv")
summary(terrorism)

#describe(terrorism)



#describing data by region

sumkill=terrorism %>% group_by("Region"=region_txt) %>%summarise(Deaths=sum(nkill,na.rm = T))
library(ggthemes)
ggplot(sumkill,aes(x=reorder(sumkill$region,-sumkill$`sum(nkill, na.rm = T)`),y=sumkill$`sum(nkill, na.rm = T)`,fill=region))+geom_col()+theme_fivethirtyeight()+scale_fill_ptol()+theme(legend.position = "none")+
  labs(y="Frequency",title = "Number of kills per region from 1970 to 2017",x="Regions")+geom_text(aes(label=sumkill$`sum(nkill, na.rm = T)`),vjust=-0.1) +coord_flip() 


#n of kills per region
killregion <- as.data.frame(sumkill)
population <- c()#source:https://www.worldometers.info/
#deaths per terrorist attack per region
freqregion<-as.data.frame(table(terrorism$region_txt))
killregion <- as.data.frame(sumkill)
regionocurr <- cbind(sumkill,Attacks=freqregion$Freq)
population <- c()#source:https://www.worldometers.info/

regionocurr <- regionocurr %>% mutate(deathperat=(Deaths/Attacks))

#terrorist groups in iraq
iraqt <- terrorism %>% filter(country_txt=="Iraq")
terroiraq <- as.data.frame(table(iraqt$gname)) %>% filter(Freq>0)

menor <- terrorism %>% filter(terrorism$iyear<1990)
