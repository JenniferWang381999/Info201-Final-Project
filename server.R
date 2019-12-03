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
    
  #   if(input$BedroomType == 'Studio') {
  #     #start with a dataframe from avg_rental_5_cities, 
  #     #create a new df
  #     #use the newly created df to plot 
  #     #Once that works, you can use the filtering part. (refer to output$seattle for code) - year 
  #     print("studio") #for debuggging purpose 
  #     stu_avg <- melt(
  #       studio_df, id = "Location", na.rm = TRUE, value.name = "price"
  #     )
  #     
  #     stu_avg$variable <- format(
  #       as.Date(stu_avg$variable, format = "%Y"), "%Y"
  #     )
  #     
  #     head(stu_avg)
  #     
  #     ggplot(stu_avg, aes(variable, price, group = Location, color = Location)) +
  #       geom_point() +
  #       geom_line() +
  #       labs(x = "Year", Y = "Price", title = "Studio Price by year and cities")
  #     
  #   }
  #   
  #   #This is for the dropdown menu == 'one bedroom' 
  #   if(input$BedroomType == 'One bedroom') {
  #     print("one bed") # for debugging 
  #   }
  #   if(input$BedroomType == 'Two bedrooms') {
  #     
  #   }
  #   

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
  
  output$Test_code1 <- renderText({ 
    paste ("Test Code")})
  


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
