#' calc_PFU_ml
#'
#' @description back calculate number of plaque forming units (PFUs) per mL from phage assays
#' @param plate_counts vector of bacterial plate counts
#' @param dil_fac the dilution factor plated. Can be a single number or a vector the same length as plate_counts
#' @param vol_phage the volume of phage added in microlitres
#' @return a vector the same length as plate_counts
#' @details calculated as \eqn{PFU/mL = plate count/(dilution factor x volume added)}
#' @name calc_PFU_ml
#' @export

calc_PFU_ml <- function(plate_counts, dil_fac, vol_phage){
  return(plate_counts / (dil_fac * (vol_phage/1000)))
}
