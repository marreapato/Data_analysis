#importing .sav archive
library(foreign)
food <- read.spss("Alimentos.sav")
food <- as.data.frame(food)

#loading some packages
library(tidyverse)
#install.packages("tidyverse")
summary(food)

require(graphics)#pca graphics package

library(RColorBrewer)#color pallete

#first collumn as row names

rownames(food) <- food[,1]

food <- food[,-1]

## the variances of the variables in the

prcomp(food,scale= T)

summary(prcomp(food,scale=T)) # inappropriate
?brewer.pal
biplot(prcomp(food),scale=T)

#?biplot
#install.packages("ggfortify")
#library(ggfortify)

cor(food)

#cluster analysis






