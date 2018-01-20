#' adjust xts frequency - assumes a less frequent periodicity is required
#'
#' @param z
#'
#' @return
#' @export
#'
#' @examples

ma.adjustFreq <- function(z, freq, day){
  if (freq == 'w'){

      # re-size to weekly
      wd <- tolower(weekdays(index(z), abbreviate = TRUE))

      if (day == 'mon'){
          out <- z[wd == "mon",]
      }
      else if (day == 'tue') {
          out <- z[wd == "tue",]
      }
      else if (day == 'wed') {
          out <- z[wd == "wed",]
      }
      else if (day == 'thu') {
          out <- z[wd == "thu",]
      }
      else if (day == 'fri') {
          out <- z[wd == "fri",]
      }

  }
  else if (freq == 'm'){
      out <- z[endpoints(z, on = "months"), ]
  }
  else if (freq == 'q'){
    out <- z[endpoints(z, on = "quarters"), ]
  }
  else if (freq == 'y'){
    out <- z[endpoints(z, on = "years"), ]
  }

  return(out)
}


