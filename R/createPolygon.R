## create polygon

library(shiny)
library(leaflet)
library(leaflet.extras)



#function to create the Tab2 page
CreatePolyUI <- function(id) {
  ns <- NS(id)
  # Define UI for module 1
  fluidPage(
    h3("Create Polygon"),
    sidebarLayout(
      # Sidebar with a slider input
      sidebarPanel(
        numericInput(ns("lat"),
                     ns("lat"),
                     min = -10000,
                     max = 10000,
                     value = 54.52),
        numericInput(ns("lon"),
                     ns("lon"),
                     min = -10000,
                     max = 10000,
                     value = -1)
      ),
      # Show a plot of the generated distribution
      mainPanel(
        h4("Map here"),
        leafletOutput(ns("map"))
        )
      )
    )
}

CreatePolyServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
     #render leaflet map
       output$map <- renderLeaflet({
        leaflet() %>% 
          addTiles() %>%
          #setView(lng = as.numeric(input$lon), lat = as.numeric(input$lat), zoom = 5) %>%
          addCircleMarkers(lng =as.numeric(input$lon), 
                           lat = as.numeric(input$lat), layerId = -1) %>% 
           addDrawToolbar(targetGroup = "test", 
                         rectangleOptions = F, 
                         polylineOptions = F, 
                         markerOptions = F, 
                         editOptions = editToolbarOptions(selectedPathOptions = selectedPathOptions()), 
                         circleOptions = drawCircleOptions(shapeOptions = drawShapeOptions(clickable = T)))
      })  # END RENDER LEAFLET 
      
      observeEvent(input$map_marker_click, {
        print(input$map_marker_click)
      })  
      
      observeEvent(input$map_draw_new_feature, {
        print(input$map_draw_new_feature)
      })
      
    }
  )
}


