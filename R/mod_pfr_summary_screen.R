#' pfr_summary_screen UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @import rhandsontable
mod_pfr_summary_screen_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
        column(8, h1("Test Data Sheet")),
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

# TEMP BAD CODE - for demo purposes
pfr_df <- data.frame("Project ID" = 1:10,
                     "Fund Code" = 1:10,
                     "Department" = letters[1:10],
                     "PI" = letters[1:10],
                     "Sponsor" = letters[1:10],
                     "Title" = letters[1:10],
                     "Reference Award Number" = 1:10,
                     "Start Date" = seq(from = Sys.Date(), by = "days", length.out = 10),
                     "End Date" = seq(from = Sys.Date(), by = "days", length.out = 10),
                     "Status" = letters[1:10],
                     "F and A Rate" = 1:10,
                     "Total Revenue" = 1:10,
                     "Budget" = 1:10,
                     "Total Expenses" = 1:10,
                     "Balance" = 1:10,
                     "Encumbrance" = 1:10,
                     "Available Balance" = 1:10,
                     "Costsharing" = 1:10,
                     "Balance after Cost Sharing" = 1:10,
                     check.names = FALSE
        )

pfr_table <- rhandsontable(pfr_df, rowHeaders = NULL)


    output$rtable1 <- renderRHandsontable({
        return(pfr_table)
    })
 
  })
}
    
## To be copied in the UI
# mod_pfr_summary_screen_ui("pfr_summary_screen_ui_1")
    
## To be copied in the server
# mod_pfr_summary_screen_server("pfr_summary_screen_ui_1")
