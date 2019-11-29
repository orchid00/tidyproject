# Description: Setup the initial file structure of any
# project
# Author: Paula Andrea Martinez
# Date created: 2019-11-29
# Date modified: 2019-11-29


# Install from CRAN ----
#' @title install a list of packages from CRAN
#'
#' @description installs a list of packages from CRAN
#' provided as a character vector
#' @param list_of_packages a character vector
#' @keywords packages CRAN
#' @export
#' @examples
#' instCRAN(c("tidyverse", "rJava", "ggraph", "tidytree"))

instCRAN <- function(list_of_packages){
  # example
  # list_of_packages <- c("tidyverse", "rJava", "ggraph", "tidytree")
  if (is.vector(list_of_packages, mode = "character")){
    new_packages <-
      list_of_packages[!(list_of_packages %in%
                           installed.packages()[,"Package"])]
    if(length(new_packages)) install.packages(new_packages)

    rm(new_packages, list_of_packages)
  }
  else
    print("please provide a character vector of packages")
}

# Install from github ----
#' @title install a package from GitHub
#'
#' @description install a package from GitHub
#' providing a user name and a name of the package
#' @param username a character
#' @param pkgname a character
#' @keywords package GitHub
#' @export
#' @examples
#' instGH("bonStats", "tidytreatment")

instGH <- function(username, pkgname){
  str <- glue::glue(username, "/", pkgname)
  devtools::install_github(str,
                           build_opts = c("--no-resave-data",
                                          "--no-manual"),
                           dependencies = F )
  # https://github.com/bonStats/tidytreatment

}


# Create folder structure ----
#' @title Create a folder structure for a project
#'
#' @description Creates a basic folder structure for a project
#' scripts, markdown, data and plots
#' @keywords folder structure
#' @export
#' @examples
#' createStr()

createStr <- function(){
  if(!dir.exists("scripts")) dir.create("scripts")
  if(!dir.exists("rmarkdown")) dir.create("rmarkdown")
  if(!dir.exists("plots")) dir.create("plots")
  if(!dir.exists("data")) dir.create("data")
}
