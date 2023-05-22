
#'returns a dataset saved in github
#'@param repo Name of the repo in github
#'@param path Path to the file to download
#'@param branch branch from with the data will be downloaded

download_github <- function(
    repo = 'COVID19_DASHBOARD',
    path = 'R/DB_Dashboard/Base_Geral.rds',
    branch = 'anisio'
    
    
){
  
  base_url <- 'https://api.github.com/repos'
  owner<- 'anisalmiro'
  token <- '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'
  
  #file to query
  FILE= glue::glue("{base_url}/{owner}/{repo}/contents/{path}")
  print(FILE)
  
  #ask for the download link to download "raw"
  request_url <- httr::GET(url = FILE,
                           authenticate(owner, token),
                           query = list(ref = branch,
                                        Accept= 'application/vnd.github.v3.raw')
  )
  
  print(request_url$status_code)
  
  download_link <- content(request_url)$download_url
  
  
  
  #download file-----------------------------------------------------------------
  request_file <- GET(download_link,
                      authenticate(owner, token)
  )
  
  
  
  dwnlfile <- file.path(tempdir(),"file.rds")
  filecon <- file(dwnlfile, "wb")
  #write data contents to download file
  writeBin(request_file$content, filecon)
  #close the connection
  close(filecon)
  
  
  
  #inform user about status of request
  cli::cli_alert_info(stringr::str_extract(path, "[^\\/]*.$"))
  
  if(request_file$status_code == 200){
    
    cli::cli_alert_success("Downloaded!")
    
  } else{
    
    cli::cli_alert_danger(glue::glue("Status: {request_file$status_code}. Check credentials"))
  }
  
  
  #read file and return file---------------------------------------------------
  df_file <- rio::import(dwnlfile)
  
  
  return(df_file)
  # 
}
