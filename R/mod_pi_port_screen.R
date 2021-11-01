#' pi_port_screen UI Function
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
#' @import dplyr
#' @import margirittr
mod_pi_port_screen_ui <- function(id){
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
        selectInput("pi", "Select PI", choices = sort(unique(dept_portfolio_data$last_name)))
    ),
    box(
        title = "PI Portfolio",
        width = 12,         
        height = "2500px",
        solidHeader = TRUE,
        background = "danger",  
        closable = FALSE,
        maximizable = TRUE,
        dteditmodUI(ns("portfolio_table_1"))
    )
 
  )
}
    
#' pi_port_screen Server Functions
#'
#' @noRd 
mod_pi_port_screen_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 

#------------------------------------------------------------------
# Box - dept. portfolio data
# TEMP CODE

    port_df <- data.frame(dept_portfolio_data)

    pi_df <- port_df %>%

    
    port_out <- callModule(
        dteditmod,
        id =  "portfolio_table_1",
        thedata = pi_df,
        datatable.options = list(scrollX = TRUE,       # class = 'cell-border stripe'
                                 autoWidth = TRUE,
        columnDefs = list(list(className = 'dt-center', targets = 3)),
        class = 'cell-border stripe') # none of this works. Try datatable.call()
    )

#    print(str(dept_portfolio_data))
#------------------------------------------------------------------

  })
}
    
## To be copied in the UI
# mod_pi_port_screen_ui("pi_port_screen_ui_1")
    
## To be copied in the server
# mod_pi_port_screen_server("pi_port_screen_ui_1")
