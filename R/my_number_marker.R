#' my_number_marker
#'
#' Function to add markers to a number.
#'
#' @param x Number. Numeric. Default: NA
#' @param cuts Vector of limits for markers (cut-offs). Vector of numerics. Default: c(NA)
#' @param marks Vector of markers (one more than cut-offs). Vector of characters. Default: c(NA)
#' @param below_cuts Mark if x is below cut-offs with TRUE (or if above with FALSE). Boolean. Default: FALSE
#' @param abs Use the absolute value of x. Boolean. Default: FALSE
#' @return Character.
#' @export
my_number_marker <- function (x = NA, cuts = c(NA), marks = c(NA), below_cuts = FALSE, abs = FALSE)
{
 if (is.na(x) | !is.numeric(x)) { return('') }
 if (is.na(unique(cuts))[1]) { return('') }
 if (abs) { x <- abs(x) }
 results <- as.character(cut(x, breaks = c(-Inf, cuts, Inf), labels = marks, right = below_cuts))
 return(results)
}

#
