R2struct <- function(x, path, filename){
  # creates and saves matlab structure object from a R xts time series object
  
  # convert xts to df
  out <- xts2df(x)
  
  # # convert xts to list
  # dates <- as.character(index(x))
  # header <- colnames(x)
  # data <- coredata(x)  
  # name <- "R generated data"
  # mydata <- list(dates, header, data, name)
  # 
  # # save as mat file
  # writeMat(paste(path, filename, ".mat", sep = ""), 
  #          dates = dates,
  #          header = header,
  #          data = data,
  #          name = name)
  
  writeMat(paste(path, filename, ".mat", sep = ""), out = out)
  
}