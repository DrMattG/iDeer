generateIdeer <- function(){
  
  ui <- fluidPage(
    navbarPage(
      "iDeer",
      id="navbar",
      tabPanel("Tab1", id = "Tab1"),
      tabPanel("Tab2", id = "Tab2"),
      tabPanel("createPolygonTab", id = "createPolygonTab")
      ),
    uiOutput("tab_content")
  )
  
  server <- function(input, output, session) {
    
    observeEvent(input$navbar, {
      tab <- input$navbar
      
      output$tab_content <- renderUI(
        if (tab == "Tab1") {
          Tab1UI("Tab1")
        }  else if (tab == "Tab2") {
          Tab2UI("Tab2")
        } else if(tab=="createPolygonTab"){
          CreatePolyUI("createPolygonTab")
        }
      )
    })
    
    # Call module server functions
    Tab1Server("Tab1")
    Tab2Server("Tab2")
    CreatePolyServer("createPolygonTab") 
    }
  
  shinyApp(ui, server)
}
