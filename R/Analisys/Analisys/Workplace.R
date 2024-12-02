#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
# Author: Anisio Bule


#1
#Leitura de todas bibliotecs
source(".RProfile", encoding = "UTF-8")

#2
#Ler Base de dados 
source(file.path(dir_R, "ler_BD.R"), encoding = "UTF-8")


#3
#corigindo variaveis e base de dados
source(file.path(dir_R, "coorecao_BD.R"), encoding = "UTF-8")


#4
#Criando indicadores para Dashboard
source(file.path(dir_R, "create_indicator.R"), encoding = "UTF-8")


#Coorecao de Variaveis
#Limpando Valores da base de dados
#Renomeando Resultados e Filtrando falores Null
source(file.path(dir_R, "export_DB_Dashboard.R"), encoding = "UTF-8")





#Carregando as bases e criando bases para o dashboard
#source("R/Script_Analise.R", encoding = "UTF-8")

