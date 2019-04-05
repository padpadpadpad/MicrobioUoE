#' number_facets
#'
#' @description automatically labels facets with number before the label
#' @param string character vector of facet labels
#' @export number_facets

number_facets <- function(string){
  len <- length(string)
  string = paste('(', 1:len, ') ', string, sep = '')
  return(string)
}
