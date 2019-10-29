library(tidyverse)
#install.packages("tidyverse")
library(readxl)
#install.packages("readxl")
reords <- read.csv2(file = "Track Records For Women.csv",header=F,dec='.')
reords

str(reords)

#names(reords)[names(reords)=="argentin"] <- "pais"

summary(reords)

records <- as.tibble(reords)

reords[,c(7)] <- as.numeric(reords[,c(7)])

head(records)
reords <- as.data.frame(reords)
record <- as.numeric(reords[,1])
reords
colnames(reorder)[,8] <- "Pais"


require(graphics)

## the variances of the variables in the
prcomp(reords[,c(1,2,3,4,5,6,7)],scale. = T)
summary(prcomp(reords[,c(1,2,3,4,5,6,7)],scale. = T)) # inappropriate

biplot(prcomp(reords[,1:7], scale = T))
?biplot
#install.packages("ggfortify")
#library(ggfortify)

cor(reords[,1:7])

row.names(reords) <- reords$V8
colnames(reords) <- c("sp100","sp200","sp400","sp800","sp1500","sp3000","marathon")

summary(prcomp(reords[,c(1:7)], scale = TRUE))

biplot(prcomp(reords[,1:7]),scale = T)





