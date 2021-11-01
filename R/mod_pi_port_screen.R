#' pi_port_screen UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_pi_port_screen_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' pi_port_screen Server Functions
#'
#' @noRd 
mod_pi_port_screen_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_pi_port_screen_ui("pi_port_screen_ui_1")
    
## To be copied in the server
# mod_pi_port_screen_server("pi_port_screen_ui_1")
