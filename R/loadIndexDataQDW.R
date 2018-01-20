#' Load data from QDW
#'
#' Load data from the Schroders Quant Data Warehouse (QDW)
#' @param envir choose QDW environment. Defaults to prod
#' @param compKey vector of composite keys. e.g. c('DDL|PI|GSALSPT','DDL|PI|CGSYSPT')
#' @keywords QDW
#' @export
#' @examples
#' compKey <- c('DDL|PI|GSALSPT','DDL|PI|CGSYSPT')
#' out <- loadIndexDataQDW(envir = 'prod', compKey)

loadIndexDataQDW <- function(envir, compKey){

  if (!exists(envir)){
    envir <- "prod"
  }

  # choose environment
  if(envir == "prod"){
    conn <- odbcDriverConnect(connection="driver={SQL Server};
                              server=LON05175.london.schroders.com;
                              database=QuantDatawarehouse;
                              trusted_connection=yes;")
  } else {
    conn <- odbcDriverConnect(connection="driver={SQL Server};
                              server=LON75175.london.schroders.com;
                              database=QuantDatawarehouse_TS1;
                              trusted_connection=yes;")
  }

  ck = paste(compKey, collapse = "\n")

  query <- paste("EXEC Core.DataGet @CompositeKeys = \'\n", ck, "\'", ";", sep = "")

  result <- sqlQuery(conn, gsub("\n,",",", query))

  odbcClose(conn)

  out <- select(result, ObservationDate, CompositeKey, ValueNumeric)

  out = dcast(out, ObservationDate ~ CompositeKey, value.var = 'ValueNumeric')

  out$ObservationDate <- as.POSIXct(out$ObservationDate, format = "%Y-%m-%d")

  return(out)

}

