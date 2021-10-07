#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # Your application server logic 
    mod_pfr_screen_server("pfr_screen_ui_1")

    mod_pfr_summary_screen_server("pfr_summary_screen_ui_1")
}
