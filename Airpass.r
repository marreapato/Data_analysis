#analise do air passengers
library(tidyverse)
data("AirPassengers")
dados<-AirPassengers
dados

class(dados)#<-----classe ts

summary(dados)
cycle(dados)#aqui sao os ciclos de acordo com os anos

plot(dados)
abline(reg=lm(dados~time(dados)))
#vendo a funcao arima
#determinar o valor de p,q e d
plot(diff(log(dados)))

#o valor de d sera 1 pois precisamos de apenas uma diferenciacao para fazer a media constante
acf(diff(log(dados)))#o valor de q sera 1
pacf((diff(log(dados))))#o valor de p sera 0

#modelo arima
modelo<-arima(log(dados),c(0,1,1),seasonal = list(order=c(0,1,1),period=12))

#o objetivo sera predizer os valores para os dias atuais ate o prox ano

pred<-predict(modelo,n.ahead = 60*12)
#tirar o logaritmo dos valores
pred1<-exp(1)^pred$pred#convertendo
pred1
ts.plot(dados,exp(1)^pred$pred,log="y",lty=c(1,3))

#teste do modelo
#predizendo para 1960
teste<-ts(dados,frequency = 12,start = c(1949,1),end = c(1959,12))
fit<-arima(log(teste),c(0,1,1),seasonal = list(order=c(0,1,1),period=12))
pred<-predict(fit,n.ahead = 2*12)
pred1<-exp(1)^pred$pred#convertendo
round(pred1)