#UKgas analysis
#https://cran.r-project.org/web/packages/ggfortify/vignettes/plot_ts.html
library(ggfortify)
#install.packages("ggfortify")
library(tidyverse)
library(lubridate)
library(tseries)
data("UKgas")

dados<-UKgas
?colSums
dados
autoplot(dados, ts.colour = 'red', ts.linetype = 'dashed')

autoplot(UKgas,ts.colour = 'red', ts.geom = 'ribbon', fill = 'green')
#Testing time series appearance


#?UKgas
#?aggregate.ts
?boxplot
boxplot(dados~cycle(dados),xlab = "Ciclos",ylab = "Quantidade de gás",col=topo.colors(4),names=c("Q1","Q2","Q3","Q4"))
#getting a felling from the seasonal effect

class(dados)#<-----class ts

cycle(dados)#cycles accordingly to the years

tss <- data.frame("Consumo de gás médio"=aggregate.ts(dados,FUN=mean),Ano=c(1960:1986))#pegando a media anual
tss
#creating table
#library(xlsx)
#write.xlsx(tss,file="tss.xls",row.names = F)
#average consumption by year

#estimating the models's parameters
auto.arima(dados)
auto.arima((log(dados)))#parameters estimated
adf.test(diff(log(dados)))#log stationary series


#building prediction model

fit <- arima(log(dados),c(1,0,0),seasonal = list(order = c(0, 1, 0), period = 4))
pred <- predict(fit, n.ahead = 13*4)

ts.plot(dados,2.718^pred$pred, log = "y",lty=c(1,3),xlab="Tempo",ylab="Consumo de gás")

#install.packages("forecast")
#library(forecast)

#adjusting seasonality
?seasadj
decomp = stl(dados, s.window="periodic")
deseasonal_cnt <- seasadj(decomp)
plot(decomp) 

par(mfrow=c(1,1))
autoplot(deseasonal_cnt,xlab="Tempo",ylab="Consumo de gás",ts.colour = 'black', ts.geom = 'ribbon', fill = 'green',ts.linetype = 'dashed')
