#' moveRmdOutput
#'
#'
#' @description  Automatically moves all .html, .pdf or .docx files from one folder to another. Designed for Rmarkdown knitted documents that are regularly rendered in the same folder as the .Rmd document
#'
#' @param Rmd_path path to Rmarkdown documents
#' @param Output_path path to where the output (knitted) documents are going to be stored
#' @details If arguments are missing, \code{Rmd_path} defaults to \code{Rmarkdown/Rmd_files} and \code{Output_path} defaults to \code{Rmarkdown/Output_files}
#' @return moves all of the files with the following extensions from Rmd_path to the Output_path: .html, .docx, .pdf
#' @examples
#' \dontrun{moveRmdOutput('Rmd_files', 'Output_files')}
#' @export

# Script to automatically move all .html or .pdf files or .docx files from Rmd_files to Output_files
moveRmdOutput <- function(Rmd_path, Output_path){
  # set defaults
  if(missing(Rmd_path)){Rmd_path <- 'Rmarkdown/Rmd_files'}
  if(missing(Output_path)){Output_path <- 'Rmarkdown/Output_files'}

  output_files <- list.files(Rmd_path, pattern = c('.html|.pdf|.docx'))
  sapply(output_files, function(x){file.rename(file.path(Rmd_path, x), file.path(Output_path, x))})
}

