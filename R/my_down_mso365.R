#' my_down_xlsx_mso365
#'
#' Function to download a file from Google Drive, given account and file-ID. Using: 'Microsoft365R' package.
#'
#' @param file_mso365 OneDrive (online) name of the file to download. Default: ''.
#' @param folder_mso365 OneDrive (online) folder for the file to download. Default: ''.
#' @param local_name Name of the file after downloading. String. Default: 'IN'.
#' @param where Destination folder (local). String. Default: current folder (with 'getwd()').
#' @return Nothing.
#' @export
my_down_xlsx_mso365 <- function (file_mso365 = '', folder_mso365 = '', local_name = 'IN', where = getwd())
{
 authorized <- Microsoft365R::get_business_onedrive()
 authorized$download_file(paste(folder_mso365, '/', file_mso365, sep = ''), dest = paste(where, '/', local_name, '.xlsx', sep = ''), overwrite = TRUE)
}

#
