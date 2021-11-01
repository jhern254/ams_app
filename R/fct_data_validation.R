#' data_validation 
#' 
#' Tests uploaded csv file
#' 
#' Checks if file is correct then returns number of header lines to skip
#'
#' @param path Path to csv file
#' @param filename Name of file used to validate if first header row
#' @param header_start String to match for first column header
#' @return number of lines to skip for header
#' @examples
#' skip_n <- test_csv_file("./pfr_09_09_full.csv", "Project Financial Report",
#'                        "Project ID,")
#' @noRd
test_csv_file <- function(path, filename, header_start) {
    DEBUG = FALSE 
    txt <- readLines(path, n = 10)
    skip = 0

    # making assumption PFR always start w/ this string
    is_file <- stringr::str_detect(txt[1], filename) 
    if (DEBUG) {
        message("is_file is: ", is_file)
    }

    # find headers to skip
    for (line in txt) {
        # making assumption ProjectID is always first in PFR
        if (stringr::str_detect(line, header_start)) {
            skip = which(line == txt)
        } 
    }

    if (skip == 0 || is_file == FALSE) {
        # use validate in shiny app?
        stop(message("No ", header_start, " found, is this a ", filename," csv file?"))
    }

    skip
}



