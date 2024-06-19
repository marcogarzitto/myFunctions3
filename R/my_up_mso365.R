#' my_up_mso365
#'
#' Function to download a file from Google Drive, given account and file-ID. Using: 'Microsoft365R' package.
#'
#' @param current_file Name of the file to upload. String. Default: ''.
#' @param file_name_uploaded Name of the file after uploading. String. Default: 'NEW'.
#' @param where_to_upload Folder in Gogle Drive in which the file will be uploaded. String. Default: ''
#' @return Nothing.
#' @export
my_up_mso365 <- function (current_file = '', file_name_uploaded = 'NEW', where_to_upload = '')
{
 authorized <- Microsoft365R::get_business_onedrive()
 authorized$upload_file(src = current_file, dest = paste(where_to_upload, '/', file_name_uploaded, sep = ''))
}

#
