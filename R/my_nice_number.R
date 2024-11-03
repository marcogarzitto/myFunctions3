#' my_number_marker
#'
#' Function to add markers to a number.
#'
#' @param x Number. Numeric. Default: NA
#' @param name Name for x in resulting text (possibly abbreviation). Default: NA
#' @param limits Limits for x in resulting text (minimum and maximum). Vector of numerics. Default: c(NA, NA)
#' @param dec Number of decimals in resulting text. Numeric. Default: 3
#' @param plus_sign Using sign in resulting text (i.e., '+' or '-'). Boolean. Default: TRUE
#' @param equal_sign Using equal sign in resulting text (i.e., '='; added by default when there is a name). Boolean. Default: FALSE
#' @param void_string String to be used if x is not numeric in resulting text. Default: '∅'
#' @param cuts Vector of limits for markers (cut-offs). Vector of numeric. Default: c(NA)
#' @param marks Vector of markers (one more than cut-offs). Vector of characters. Default: c(NA)
#' @param below_cuts Mark if x is below cut-offs with TRUE (or if above with FALSE). Boolean. Default: FALSE
#' @param abs Use the absolute value of x. Boolean. Default: FALSE
#' @return List (x, text, mark).
#' @export
my_nice_number <- function (x = NA, name = NA, limits = c(NA, NA), dec = 3, plus_sign = TRUE, equal_sign = FALSE, void_string = '∅', cuts = c(NA), marks = c(NA), below_cuts = FALSE, abs = FALSE)
{
 if (is.na(x) | !is.numeric(x) | is.infinite(x)) { return(list(x = NA, text = void_string, mark = '')) }
 text <- x
 if (is.na(name)) { name <- '' } else { equal_sign = TRUE }
 if (equal_sign) { equal_sign <- '=' } else { equal_sign <- '' }
 if (plus_sign) { plus_sign <- '+' } else { plus_sign <- '' }
 if ((x > limits[1]) & (x < limits[2]) & (text == 0)) { plus_sign <- '' }
 if (!is.na(limits[1]) & (x < limits[1]))
 {
  text <- limits[1]
  equal_sign = '<'
 }
 if (!is.na(limits[2]) & (x > limits[2]))
 {
  text <- limits[2]
  equal_sign = '>'
 }
 if ((sprintf(paste('%', '0.', dec, 'f', sep = ''), text) == sprintf(paste('%', '0.', dec, 'f', sep = ''), 0) |
      sprintf(paste('%', '0.', dec, 'f', sep = ''), text) == sprintf(paste('%', '0.', dec, 'f', sep = ''), -0)) &
     (text != 0))
 {
  text <- sign(text) * 10**(-1 * dec)
  if (x < text ) { equal_sign = '<' }
  if (x > text ) { equal_sign = '<' }
 }
 mark <- my_number_marker(x = x, cuts = cuts, marks = marks, below_cuts = below_cuts, abs = abs)
 text <- paste(name, equal_sign, sprintf(paste('%', plus_sign, '0.', dec, 'f', sep = ''), text), sep = '')
 result <- list(x = x, text = text, mark = mark)
 return(result)
}

#
