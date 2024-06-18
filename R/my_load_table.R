#' my_load_table
#'
#' Function to load a data-frame from 'xlsx', or 'rds', or 'RData', or 'csv'. Using: 'openxlsx' package.
#'
#' @param file_name Name of the file to load. String. Default: 'DF'.
#' @param sheet_name Name of the sheet in which the data to be loaded are (if NA, the first sheet is chosen). String. Default: NA.
#' @param where Origin folder. String. Default: current folder (with 'getwd()').
#' @param isa_xlsx From a 'xlsx' file. Boolean. Default: TRUE.
#' @param isa_rds From a 'rds' file. Boolean. Default: FALSE.
#' @param isa_rdata From a 'RData' file. Boolean. Default: FALSE.
#' @param isa_csv From a 'csv' file (standard version). Boolean. Default: FALSE.
#' @param row_names To use row names. Boolean. Default: FALSE.
#' @param fileEncoding File encoding. String. Default: 'latin1'.
#' @return Data-frame.
#' @export
my_load_table <- function (file_name = 'DF', sheet_name = NA, where = getwd(), isa_xlsx = TRUE, isa_rds = FALSE, isa_rdata = FALSE, isa_csv = FALSE, row_names = FALSE, fileEncoding = 'latin1')
{
 if (isa_xlsx)
 {
  IN <- openxlsx::loadWorkbook(file = paste(where, '/', file_name, '.xlsx', sep = ''))
  if (is.na(sheet_name)) { SHEET <- names(IN)[1] } else { SHEET <- sheet_name }
  OUT <- openxlsx::read.xlsx(xlsxFile = IN, sheet = SHEET, skipEmptyRows = TRUE, colNames = TRUE)
 } else if (isa_rds)
 {
  if (is.na(sheet_name)) { NAME <- file_name } else { NAME <- paste(file_name, '___sheet___', sheet_name, sep = '') }
  OUT <- readRDS(file = paste(where, '/', NAME, '.rds', sep = ''))
 } else if (isa_rdata)
 {
  if (is.na(sheet_name)) { NAME <- file_name } else { NAME <- paste(file_name, '___sheet___', sheet_name, sep = '') }
  IN <- load(file = paste(where, '/', NAME, '.RData', sep = ''))
  OUT <- get(IN)
  rm(IN)
 } else if (isa_csv)
 {
  if (is.na(sheet_name)) { NAME <- file_name } else { NAME <- paste(file_name, '___sheet___', sheet_name, sep = '') }
  OUT <- data.frame(utils::read.table(file = paste(where, '/', NAME, '.csv', sep = ''), header = TRUE, sep = ',', dec = '.', fileEncoding = fileEncoding))
 } else
 {
  OUT <- NA
 }
 return(OUT)
}

#
