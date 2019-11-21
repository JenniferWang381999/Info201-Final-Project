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
source("average_means_graph.R")

server <- function(input, output) {
  
  # for visualization on tab 3 - 
  # Research Question 2 (ggplot map of housing prices in Seattle)
    output$seattle <- renderPlot({
      
        ggplot(data = avg_means2,
               aes(x = months, y = price, color = Bedroom_Size), group = 3) +
        # Points are placed the prices of housing for each month, separated by the
        # Bedroom Size.
        geom_point() +
        ggtitle("Rental Listing Trend") +
        xlab("Year-Month") +
        ylab("Price ($)") +
        # Turns the x-axis labels to 45 degrees so that it is readable
        # This solution was taken from the second answer in this post:
        # https://stackoverflow.com/questions/50399838/how-to-alternate-a-new-line
        # -for-overlapping-x-axis-labels
        theme(axis.text.x  = element_text(angle=45, hjust = 1))
    })
    
    #For text output 
    output$TEST_Code <- renderText({
      paste("This page has the minimally functioning ShinyApp")
    })
  
   # for debugging:  print("bottom")
}
