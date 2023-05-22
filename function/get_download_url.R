#'get download url from github
#' @param path Path to the file
#' @param branch branch to download

get_download_url <- function(path = 'charts/Mocambique/casos_new_bar_trend.png',
                             branch ="anisio"){
  
  base_url <- 'https://api.github.com/repos'
  owner<- 'anisalmiro'
  token <- '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'
  
  #file to query
  FILE= glue::glue("{base_url}/anisalmiro/INS/contents/{path}")
  
  #ask for the download link to download "raw"
  request_url <- httr::GET(url = FILE,
                           authenticate(owner, token),
                           query = list(ref = branch,
                                        Accept= 'application/vnd.github.v3.raw')
  )
  
  c<-content(request_url)
  download_url <- c$download_url
  
  
  return(download_url)
  
  
}



