#' Calculate perodic returns
#'
#' Calculate perodic returns from xts object of prices
#' @param x xts object of prices
#' @param nPer choose Nper period returns
#' @keywords performance
#' @export
#' @examples
#'

ma.calculateReturns <- function(x, nPer = 1){

  ret <- (x / lag.xts(x,nPer)) - 1

  return (ret)

}
