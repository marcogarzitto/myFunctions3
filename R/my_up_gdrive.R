#' my_up_gdrive
#'
#' Function to upload a file in a folder of Google Drive, given account and a local file (overwriting any online file with the same name). Using: 'googledrive' package.
#'
#' @param account Account in Google Drive (usually e-mail). Default: ''.
#' @param current_file Name of the file to upload. String. Default: ''.
#' @param file_name_uploaded Name of the file after uploading. String. Default: 'NEW'.
#' @param where_to_upload Folder in Gogle Drive in which the file will be uploaded. String. Default: ''
#' @return Nothing.
#' @export
my_up_gdrive <- function (account = '', current_file = '', file_name_uploaded = 'NEW', where_to_upload = '')
{
 googledrive::drive_auth(email = account)
 googledrive::drive_upload(media = current_file, path = where_to_upload, name = file_name_uploaded, overwrite = TRUE)
}

#
