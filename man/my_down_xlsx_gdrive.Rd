% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/my_down_gdrive.R
\name{my_down_xlsx_gdrive}
\alias{my_down_xlsx_gdrive}
\title{my_down_xlsx_gdrive}
\usage{
my_down_xlsx_gdrive(
  account = "",
  id_google = "",
  file_name = "IN",
  where = getwd()
)
}
\arguments{
\item{account}{Account in Google Drive (usually e-mail). Default: ''.}

\item{id_google}{ID in Google Drive (online) for the file to download. Default: ''.}

\item{file_name}{Name of the file after downloading. String. Default: 'IN'.}

\item{where}{Destination folder (local). String. Default: current folder (with 'getwd()').}
}
\value{
Nothing.
}
\description{
Function to download a file from Google Drive, given account and file-ID. Using: 'googledrive' package.
}
