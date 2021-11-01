#' template_screen UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @import bs4Dash
#' @import DTedit
mod_template_screen_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
        h2("PI Portfolio"),
    ),
    box(
        title = "Search PI",
        width = 12,
        solidHeader = TRUE,     # what does this do?
        background = "danger",  
        closable = FALSE,
        selectInput("pi", "Select PI", choices = sort(unique(dept_portfolio_data$last_name))),
        selectInput("projid", "Select ProjectID", choices = NULL)
    ),
    box(
        title = "PI Portfolio",
        width = 12,         
        height = "500px",
        solidHeader = TRUE,
        background = "danger",  
        closable = FALSE,
        maximizable = TRUE
#        dteditmodUI(ns("portfolio_table_1"))
    )
 
  )
}
    
#' template_screen Server Functions
#'
#' @noRd 
mod_template_screen_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_template_screen_ui("template_screen_ui_1")
    
## To be copied in the server
# mod_template_screen_server("template_screen_ui_1")
