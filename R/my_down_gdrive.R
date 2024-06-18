#' my_down_xlsx_gdrive
#'
#' Function to download a file from Google Drive, given account and file-ID. Using: 'googledrive' package.
#'
#' @param account Account in Google Drive (usually e-mail). Default: ''.
#' @param id_google ID in Google Drive for the file to download. Default: ''.
#' @param file_name Name of the file after downloading. String. Default: 'IN'.
#' @param where Origin folder. String. Default: current folder (with 'getwd()').
#' @return Nothing.
#' @export
my_down_xlsx_gdrive <- function (account = '', id_google = '', file_name = 'IN', where = getwd())
{
 googledrive::drive_auth(email = account)
 LINK <- googledrive::drive_get(path = googledrive::as_id(id_google))
 googledrive::drive_download(file = LINK, path = paste(where, '/', file_name, '.xlsx', sep = ''), overwrite = TRUE)
}

#
