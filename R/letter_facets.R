#' letter_facets
#'
#' @description automatically labels facets with letters before the label
#' @param string character vector of facet labels
#' @export letter_facets

letter_facets <- function(string){
  len <- length(string)
  string = paste('(', letters[1:len], ') ', string, sep = '')
  return(string)
}
