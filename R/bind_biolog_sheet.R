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
  dat <- readxl::read_excel(file, sheet = x, col_names = F)

  # process file
  d <- dplyr::select(dat, 2:13) %>%
    tidyr::drop_na(.) %>%
    dplyr::mutate(., sum_row = rowSums(.)) %>%
    dplyr::filter(., sum_row != sum(1:12)) %>%
    dplyr::select(., -sum_row)

  # work out how many plates per sheet
  num_plates <- nrow(d)/8

  d <- dplyr::mutate(d, id = rep(seq(1, num_plates, 1), each = 8)) %>%
    tidyr::gather(., 'colnew', 'value', 1:12) %>%
    dplyr::group_by(., id) %>%
    dplyr::mutate(., sequence = seq(1, n(),1)) %>%
    dplyr::select(., -colnew) %>%
    tidyr::spread(., sequence, value) %>%
    dplyr::mutate(., sheet = x) %>%
    dplyr::select(., sheet, id, dplyr::everything()) %>%
    data.frame()
  return(d)

  }
