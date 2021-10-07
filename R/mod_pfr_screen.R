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
    ),
    box(
        title = "PFR",
        width = 11,         # 12 gives 2nd scroll bar
        height = "500px",
        solidHeader = TRUE,
#        background = "gray-dark",  # TODO: use after changing to DTedit tables
        closable = FALSE,
        maximizable = TRUE,
        rHandsontableOutput(ns("pfr_table_1"))
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

# set height
pfr_table <- rhandsontable(pfr_df, rowHeaders = NULL, height = 450)


    output$pfr_table_1 <- renderRHandsontable({
        return(pfr_table)
    })
  })
}
    
## To be copied in the UI
# mod_pfr_screen_ui("pfr_screen_ui_1")
    
## To be copied in the server
# mod_pfr_screen_server("pfr_screen_ui_1")
