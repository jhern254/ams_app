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
#' @import magrittr
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
        selectInput("pi", "Select PI", choices = sort(unique(dept_portfolio_data$last_name)),
                    selected = NULL)
    ),
    box(
        title = "PI Portfolio",
        width = 12,         
        height = "2500px",
        solidHeader = TRUE,
        background = "danger",  
        closable = FALSE,
        maximizable = TRUE,
        tableOutput("tabledata")
#        dteditmodUI(ns("portfolio_table_1"))
    )
 
  )
}
    
#' pi_port_screen Server Functions
#'
#' @noRd 
mod_pi_port_screen_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
# temp code
    pfr_df <- data.frame("Project ID" = 1:26,
                     "Fund Code" = 1:26,
                     "Department" = letters[1:26],
                     "PI" = letters[1:26],
                     "Sponsor" = letters[1:26],
                     "Title" = letters[1:26],
                     "Reference Award Number" = 1:26,
                     "Start Date" = seq(from = Sys.Date(), by = "days", length.out = 26),
                     "End Date" = seq(from = Sys.Date(), by = "days", length.out = 26),
                     "Status" = letters[1:26],
                     "F and A Rate" = 1:26,
                     "Total Revenue" = 1:26,
                     "Budget" = 1:26,
                     "Total Expenses" = 1:26,
                     "Balance" = 1:26,
                     "Encumbrance" = 1:26,
                     "Available Balance" = 1:26,
                     "Costsharing" = 1:26,
                     "Balance after Cost Sharing" = 1:26,
                     check.names = FALSE
    )

    pi_df <- reactive({ 
        port_df <- data.frame(dept_portfolio_data)
        port_df
#        filter(last_name == input$pi)
    })

    output$tabledata <- renderTable({
#        req(input$pi)

#        pi_df()
        pfr_df
    })


#------------------------------------------------------------------
# Box - dept. portfolio data - WORK ON LATER
# TEMP CODE
#
#    port_df <- data.frame(dept_portfolio_data)
#
#    pi_df <- reactiveVal({ 
#        port_df %>%
#        filter(last_name == input$pi)
#    })
#
#    
#    port_out <- callModule(
#        dteditmod,
#        id =  "portfolio_table_1",
#        thedata = pi_df,
#        datatable.options = list(scrollX = TRUE,       # class = 'cell-border stripe'
#                                 autoWidth = TRUE,
#        columnDefs = list(list(className = 'dt-center', targets = 3)),
#        class = 'cell-border stripe') # none of this works. Try datatable.call()
#    )
#
#------------------------------------------------------------------

  })
}
    
## To be copied in the UI
# mod_pi_port_screen_ui("pi_port_screen_ui_1")
    
## To be copied in the server
# mod_pi_port_screen_server("pi_port_screen_ui_1")
