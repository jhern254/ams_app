#' pfr_summary_screen UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_pfr_summary_screen_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
        column(8, h1("Test Data Sheet"))
        column(8, rHandsontableOutput(ns("rtable1")))
    )
  )
}
    
#' pfr_summary_screen Server Functions
#'
#' @noRd 
mod_pfr_summary_screen_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$rtable1 <- renderRHandsontable({
        # INSERT CODE HERE
        return(table)
    })
 
  })
}
    
## To be copied in the UI
# mod_pfr_summary_screen_ui("pfr_summary_screen_ui_1")
    
## To be copied in the server
# mod_pfr_summary_screen_server("pfr_summary_screen_ui_1")
