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

df_cons <- read.csv('DF_DC_V0.csv')

#csv consulte la media del valor de la calidad del agua, del MDL y del RDL por área y por fecha de análisis

consulta <- df_cons %>% group_by(Area, Date.Analyzed) %>% 
  summarise(media_mdl=mean(MDL), media_rdl = mean(RDL))
