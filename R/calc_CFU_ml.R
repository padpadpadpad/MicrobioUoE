#' calc_CFU_ml
#'
#' @description back calculate number of CFUs per mL from plate counts
#' @param plate_counts vector of bacterial plate counts
#' @param dil_fac the dilution factor plated. Can be a single number or a vector the same length as plate_counts
#' @param vol_plated the volume plated in microlitres
#' @return a vector the same length as plate_counts
#' @details calculated as \eqn{PFU/mL = plate count/(dilution factor x volume added)}
#' @name calc_CFU_ml
#' @export

calc_CFU_ml <- function(plate_counts, dil_fac, vol_plated){
  return(plate_counts / (dil_fac * (vol_plated/1000)))
}
