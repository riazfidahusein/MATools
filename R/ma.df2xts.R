#' Convert data framw object to xts object
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples

ma.df2xts <- function(x){
  out <- xts(x[,-1], order.by=x[,1])
  names(out) <- names(x[2:ncol(x)])

  return(out)
}
