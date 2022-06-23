### ALGUMAS FORMAS DE AVALIAR A DISTRIBUIÇÃO DAS VARIÁVEIS DE UM DATASET ###

### AVALIANDO A NORMALIDADE ###
#link de apoio: 
#https://rpubs.com/reisrgabriel/avaliacaodenormalidade
#https://sosestatistica.com.br/como-testar-se-uma-distribuicao-e-normal/

library(tidyverse)
library(nortest) #teste shapiro francia

#link para acesso ao dataset:
#https://archive.ics.uci.edu/ml/datasets/Daily+Demand+Forecasting+Orders
df <- read_delim('Daily_Demand_Forecasting_Orders.csv', delim = ';')

##Histograma## 
hist(df$`Target (Total orders)`)
#Avaliar o formato do histograma e compará-lo a uma distr. normal

##Resumo dos dados##
summary(df$`Target (Total orders)`)  
sd(df$`Target (Total orders)`) 
#Avaliar a média e o desvio padrão

##Quantil-Quantil (Q-Q Plot)##
#Avaliar as "bolinhas", quanto mais ao redor da linha elas estiverem mais próximos estamos de uma normal
qqnorm(df$`Target (Total orders)`) +
qqline(df$`Target (Total orders)`)

##Shapiro-Wilka##
# Assumido nível de significância de 5%
# Rejeita H0 < 5% - Dados não possuem distribuição normal
# Aceita H1 >= 5% - Dados possuem distribuição normal
shapiro.test(df$`Target (Total orders)`)

##Shapiro-Francia##
# Assumido nível de significância de 5%
# Rejeita H0 < 5% - Dados não possuem distribuição normal
# Aceita H1 >= 5% - Dados possuem distribuição normal
sf.test(df$`Target (Total orders)`)

### CONCLUSÃO ###

# A variável `Target (Total orders)` é do tipo contínua e com característica simétrica positiva 
# (calda a direita) e portanto NÃO é considerada como distribuição normal
# Obs: Para este tipo de variável é aconselhavel que não sejam utilizados modelos paramétricos
# tais como Regressão Linear
