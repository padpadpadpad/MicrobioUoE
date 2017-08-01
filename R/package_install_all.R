#' package_install_all
#'
#' @description installs all necessary packages from cran, github and bioconductor
#' @param cran_packages a list of packages to install from CRAN
#' @param github_packages a list of packages to install from GitHub
#' @param bioc_packages a list of packages to install from Bioconductor
#' @details if only CRAN packages are needed then you can only supply a list of those as desired. The function assumes \code{devtools} it is used to install packages from GitHub. In addition  \code{biocLite} is used to install packages from Bioconductor. \code{Bioconductor} will need to be downloaded before this will work \link{https://www.bioconductor.org/install/}
#' @return if all packages are installed successfully, the function will return  \code{'Huzzah all the packages are installed'}. If not it will return the list of packages that have not been installed
#' @examples
#' cran_packages = c('dplyr')
#' github_packages = c('padpadpadpad/nlsLoop')
#' package_install_all(cran_packages, github_packages)
#' @export

package_install_all <- function(cran_packages = NULL, github_packages = NULL, bioc_packages = NULL){
  # create defaults
  if(is.null(cran_packages)){cran_packages = c('base')}
  if(is.null(github_packages)){github_packages <- c('base')}
  if(is.null(bioc_packages)){bioc_packages <- c('base')}

  inst <- cran_packages %in% installed.packages()
  if (any(!inst)) {
    install.packages(cran_packages[!inst])
  }

  inst <- github_packages %in% installed.packages()
  if (any(!inst)) {
    devtools::install_github(github_packages[!inst])
  }

  inst <- bioc_packages %in% installed.packages()
  if (any(!inst)) {
    source("https://bioconductor.org/biocLite.R")
    biocLite(bioc_packages[!inst])
  }

  if(length(c(basename(github_packages), cran_packages, bioc_packages)[! c(basename(github_packages), cran_packages, bioc_packages) %in% installed.packages()]) == 0){
    print('Huzzah all the packages are installed')
  } else(c(basename(github_packages), cran_packages, bioc_packages)[! c(basename(github_packages), cran_packages, bioc_packages) %in% installed.packages()]
  )
}