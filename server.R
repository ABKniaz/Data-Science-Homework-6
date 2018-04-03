# server.R

source("helpers.R")
counties <- readRDS("data/counties.rds")
library(maps)
library(mapproj)

shinyServer(
  function(input, output) {
    
    output$map <- renderPlot({
      
      percent_map( switch(input$var,"Percent White" = counties$white, "Percent Black" = counties$black, "Percent Hispanic" = counties$hispanic, "Percent Asian" = counties$asian) , switch(input$var,"Percent White" = "red3", "Percent Black" = "blue3", "Percent Hispanic" = "green3", "Percent Asian" = "orange3") , input$var, input$range[1], input$range[2])
    })
      
  }
)
    