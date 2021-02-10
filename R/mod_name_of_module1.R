#' name_of_module1 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
#' @import shinycssloaders
mod_name_of_module1_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidPage(
      fluidRow(
        h1("Shiny css loader demo")
      ),
      fluidRow(
        plotOutput(ns("my_plot")) %>% withSpinner(),
        sliderInput(ns("slider1"), "Choose number", 10, 100, 1)
      )
    )
  )
}
    
#' name_of_module1 Server Function
#'
#' @noRd 
mod_name_of_module1_server <- function(input, output, session){
  ns <- session$ns
  output$my_plot <- renderPlot({
    Sys.sleep(2)
    hist(rnorm(input$slider1))
  })

}
    
## To be copied in the UI
# mod_name_of_module1_ui("name_of_module1_ui_1")
    
## To be copied in the server
# callModule(mod_name_of_module1_server, "name_of_module1_ui_1")
 
