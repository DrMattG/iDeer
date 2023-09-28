#function to create tab1
Tab1UI <- function(id) {
  ns <- NS(id)
  # Define UI for module 1
  fluidPage(
    h3("IDeer")
    
  )
}

Tab1Server <- function(id,appData) {
  moduleServer(
    id,
    function(input, output, session) {
      
      
    }
  )
}