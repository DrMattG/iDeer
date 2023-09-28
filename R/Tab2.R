#function to create the Tab2 page
Tab2UI <- function(id) {
  ns <- NS(id)
  # Define UI for module 1
  fluidPage(
    h3("Tab2"),
    # Add UI components for module 1
  )
}

Tab2Server <- function(id,appData) {
  moduleServer(
    id,
    function(input, output, session) {
      
      
    }
  )
}