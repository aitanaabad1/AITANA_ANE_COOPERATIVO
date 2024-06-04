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

getwd()

df <- read.csv('water-quality-data.csv')

miss_var_summary(df)
miss_case_summary(df)


num=round(1259444*0.01)

df_reducido <- df[1:num,]
vis_miss(df_reducido, cluster = T)


df_imp <- kNN(df_reducido,
              variable = c("RDL", "MDL", "Grab.ID", "Value"),
              k=5,
              dist_var = c("Area", "Site.Type"))

miss_var_summary(df_imp)


write.csv(df_imp, 'DF_DC_na.csv')





