#' bind_biolog_sheet
#'
#' @description binds a single sheet of data from a biolog plate into a dataframe
#' @param x the sheet to bind biolog data from
#' @param file the filename to read in (must be a .xlsx file)
#' @return a dataframe containing the name of the sheet, an id column (numbered from 1 - number of plates in sheet) and 96 columns representing the OD of in each well containing that substrate
#' @importFrom magrittr '%>%'
#' @import dplyr
#' @name bind_biolog_sheet
#' @export

# quiets concerns of R CMD check re: the .'s that appear in pipelines
if(getRversion() >= "2.15.1")  utils::globalVariables(c(".", 'sum_row', 'value', 'id', 'colnew', 'sheet', 'n'))

# write function to do on each sheet
bind_biolog_sheet <- function(x, file){

  # read in file
  dat <- readxl::read_excel(file, sheet = x, col_names = FALSE)

  # process file
  d <- dplyr::select(dat, 1:13) %>%
    tidyr::drop_na(.) %>%
    janitor::clean_names() %>%
    tidyr::gather(., 'well', 'od', 2:13) %>%
    dplyr::mutate(., well = readr::parse_number(well),
                  well = paste(x_1, well, sep = '_'),
                  file = basename(tools::file_path_sans_ext(file)),
                  sheet = sheet)

  # work out how many plates per sheet
  num_plates <- nrow(d)/96

  # vector of list of OD wavelengths
  wavelengths <- dplyr::select(dat, 14) %>%
    tidyr::drop_na(.) %>%
    dplyr::distinct() %>%
    dplyr::pull()

  d <- dplyr::mutate(d, od_wave = rep(wavelengths, each = 96)) %>%
    dplyr::select(file, sheet, od_wave, well, od)
  return(d)

  }
