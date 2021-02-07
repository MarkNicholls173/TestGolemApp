#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinydashboard
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here 
    dashboardPage(
      dashboardHeader(
        title = "Test Golem App"
      ), 
      dashboardSidebar(
        sidebarMenu(
          menuItem("Dashboard",
            tabName = "dashboard",
            icon = icon("dashboard")
          ),
          menuItem("Module 1",
            tabName = "module1",
            icon = icon("th")
          )
        )
        
      ), 
      dashboardBody(
        tabItems(
          #first tab content
          tabItem(tabName = "dashboard",
            h1("TestGolemApp")
          ),
          
          #second tab content
          tabItem(tabName = "module1",
            h1("module 1 content")
          )
        )
      )
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
      app_title = 'TestGolemApp'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

