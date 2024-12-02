


cli::cli_alert_success("Exportando Bases de Dados para DashBoard")
#Exportando Bases de dados para DashBoard
cli::cli_alert_success("Exportando Bases Geral")
rio::export(r_Base, export_BD_Geral)

cli::cli_alert_success("Exportando Bases de Tres meses")
rio::export(Base_Tres_meses,export_BD_3_meses)

cli::cli_alert_success("Exportando Bases de Dados Diaria")
rio::export(BD_diarios,export_diarios)


cli::cli_alert_success("Exportando Bases de trinta dias")
rio::export(Base_trinta_dias,export_BD_30_dias)

cli::cli_alert_success("Exportando Bases de Dados de positivos")
rio::export(BD_diarios_positivos,export_BD_Positivos_diaria)


cli::cli_alert_success("Exportando Bases de consulta do directodio de analises")
writexl::write_xlsx(BD_diarios_positivos, file.path(dir_limpos, "BD_POSITIVOS.csv"))
writexl::write_xlsx(BD_diarios, file.path(dir_limpos, "BD_DIARIA.csv"))