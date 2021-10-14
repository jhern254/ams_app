#' pfr_screen UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @import DTedit
mod_pfr_screen_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
        h2("Project Financial Report"),
    ),
    box(
        title = "PFR",
        width = 12,         
        height = "2500px",
        solidHeader = TRUE,
        background = "lightblue",  
        closable = FALSE,
        maximizable = TRUE,
        sidebar = boxSidebar(
            id = "mycardsidebar",
            width = 25,
            textInput("other", "Input other options")
        ),
        dteditmodUI(ns("pfr_table_1"))
    )

  )
}
    

#' pfr_screen Server Functions
#'
#' @import DTedit
#' @noRd 
mod_pfr_screen_server <- function(id){
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

    # DTedit module object
    pfr_out <- callModule(
        dteditmod,
        id =  "pfr_table_1",
        thedata = pfr_df,
        datatable.options = list(scrollX = TRUE,       # class = 'cell-border stripe'
                                 autoWidth = TRUE,
        columnDefs = list(list(className = 'dt-center', targets = 3)),
        class = 'cell-border stripe') # none of this works. Try datatable.call()
    )



# NOT WORKING - dtedit obj. not working w/ ns("id")
#    pfr_out <- DTedit::dtedit(
#        input, output,
#        name = 'pfr_table_1',
#        thedata = pfr_df
#    )
#
#        input, output,
#        name = 'pfr_table_1',
#        thedata = mydata)
#    
#    observeEvent(pfr_out$thedata, {
#        message(pfr_out$thedata)
#      })

  })
}
    
## To be copied in the UI
# mod_pfr_screen_ui("pfr_screen_ui_1")
    
## To be copied in the server
# mod_pfr_screen_server("pfr_screen_ui_1")
