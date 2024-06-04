library(digest)
library(discretization)
library(dplyr)
library(EnvStats)
library(fastDummies)
library(naniar)
library(nortest)
library(readxl)
library(smoothmest)
library(VIM)
library(plumber)

setwd("C:\\Users\\Usuario\\Documents\\DSI\\EXAMEN_RETO04\\Examen_A1")
df<- read.csv("water-quality-data.csv")

lillie.test(df$Value)
#no sigue distribucion normal
boxplot(df$Value)

limite_superior<- mean(df$Value, na.rm = T)+12*sd(df$Value, na.rm = T)
limite_inferior<- mean(df$Value, na.rm = T)-3*sd(df$Value, na.rm = T)

df$Value[df$Value > limite_superior]<-NA
df$Value[df$Value < limite_inferior]<-NA


lillie.test(df$MDL)
#no sigue distribucion normal
boxplot(df$MDL)

limite_superior<- mean(df$MDL, na.rm = T)+12*sd(df$MDL, na.rm = T)
limite_inferior<- mean(df$MDL, na.rm = T)-3*sd(df$MDL, na.rm = T)

df$MDL[df$MDL > limite_superior]<-NA
df$MDL[df$MDL < limite_inferior]<-NA


lillie.test(df$RDL)
#no sigue distribucion normal
boxplot(df$RDL)

limite_superior<- mean(df$RDL, na.rm = T)+12*sd(df$RDL, na.rm = T)
limite_inferior<- mean(df$RDL, na.rm = T)-3*sd(df$RDL, na.rm = T)

df$RDL[df$RDL > limite_superior]<-NA
df$RDL[df$RDL < limite_inferior]<-NA


boxplot(df$Value)
boxplot(df$MDL)
boxplot(df$RDL)
#Vemos que ya no hay outliers


write.csv(df, "DF_CD_out.csv")

