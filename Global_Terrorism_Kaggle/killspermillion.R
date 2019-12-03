library(tidyverse)
#summary statistics
#install.packages("psych")
#install.packages("pastecs")
#install.packages("skimr")


terrorism <- read.csv("Terrorism.csv")
attach(terrorism)
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

pop90 <- c(27298690,113383693+34058163,1393334798,309808641,148315647+139744811,279785259,295398205,1189861413,444464203,70855105,175509660)
pop10 <- c(36873081,157591319+41217360,62805088,1604859437,294872854,202940273+232426470,343287419,392543709,1712555453,596947245,131622126,188126307)
pop17 <- c(41006505,173326771+43002434,70867472,1659767995,294056056,232793214+266703737,361942268,419903918,1873241092,648459731,164038988,193885820)

popkill90 <- cbind(sumkill90,Population=pop90)
popkill10 <- cbind(sumkill10,Population=pop10)
popkill17 <- cbind(sumkill17,Population=pop17)

#getting kills per million

popkill90 <- popkill90 %>% mutate("Number of deaths per one million"=(Deaths/Population)*1000000)
popkill10 <- popkill10 %>% mutate("Number of deaths per one million"=(Deaths/Population)*1000000)
popkill17 <- popkill17 %>% mutate("Number of deaths per one million"=(Deaths/Population)*1000000)

popkill90$`Number of deaths per one million` <- round(popkill90$`Number of deaths per one million`,digits = 2)
popkill10$`Number of deaths per one million` <- round(popkill10$`Number of deaths per one million`,digits = 2)
popkill17$`Number of deaths per one million`<- round(popkill17$`Number of deaths per one million`,digits = 2)

library(readxl)
library(readODS)
?write_ods
write_ods(popkill90,"Population90.ods")
write_ods(popkill10,"Population10.ods")
write_ods(popkill17,"Population17.ods")
