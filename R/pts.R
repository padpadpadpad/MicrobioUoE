#' pts
#'
#' @description convert size of geom_text() text to pts
#' @param x text size to convert
#' @export pts

pts <- function(x){
  as.numeric(grid::convertX(grid::unit(x, 'points'), 'mm'))
}
