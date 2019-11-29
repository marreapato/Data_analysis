library(tidyverse)
#summary statistics
#install.packages("psych")
#install.packages("pastecs")
#install.packages("skimr")

attach(terrorism)
terrorism <- read.csv("Terrorism.csv")
summary(terrorism)

#describe(terrorism)

terrorism90 <- terrorism %>% filter(iyear<=1990)
terrorism10 <- terrorism %>% filter(iyear>1990&iyear<=2010)
terrorism17 <- terrorism %>% filter(iyear>2010)


#describing data by region and period of time

sumkill90=terrorism90 %>% group_by("Region"=region_txt) %>%summarise(Deaths=sum(nkill,na.rm = T))
sumkill10=terrorism10 %>% group_by("Region"=region_txt) %>%summarise(Deaths=sum(nkill,na.rm = T))
sumkill17=terrorism17 %>% group_by("Region"=region_txt) %>%summarise(Deaths=sum(nkill,na.rm = T))

library(ggthemes)

#n people per region
#worldmeters info website https://www.worldometers.info/world-population/northern-america-population/

pop90 <- c(27298690,1393334798,309808641,148315647+139744811,279785259,)
pop10 <- c(36873081,62805088,1604859437,294872854,202940273+232426470,343287419,)
pop17 <- c(41006505,70867472,1659767995,294056056,232793214+266703737,361942268,)
