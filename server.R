library(shiny)

taylor <- function(FUN = f, n = n) {
    
    
}

shinyServer(
    function(input, output) {
        output$text <- renderText({input$f})
    }
)