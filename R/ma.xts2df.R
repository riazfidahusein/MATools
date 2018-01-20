ma.xts2df <- function(x, date2RowName){
  # create data frame object from an xts time series object
  #
  # see df2xts
  #
  # RF Nov 2016

  if (exists("date2RowName", mode = "numeric") == FALSE) {
    date2RowName <- 1
  }

  if (date2RowName == 1){
    y = as.data.frame(x)
  }

if (date2RowName == 0){
  cnames <- colnames(x)
  y = data.frame(date = index(x), value = coredata(x))
  y$date <- as.Date(y$date , format = "%Y-%m-%d")
  colnames(y) = c("date", cnames)
}

  return(y)

}
