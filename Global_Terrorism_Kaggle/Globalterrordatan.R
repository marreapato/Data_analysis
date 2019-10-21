library(tidyverse)
library(readxl)
library(xlsx)
library(readr)
globalterr <- read_csv("globalterrorismdb_0718dist.csv")

#analysing some collums for the sketch made in the data analysis course
#selecting collumns

globalterr <- globalterr[,-c(1,4,5,7,8,10,12,13,16,17,18,20:24,26,29,31:35,37,39:41,43:50)]
globalterr <- globalterr[,-c(16:23,25:29,31:34,37:50)]
globalterr <- globalterr[,-c(20:31,34:40,44:49)]
globalterr <- globalterr[,-c(26:44)]
globalterr <- globalterr[,-c(25)]
write.csv(globalterr,file="GlobalTerrorDatAn.csv",row.names = F)
