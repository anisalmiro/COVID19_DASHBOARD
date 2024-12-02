
#test<-r_Base %>%distinct(Provincia) %>% group_by(Provincia) %>% dplyr::summarise(resultado_testagem=n())

cli::cli_alert_success("Corrigindo Variaveis Resultado")
r_Base$resultado_testagem <- plyr::revalue(r_Base$resultado_testagem, c(
  "2_Positivo"="Positivo",
  "1_Negativo"="Negativo"
)) 

r_Base$Provincia <- plyr::revalue(r_Base$Provincia, c(
  "MAPUTO PROVINCIA"="Maputo Provincia"
)) 

r_Base$tipo_teste <- plyr::revalue(r_Base$tipo_teste, c(
  "RT-PCR"="PCR",
  "Teste Rapido Antigeno"="TDR"
))

r_Base$sexo <- plyr::revalue(r_Base$sexo, c(
  "I"="Sem imformacao",
  "M"="Sem imformacao",
  "M."="Sem imformacao",
  "Nampula"="Sem imformacao",
  "Beira"="Sem imformacao",
  "SI"="Sem imformacao",
  "f"="F",
  "U"="Sem imformacao",
  "m"="M",
  "Cidade de Maputo"="Sem imformacao"
))

tt<-r_Base %>% distinct(sexo)

#Filtrando ultima data da base
ultima_data <- max(as.Date(r_Base$Data_reporte))

#voltando tres meses na data do reporte diario
data_aux_3_meses<-as.Date(ultima_data - dmonths(3))
#Convertendo para melhor formato
class(data_aux_3_meses)


prim_dia_tres_meses<-as.Date(data_aux_3_meses,format("%d/%m/%Y"))
#print(prim_dia_tres_meses)

#bade dos tres meses
cli::cli_alert_info("BD dos 3 meses de Analise")
Base_Tres_meses<- r_Base %>% dplyr::filter(r_Base$Data_reporte >= prim_dia_tres_meses) 


#fazendo a Tabela para dashboard de 15 dias
testados_trinta_dias<-r_Base$Data_reporte - ddays(30)

#bade dos tres meses
cli::cli_alert_info("BD dos 30 dias")
Base_trinta_dias<- r_Base %>% dplyr::filter(r_Base$Data_reporte >= testados_trinta_dias) 


#bade dos tres meses
cli::cli_alert_info("BD dos positivoa")
BD_diarios <-r_Base %>% dplyr::filter(r_Base$Data_reporte == ultima_data)
BD_diarios_positivos <- r_Base %>% dplyr::filter(r_Base$Data_reporte == ultima_data & r_Base$resultado_testagem == "Positivo")

