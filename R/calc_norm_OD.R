#' calc_norm_OD
#'
#' Calculates the volumes needed for a set of OD readings to normalise OD across samples
#'
#' @param file_in the filename of the file containing the initial OD readings
#' @param file_out the filename of the file you want to write to. This defaults to appending '_inocs' onto the `file_in` name
#' @param new_sol_conc the desired final concentration of the solution. Defaults to 0.1.
#' @param new_sol_vol the volume of the final solution. Defaults to 1000.
#' @param control the value of the control on the OD reader. Defaults to 0
#' @author Daniel Padfield
#' @details Relies on having a column called OD which contains the initial OD values
#' @return Saves a file with the reuqired inoculum values to normalise OD at a given final volume.
#' @examples
#' \dontrun{calc_norm_OD(file_in = 'OD_start.csv',
#' file_out = 'OD_inocs.csv',
#' new_sol_conc = 0.1,
#' new_sol_vol = 1000,
#' control = 0.035)}
#' @importFrom magrittr '%>%'
#' @name calc_norm_OD
#' @export calc_norm_OD

# quiets concerns of R CMD check re: the .'s that appear in pipelines
if(getRversion() >= "2.15.1")  utils::globalVariables(c("."))

calc_norm_OD <- function(file_in, file_out, new_sol_conc, new_sol_vol, control){

  # set up defaults
  if(missing(file_out)){file_out <- paste0(tools::file_path_sans_ext(file_in), '_inocs.', tools::file_ext(file_in), sep = '')}
  if(missing(new_sol_conc)){new_sol_conc <-  0.1}
  if(missing(new_sol_vol)){new_sol_vol <- 1000}
  if(missing(control)){control <- 0}

  # load in data ####
  d <- utils::read.csv(file_in, stringsAsFactors = FALSE) %>%
    dplyr::mutate_(., 'cont' = control,
           'OD_cor' = 'OD - cont')

  # calculate concentrations ####w
  d <- dplyr::mutate_(d, 'dil_fac' = 'OD_cor / new_sol_conc',
              'inoc_samp' = 'round(MicrobioUoE::stock_sol_vol(OD_cor, new_sol_conc, new_sol_vol), 0)',
              'inoc_diluent' = 'new_sol_vol - inoc_samp')

  # write csv out
  utils::write.csv(dplyr::select_(d, '-cont'), file_out)

}
