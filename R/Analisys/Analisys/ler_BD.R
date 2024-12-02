
cli::cli_alert_success("Carregamento de Bases de dados")
#DB_MASTER
infile <- file.path(dir_data, "TESTADOSCOVID.csv")
#inf_update <- file.path(dir_data, "TABELA1.csv")

#Exportando bases para base ao dashboard
export_BD_Geral <- file.path(dir_dashboard, "Base_Geral.rds")
export_BD_3_meses <- file.path(dir_dashboard, "Base_3_meses.rds")
export_BD_30_dias <- file.path(dir_dashboard, "Base_30_dias.rds")
export_diarios <- file.path(dir_dashboard, "Base_diaria.rds")
export_BD_Positivos_diaria <- file.path(dir_dashboard, "BD_Positivos_diaria.rds")


#base_dash<-rio::import(inf_update,Encoding="UTF-8")
r <- rio::import(infile, encoding = "UTF-8")
names(r)[10] <- "`DISTRITO...10`"

str(r)
r_Base <- r %>%
  select (
          COD = "COD",
          idade = "IDADE (ANOS)",
          sexo = "SEXO",
          Nacionalidade = NACIONALIDADE,
          Profisao=PROFISSÃO,
          Sintomas = SINTOMAS,
          Provincia = PROVINCIA,
          Distrito = "`DISTRITO...10`",
          Us_colheita = "UNIDADE SANITARIA DE NOTIFICACAO",
          Lab_testagem = "LABORATÓRIO DE TESTAGEM",
          tipo_laboratorio = "TIPO_LABORATORIO",
          Motivo_testagem =  "MOTIVO DE TESTAGEM",
          Data_reporte = "data_reporte",
          Data_colheita = "DATA DE COLHEITA",
          #Data_validacao = "DATA DE VALIDAÇÃO",
          # Data_analise = "DATA DE ANALISE",
          # Data_registro = "DATA DE REGISTO NO LAB"   
          #data reporte?
          resultado_testagem = "RESULTADO1c",
          tipo_teste = TIPO_DE_TESTE
          
  ) %>% mutate(Data_reporte= lubridate::ymd(Data_reporte))





## Default S3 method:

