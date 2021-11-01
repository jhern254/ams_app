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

    mod_dept_port_screen_server("dept_port_screen_ui_1")

    mod_pi_port_screen_server("pi_port_screen_ui_1")

    mod_template_screen_server("template_screen_ui_1")

    # temp code - DELETE when done
    temp_out <- dtedit(
        input, output,
        name = 'pers_table_1',
        thedata = data.frame(
            Buy = c('Tea', 'Biscuits', 'Apples'),
            Quantity = c(7, 2, 5),
            stringsAsFactors = FALSE
        )
    )

}
