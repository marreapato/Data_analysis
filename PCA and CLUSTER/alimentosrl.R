#importing .sav archive
library(foreign)
food <- read.spss("Alimentos.sav")
food<- as.data.frame(food)

#loading some packages
library(tidyverse)
#install.packages("tidyverse")
summary(food)

require(graphics)#pca graphics package

#first collumn as row names

rownames(food) <- food[,1]

food <- food[,-1]

t.test(food$Proteínas_g)
t.test(food$Energia_kcal)

## the variances of the variables in the

prcomp(food,scale= T)

summary(prcomp(food,scale=T)) # inappropriate
?brewer.pal
biplot(prcomp(food),scale=T)

#?biplot
#install.packages("ggfortify")
#library(ggfortify)
#correlation tests
cor(food)
cor.test(food$Energia_kcal,food$Lípidos_g)
cor.test(food$Cálcio_mg,food$Proteínas_g)
#cluster analysis

foodstandard <- scale(food)

#getting k-nearest neighbours

kmeansget <- kmeans(food,3)
attributes(kmeansget)

library(cluster)
clusplot(foodstandard, kmeansget$cluster, main='Cluster dos alimentos',
         color=TRUE, shade=TRUE,
         labels=2, lines=0,xlab = "Componente 1",ylab = "Componente 2")
?plot

