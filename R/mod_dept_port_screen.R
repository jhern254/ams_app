#' dept_port_screen UI Function
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
        maximizable = TRUE,
        dteditmodUI(ns("portfolio_table_1"))
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

#    port_df <- readr::read_rds(dept_portfolio_data)
    port_df <- as.data.frame(dept_portfolio_data)
    
    port_out <- callModule(
        dteditmod,
        id =  "portfolio_table_1",
        thedata = port_df,
        datatable.options = list(scrollX = TRUE,       # class = 'cell-border stripe'
                                 autoWidth = TRUE,
        columnDefs = list(list(className = 'dt-center', targets = 3)),
        class = 'cell-border stripe') # none of this works. Try datatable.call()
    )

#    print(str(dept_portfolio_data))



  })
}
    
## To be copied in the UI
# mod_dept_port_screen_ui("dept_port_screen_ui_1")
    
## To be copied in the server
# mod_dept_port_screen_server("dept_port_screen_ui_1")
