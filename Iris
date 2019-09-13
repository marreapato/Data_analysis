install.packages("tidyverse")
library(tidyverse)
install.packages("ggthemes")
library(ggthemes)
iris
#pacotes e conjunto de dados carregados

#filtrando os conjuntos
setosa<-iris %>% filter(Species=="setosa")
summary(setosa)
virginica<-iris %>% filter(Species=="virginica")
summary(virginica)
versicolor<-iris %>% filter(Species=="versicolor")
summary(versicolor)

#teste t nas petalas
t.test(setosa$Petal.Length)
t.test(virginica$Petal.Length)
t.test(versicolor$Petal.Length)
t.test(setosa$Petal.Width)
t.test(virginica$Petal.Width)
t.test(versicolor$Petal.Width)
#TESTE NAS SEPALAS
t.test(setosa$Sepal.Length)
t.test(virginica$Sepal.Length)
t.test(versicolor$Sepal.Length)
t.test(setosa$Sepal.Width)
t.test(virginica$Sepal.Width)
t.test(versicolor$Sepal.Width)

#testes de correlacao
cor.test(setosa$Petal.Length,setosa$Petal.Width)
cor.test(versicolor$Petal.Length,versicolor$Petal.Width)
cor.test(virginica$Petal.Length,virginica$Petal.Width)

cor.test(setosa$Sepal.Length,setosa$Sepal.Width)
cor.test(versicolor$Sepal.Length,versicolor$Sepal.Width)
cor.test(virginica$Sepal.Length,virginica$Sepal.Width)


#graficos
plot1=ggplot(dado,aes(x=dado$Sepal.Length,y=dado$Sepal.Width,color=Species,fill=Species))+geom_point()+stat_smooth(se=F,method = "lm",color="red")+
  theme_few()+labs(x="Comprimento da sépala",y="Largura da sépala",color="Espécies")
plot2=ggplot(dado,aes(x=Petal.Length,y=Petal.Width,color=Species,fill=Species))+geom_point()+stat_smooth(se=F,method = "lm",color="red")+
  theme_few()+labs(x="Comprimento da pétala",y="Largura da pétala",color="Espécies")

require(gridExtra)#varios graficos em um plot

grid.arrange(plot1,plot2,ncol=2)

