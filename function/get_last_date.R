#get last date

#' @param fecha a string with the name of the variable date
db<-r_Base
fecha="Data_reporte"

get_last_date <- function(db,
                          fecha){
  
  max(db[[fecha]])
  
}


#' convert last date into label for charts
get_last_date_label <- function(db, 
                                fecha){
  
  last_date <- get_last_date(db, fecha)
  
  last_date_label <- format(last_date, "%d %b %Y")
  
  
  return(last_date_label)
  
  
}


