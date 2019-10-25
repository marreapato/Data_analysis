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
























