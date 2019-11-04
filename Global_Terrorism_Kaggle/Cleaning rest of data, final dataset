library(tidyverse)
library(ggthemes)
library(readr)

GlobalTerrorDatAn <- read_csv("GlobalTerrorDatAn.csv")
#importing data
View(GlobalTerrorDatAn)

#taking out negative values, except for the spatial data ones

globalatlon <- GlobalTerrorDatAn[,c(6,7)]#saving lat and long

globnolatlon <- GlobalTerrorDatAn[,-c(6,7)]#taking out lat and long

globnolatlon[globnolatlon<0] <- NA

terrorism<-cbind(globnolatlon,globalatlon) 

attach(terrorism)

terrorism[terrorism=="Unknown"] <- NA

summary(terrorism)#taking a brief look in data's behaviour

mean(propvalue,na.rm = T)

t.test(x =propvalue)#t test for the mean

write.csv(terrorism,file = "Terrorism.csv",row.names = F)#writing as csv













