#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @import bs4Dash
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic 
    dashboardPage(
        title = "AMS Dashboard",
        header = dashboardHeader(
                    title = dashboardBrand(
                        title = ".",
                        color = "gray-dark",
                        image = "https://www.cedars-sinai.org/content/dam/cedars-sinai/brand/brand-content-logo.png" 
                        ),
                    status = "gray-dark"
                    ),
        sidebar = dashboardSidebar(
                    expandOnHover = FALSE,
                    skin = "dark",
                    width = "220px",
                    sidebarUserPanel(
                        name = "Award Management System"
                    ),
#                    mod_sidebarMenu_ui("sidebarMenu_ui_1") 
                    sidebarMenu(
                        sidebarHeader("Project Financial Report"),
                        menuItem(
                            "PFR",
                            tabName = "pfr",
                            icon = icon("table")
                        ),
                        menuItem(
                            "PFR Summary",
                            tabName = "pfr_summary",
                            icon = icon("sliders")
                        ),
                        sidebarHeader("Personnel"),
                        menuItem(
                            "Personnel Info",
                            tabName = "pers1",
                            icon = icon("id-badge")
                        ),
                        sidebarHeader("Portfolios"),
                        menuItem(
                            "Portfolio Details",
                            tabName = "dept_portfolio",
                            icon = icon("chart-line")
                        )
                    )
                ),

        body = dashboardBody(
            tabItems(
                tabItem(
                    tabName = "pfr",    # I think tabName is only for linking to menu
                    mod_pfr_screen_ui("pfr_screen_ui_1")
                ),
                tabItem(
                    tabName = "pfr_summary",
                    mod_pfr_summary_screen_ui("pfr_summary_screen_ui_1")
                ),
                tabItem(
                    tabName = "pers1",
                    fluidRow(
                        # demo functionality
                        column(12, h1("Cedars-Sinai Personnel")),
                        column(3, textInput("firstname", "Personnel First Name")),
                        column(9, textInput("lastname", "Personnel Last Name")),
                        column(3, actionButton("submitPers", "Search Personnel"))
                    ),
                    box(
                        title = "test",
                        width = 11,
                        uiOutput("pers_table_1")
                    )
                ),
                tabItem(
                    tabName = "dept_portfolio",
                    mod_dept_port_screen_ui("dept_port_screen_ui_1")
                )
            )
        ),
        controlbar = dashboardControlbar(
              collapsed = TRUE,
              div(class = "p-3", skinSelector()),
              pinned = FALSE 
            )

# enter more DashboardPage fns here...
    )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'ams'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

#' Notes section:
#' (See if this is ok, or if I should put in README file. How do I track my work?)
