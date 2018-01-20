#' size xts to first commom start date
#'
#' @param z
#'
#' @return
#' @export
#'
#' @examples

ma.size2CommonStartDate <- function(z){

  firstNonNA <- sapply(z, function(z) min(which(!is.na(z))))
  commonFirstNonNA <- max(firstNonNA)

  z <- z[commonFirstNonNA:nrow(z),]
  NonNAindex <- which(!is.na(z))
  firstNonNA <- min(NonNAindex)

  return(z)
}
