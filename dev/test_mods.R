#' @import shiny
#' @import bs4Dash
# these need fns to run?

# app skeleton
if(TRUE) {
app  <- shinyApp(
ui = fluidPage(
    textInput("label", "label")
#ui = dashboardPage(
#    header = dashboardHeader(),
#    sidebar = dashboardSidebar(),
#    body = dashboardBody()
),
server = function(input, output, session) {

}
)
runApp(app, port=7777)
}

