#' push data to end of month
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples

ma.push2EOM <- function(z){
  # re-size to daily
  sq <- seq(as.Date(start(z)), as.Date(end(z), frac = 1), by = "day")
  out <- na.approx(z, x = as.Date, xout = sq)

  # remove weekends
  out <- out[.indexwday(out) %in% 1:5]

  # padforward
  out <- na.locf(out)

  # re-size to monthly
  out <- out[endpoints(out, on = "months"), ]

  return(out)
}
