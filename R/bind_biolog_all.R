#' bind_biolog_all
#'
#' @description binds biolog plate data across multiple sheets within a single file
#' @param filename the filename to read in (must be a .xlsx file)
#' @param sheets the sheets to read in
#' @return a dataframe containing the name of the sheet, an id column (numbered from 1 - number of plates in sheet) and 96 columns representing the OD of in each well containing that substrate
#' @export
bind_biolog_all <- function(filename, sheets){

  # detect sheets
  sheets_temp <- readxl::excel_sheets(filename)
  # filter sheets
  sheets_temp <- sheets_temp[sheets_temp %in% sheets]

  # bind all together
  all_data <- purrr::map_df(sheets, bind_biolog_sheet, file = filename)

  return(all_data)
}
