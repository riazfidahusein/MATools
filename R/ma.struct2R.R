struct2R <- function(path, filename){
# create R xts time series object from matlab structure object
  
  library(R.matlab)
  
  mydata <- readMat((paste(path,filename,sep = "")))
  
  # pull out structure
  mydata <- mydata[[1]]
  
  # extract dates
  dates <- as.matrix(mydata[[2]])
  dates <- matlab2POS(dates)
  
  # extract data
  data <- as.matrix(mydata[[3]])
  colnames(data) <- unlist(mydata[[1]])
  
  # create time series object
  new_data <- xts(data,dates)
  
  return(new_data)
  }