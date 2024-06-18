#' my_save_table
#'
#' Function to save a data-frame in 'xlsx', and/or 'rds', and/or 'RData', and/or 'csv'. Using: 'openxlsx' package.
#'
#' @param what Data-frame to be saved. Data-frame. Default: None.
#' @param file_name Name by which the file will be saved. String. Default: 'DF'.
#' @param sheet_name Name of the sheet in which the file will be saved. String. Default: 'DATA'.
#' @param add_sheet To add a sheet in an existing file (instead of create a new file). Boolean. Default: FALSE.
#' @param where Destination folder. String. Default: current folder (with 'getwd()').
#' @param freeze_colums Number of columns to be freezed. Default: 1.
#' @param with_rds To save as 'rds'. Boolean. Default: TRUE.
#' @param with_rdata To save as 'RData'. Boolean. Default: FALSE.
#' @param with_csv To save as 'csv' (both standard and Italian-version 'csv' are saved). Boolean. Default: FALSE.
#' @param row_names To use row names. Boolean. Default: FALSE.
#' @param fileEncoding File encoding. String. Default: 'latin1'.
#' @return Nothing.
#' @export
my_save_table <- function (what, file_name = 'DF', sheet_name = 'DATA', add_sheet = FALSE, where = getwd(), freeze_colums = 1, with_rds = TRUE, with_rdata = FALSE, with_csv = FALSE, row_names = FALSE, fileEncoding = 'latin1')
{
 DF <- what
 #
 if(.Platform$OS.type == 'windows') { FONT <- 'Courier New' } else { FONT <- 'mono' }
 headerStyle <- openxlsx::createStyle(fontName = FONT, fontSize = 10, fontColour = '#000000', textDecoration = 'bold',
                                      border = c('top', 'bottom', 'left', 'right'), borderColour = '#000000', borderStyle = 'thin',
                                      bgFill = NULL, fgFill = '#D9D9D9',
                                      halign = 'center', valign = 'center',
                                      wrapText = FALSE)
 bodyStyle <- openxlsx::createStyle(fontName = FONT, fontSize = 10, fontColour = '#000000', textDecoration = NULL,
                                    border = c('top', 'bottom', 'left', 'right'), borderColour = '#000000', borderStyle = 'thin',
                                    bgFill = NULL, fgFill = '#FFFFFF',
                                    halign = 'center', valign = 'center',
                                    wrapText = FALSE)
 if (add_sheet)
 {
  wb <- openxlsx::loadWorkbook(file = paste(where, '/', file_name, '.xlsx', sep = ''))
 } else
 {
  wb <- openxlsx::createWorkbook(creator = 'm.g')
 }
 openxlsx::addWorksheet(wb = wb, sheetName = sheet_name)
 openxlsx::writeData(wb = wb, sheet = sheet_name, x = DF, rowNames = FALSE)
 for (enne in c(1:ncol(DF)))
 {
  openxlsx::addStyle(wb = wb, sheet = sheet_name, style = bodyStyle, rows = c(2:(nrow(DF) + 1)), cols = c(enne))
 }
 openxlsx::addStyle(wb = wb, sheet = sheet_name, style = headerStyle, rows = c(1), cols = c(1:ncol(DF)))
 for (enne in c(1:freeze_colums))
 {
  openxlsx::addStyle(wb = wb, sheet = sheet_name, style = headerStyle, rows = c(2:(nrow(DF) + 1)), cols = c(enne))
 }
 openxlsx::freezePane(wb = wb, sheet = sheet_name, firstActiveRow = 2, firstActiveCol = (freeze_colums + 1))
 openxlsx::addFilter(wb = wb, sheet = sheet_name, row = 1, cols = c(1:ncol(DF)))
 openxlsx::setColWidths(wb = wb, sheet = sheet_name, widths = 'auto', cols = c(1:ncol(DF)))
 openxlsx::saveWorkbook(wb = wb, file = paste(where, '/', file_name, '.xlsx', sep = ''), overwrite = TRUE, returnValue = FALSE)
 if (with_rds)
 {
  saveRDS(DF, file = paste(where, '/', file_name, '___sheet___', sheet_name, '.rds', sep = ''))
 }
 if (with_rdata)
 {
  save(DF, file = paste(where, '/', file_name, '___sheet___', sheet_name, '.RData', sep = ''))
 }
 if (with_csv)
 {
  write.table(DF, file = paste(where, '/', file_name, '___sheet___', sheet_name, '.csv', sep = ''), sep = ',', dec = '.', row.names = row_names, quote = TRUE, fileEncoding = fileEncoding)
  write.table(DF, file = paste(where, '/', file_name, '___sheet___', sheet_name, '_IT', '.csv', sep = ''), sep = ';', dec = ',', row.names = row_names, quote = TRUE, fileEncoding = fileEncoding)
 }
}

#
