#' pfr_screen UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @import rhandsontable
mod_pfr_screen_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
        h1("Project Financial Report"),
        column(12, rHandsontableOutput(ns("pfr_table_1")))
    )
  )
}
    
#' pfr_screen Server Functions
#'
#' @noRd 
mod_pfr_screen_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
# TEMP BAD CODE - for demo purposes
pfr_df <- data.frame("Project ID" = 1:20,
                     "Fund Code" = 1:20,
                     "Department" = letters[1:20],
                     "PI" = letters[1:20],
                     "Sponsor" = letters[1:20],
                     "Title" = letters[1:20],
                     "Reference Award Number" = 1:20,
                     "Start Date" = seq(from = Sys.Date(), by = "days", length.out = 20),
                     "End Date" = seq(from = Sys.Date(), by = "days", length.out = 20),
                     "Status" = letters[1:20],
                     "F and A Rate" = 1:20,
                     "Total Revenue" = 1:20,
                     "Budget" = 1:20,
                     "Total Expenses" = 1:20,
                     "Balance" = 1:20,
                     "Encumbrance" = 1:20,
                     "Available Balance" = 1:20,
                     "Costsharing" = 1:20,
                     "Balance after Cost Sharing" = 1:20,
                     check.names = FALSE
        )

pfr_table <- rhandsontable(pfr_df, rowHeaders = NULL)


    output$pfr_table_1 <- renderRHandsontable({
        return(pfr_table)
    })
  })
}
    
## To be copied in the UI
# mod_pfr_screen_ui("pfr_screen_ui_1")
    
## To be copied in the server
# mod_pfr_screen_server("pfr_screen_ui_1")
