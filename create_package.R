#

# install.packages('devtools', dep = TRUE)
# install.packages('roxygen2', dep = TRUE)

#

# library(devtools)
# library(roxygen2)
# devtools::create('myFunctions3')

#

library(devtools)
library(roxygen2)
devtools::document(pkg = '.')

#

# devtools::install_github('marcogarzitto/myFunctions3')
# library(myFunctions3)

#

# Depends: utils, openxlsx, googledrive, Microsoft365R
# install.packages(c('utils, 'openxlsx', 'googledrive', 'Microsoft365R'), dep = TRUE)
# update.packages(ask = 'graphics', checkBuilt = TRUE)

#
