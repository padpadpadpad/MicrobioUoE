#' plot_qual_profs
#'
#' @description Plots quality profiles of single fastq files
#' @param filename file name of pdf
#' @param files_Fwd list of fastq files of the forward reads
#' @param files_Rev list of fastq files of the reverse reads
#' @param subsample number of subsamples of the data to take instead of plotting every single file. Defaults to every single file
#' @param ... extra arguments to pass onto pdf() such as height and width
#' @details uses \code{dada2::plotQualityProfile} to plot multiple quality profiles into a single pdf
#' @return a pdf of quality profiles
#' @examples
#' \dontrun{
#' files_Fwd <- 'examp_R02.fastq'
#' files_Rev <- 'examp_R01.fastq',
#' plot_qual('~/Desktop/qualplots.pdf', files_Fwd, files_Rev)}
#' @export

plot_qual_profs <- function(filename, files_Fwd, files_Rev, subsample = NULL, ...){

  if (!requireNamespace("dada2", quietly = TRUE)) {
    stop("Package 'dada2' needed for this function to work. Please install it
         either manually.",
         call. = FALSE)
  }

  if(!is.null(subsample)){
    files_Fwd <- sample(files_Fwd, subsample)
    files_Rev <- sample(files_Rev, subsample)
  }
  if(is.null(subsample)){subsample = length(files_Fwd)}
  grDevices::pdf(filename, ...)
  for(i in 1:subsample){print(dada2::plotQualityProfile(files_Fwd[i]) + ggplot2::ggtitle("Fwd"))}
  list_Rev <- list()
  for(i in 1:subsample){print(dada2::plotQualityProfile(files_Rev[i]) + ggplot2::ggtitle("Rev"))}
  grDevices::dev.off()
}
