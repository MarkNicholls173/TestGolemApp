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
    fluidRow(
      box(title="Shiny spinner on text demo",
          width = 12,
          solidHeader = TRUE,
          collapsible = TRUE,
          collapsed = FALSE,
          status = "primary",
          textInput(ns("text_demo"), label = "enter text"),
          uiOutput(ns("spinner_spinning")) %>% withSpinner(proxy.height = "30px"),
          uiOutput(ns("text_output")),
          actionButton(ns("update_text"), "Do regression")
      ),
      box(title="Shiny css loader demo",
          width = 12,
          solidHeader = TRUE,
          collapsible = TRUE,
          collapsed = FALSE,
          status = "primary",
          plotOutput(ns("my_plot")), # %>% withSpinner(),
          sliderInput(ns("slider1"), "Choose number", 10, 100, 50)
      ),
      box(title="Shiny progress bar demo",
          width = 12,
          solidHeader = TRUE,
          collapsible = TRUE,
          collapsed = FALSE,
          status = "primary",
          actionButton(ns("goPlot"), "go Plot"),
          plotOutput(ns("progress_plot"), width = "300px", height = "300px")
      )
    ),
  )
}
    
#' name_of_module1 Server Function
#'
#' @noRd 
mod_name_of_module1_server <- function(input, output, session){
  ns <- session$ns
  
  rv <- reactiveValues( v = 0 )
  
  output$spinner_spinning <- renderUI({
    if(rv$v == 0){
      NULL
    } else {
      tagList(
        h2(rv$v)
      )
    }
 
    
  })
  
  output$text_output <- renderUI({
    input$update_text 
    isolate(rv$v <- rv$v + 1)
    Sys.sleep(3)
    tagList(
      h2("Done!"),
    )
    
  })
  
  
  output$my_plot <- renderPlot({
    #Sys.sleep(1.5)
    hist(rnorm(input$slider1))
  })
  output$progress_plot <- renderPlot({
    input$goPlot # re-run when button clicked
    
    #create 0-row data frame which will store data
    dat <- data.frame(x = numeric(0), y = numeric(0))
    
    withProgress(message = "Making Plot", value = 0, {
      #number of time to go through loop
      n <- 10
      for (i in 1:n) {
        #do loop add a row of data each time
        #this is stand in for long computaton
        dat <- rbind(dat, data.frame(x= rnorm(1), y = rnorm (1)))
        
        #increment progress bar, update message text
        incProgress(1/n, detail = paste("Doing part", i))
        
        #sleep to simluate long computation
        #Sys.sleep(0.2)
      }
      
      plot(dat$x, dat$y)
    })
    
  })
}
    
## To be copied in the UI
# mod_name_of_module1_ui("name_of_module1_ui_1")
    
## To be copied in the server
# callModule(mod_name_of_module1_server, "name_of_module1_ui_1")
 
