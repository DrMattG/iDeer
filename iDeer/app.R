library(shiny)
library(leaflet)
library(leaflet.extras)



shinyApp(
  ui <- fluidPage(
    
    # Application title
    titlePanel("iDeer"),
    
    sidebarLayout(
      
      # Sidebar with a slider input
      sidebarPanel(
        numericInput("lat",
                    "lat",
                    min = -10000,
                    max = 10000,
                    value = 54.52),
        numericInput("lon",
                     "lon",
                     min = -10000,
                     max = 10000,
                     value = -1)
      
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
    leafletOutput("map")))), 
  
  server <- function(input, output, session){
    
    output$map <- renderLeaflet({
      leaflet() %>% 
        addTiles() %>% 
        addCircleMarkers(lng = as.numeric(input$lon), 
                         lat = as.numeric(input$lat), layerId = 1:length(lats)) %>% 
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
    
  })
