#'get last modification in repo

download_github_time <- function(
    repo = 'INS',
    branch = 'andres'
    
    
){
  
  #credentials ----------------------------------------------------------------
  base_url <- 'https://api.github.com/repos'
  owner<- 'araupontones'
  token <- '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'
  
  FILE = glue::glue('{base_url}/{owner}/{repo}/commits/{branch}')
  
  
  
  #ask for the download link to download "raw"
  request_url <- httr::GET(url = FILE,
                           authenticate(owner, token)
  )
  
  #clean response
  response <- content(request_url, "text")
  response_json <- jsonlite::fromJSON(response)
  time <- response_json$commit$author$date
  last_update <- suppressMessages({lubridate::ymd_hms(time, tz = "CET")})
  last_update_label <- format(last_update, "Última atualização: %d de %B de %Y %H:%M")
  #response_json <- content(request_url, "text") %>% jsonlite::fromJSON
  
  #last_modification <- lubridate::ymd_hms(response_json$commit$author$date, tz = "CET")
  
  
  return(last_update_label)
  
}




