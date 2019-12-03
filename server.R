#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
# every time there is an update the app has to be re-deployed (step 3)
# Use the code below to re-publish the webpage 
# library(rsconnect)
# rsconnect::deployApp('path/to/your/app')
#

if(!require('rsconnect')){install.packages('rsconnect')}
library(rsconnect)
library(shiny)
library(ggplot2)
library(reshape2)
library(lubridate)
library(plotly)
source("average_means_graph.R")
source("avg_rental_5_cities.R")

server <- function(input, output) {
  
  output$city_comparison <- renderPlotly({

    if(input$BedroomType == "Studio") {
      return(stu_graph)
    }
    if(input$BedroomType == "One bedroom") {
      return(onebr_graph)
    }
    if(input$BedroomType == "Two bedrooms") {
      return(twobr_graph)
    }
})

  
  
  output$TEST_Code <- renderText({
    paste("This page has the minimally functioning ShinyApp")
  })
  
  


  # for visualization on tab 3 - 
  # Research Question 2 (ggplot map of housing prices in Seattle)
  # How to make months show when zoomed in? 
    output$seattle <- renderPlotly({
      #This links the input to the graph (making the graph "interactive")
       viz2_df <- avg_means2 %>% 
                  filter((input$slider_range2[2]) >= year &
                           year >= (input$slider_range2[1]))
       
       #print(input$slider_range2)
       
       plot_ly(data = viz2_df, x = ~months, y = ~price, type = 'scatter',
                mode = 'markers',
                color = ~Bedroom_Size, marker = list(size = 10))
    })
    
    #Reactive slider range. 
    viz2_range <- reactive({
      cbind(input$range[1],input$range[2])
    })
    
    #For text output 
    output$TEST_Code <- renderText({
      paste("This page has the minimally functioning ShinyApp")
    })
    
    #For Viz2 Slider range
    output$range <- renderPrint({ input$slider2 })

  
   # for debugging:  print("bottom")
}
