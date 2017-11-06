#' geom_pretty_boxplot
#'
#' @description Combines geom_boxplot() and stat_summary() from ggplot2 to make prettier boxplots
#' @param ... arguments to pass to \code{geom_boxplot()}
#' @details aesthetics and arguments are generally set in original \code{ggplot(aes())} command. Gets rid of outliers because it wants you to overlay your actual points. Does not work when \code{position_jitter_dodge()} is needed.
#' @name geom_pretty_boxplot
#' @export

geom_pretty_boxplot <- function(...){
  list(
    ggplot2::geom_boxplot(outlier.shape = NA, position = ggplot2::position_dodge(width = 0.75), col = 'black', ...),
    ggplot2::stat_summary(geom = 'crossbar', position = ggplot2::position_dodge(width = 0.75), fatten = 0, color = 'white', width = 0.4, fun.data = function(x){ return(c(y = stats::median(x), ymin = stats::median(x), ymax = stats::median(x)))})
  )
}
