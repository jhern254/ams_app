golem::detach_all_attached()
golem::document_and_reload()

ui <- mod_dept_port_screen_ui("dept_port_screen_ui_1")
server <- function(input, output, session) {
    callModule(mod_dept_port_screen_server, "dept_port_screen_ui_1", session)
}
shinyApp(ui, server)
