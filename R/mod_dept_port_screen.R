#' dept_port_screen UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_dept_port_screen_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
        h2("Department Portfolio"),
    ),
    box(
        title = "Portfolio",
        width = 12,         
        height = "2500px",
        solidHeader = TRUE,
        background = "lightblue",  
        closable = FALSE,
        maximizable = TRUE
#        dteditmodUI(ns("portfolio_table_1"))
    )
 
  )
}
    
#' dept_port_screen Server Functions
#'
#' @noRd 
mod_dept_port_screen_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
# TEMP CODE
    



  })
}
    
## To be copied in the UI
# mod_dept_port_screen_ui("dept_port_screen_ui_1")
    
## To be copied in the server
# mod_dept_port_screen_server("dept_port_screen_ui_1")
