#' Calculates the volume of stock solution needed when making up working
#' solutions.
#'
#' Uses the equation:
#'
#' stock_sol_vol = (new_sol_conc * new_sol_vol) / stock_sol_conc
#'
#' To work out the volume of your original solution (stock solution) you need
#' to make up the desired concentration of your new solution (eg. for a working
#' solution)
#'
#'
#' @param stock_sol_conc The concentration of your stock solution
#' @param new_sol_conc The desired concentration of your new solution
#' @param new_sol_vol The total volume of your new solution
#' @author Daniel Padfield
#' @examples
#'
#' StockConc <- 100
#' DesiredConc <- 10
#' DesiredVol <- 50
#'
#' stock_sol_vol(StockConc, DesiredConc, DesiredVol)
#'
#'
#' @export stock_sol_vol
stock_sol_vol <- function(stock_sol_conc, new_sol_conc, new_sol_vol) {
  return((new_sol_conc*new_sol_vol)/stock_sol_conc)
}
