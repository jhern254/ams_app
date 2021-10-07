#' pfr_screen UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_pfr_screen_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
        h1("Project Financial Report"),
#                column(12, rHandsontableOutput("pfr_rtable"))
        column(12, sliderInput(inputId = ns("bins"),
                      label = "Number of bins:",
                      min = 1,
                      max = 50,
                      value = 30)),
        column(12, plotOutput(outputId = ns("distPlot")))
    )
  )
}
    
#' pfr_screen Server Functions
#'
#' @noRd 
mod_pfr_screen_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    # test output - works. Put in module server
    output$distPlot <- renderPlot({
        x    <- faithful$waiting
            bins <- seq(min(x), max(x), length.out = input$bins + 1)

            hist(x, breaks = bins, col = "#75AADB", border = "white",
                          xlab = "Waiting time to next eruption (in mins)",
                                   main = "Histogram of waiting times")
                })
 
  })
}
    
## To be copied in the UI
# mod_pfr_screen_ui("pfr_screen_ui_1")
    
## To be copied in the server
# mod_pfr_screen_server("pfr_screen_ui_1")
