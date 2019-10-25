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

ggplot(terrorism,aes(x=region_txt))+geom_bar()+coord_flip()

ggplot(na.omit(as.data.frame(table(terrorism))),aes(x=Var1))+geom_bar()

ggplot(terrorism,aes(x=propextent_txt))+geom_bar()

summary(terrorism)

mean(propvalue,na.rm = T)

t.test(x =propvalue)















