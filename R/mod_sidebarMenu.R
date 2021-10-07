#' sidebarMenu UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @import bs4Dash
#' @importFrom shiny NS tagList 
mod_sidebarMenu_ui <- function(id){
  ns <- NS(id)
  tagList(
        sidebarMenu(
            sidebarHeader("Project Financial Report"),
            menuItem(
                "PFR",
                tabName = "pfr",
                icon = icon("table")
            ),
            menuItem(
                "PFR Summary",
                tabName = "pfr_summary",
                icon = icon("sliders")
            ),
            sidebarHeader("Personnel"),
            menuItem(
                "Personnel Info",
                tabName = "pers1",
                icon = icon("id-badge")
            ),
            sidebarHeader("Project Details"),
            menuItem(
                "Financial Sheet",
                tabName = "fin_screen1",
                icon = icon("chart-line")
            )
        ),
    )
 
}
    
#' sidebarMenu Server Functions
#'
#' @noRd 
mod_sidebarMenu_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_sidebarMenu_ui("sidebarMenu_ui_1")
    
## To be copied in the server
# mod_sidebarMenu_server("sidebarMenu_ui_1")
