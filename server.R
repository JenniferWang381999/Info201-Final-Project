#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#


library(shiny)
library(ggplot2)
library(reshape2)
library(lubridate)
source("average_means_graph.R")

# Define server logic required to draw a histogram
server <- function(input, output) {
  avg_means <- read.csv("data/seattle_apt_2015_2019.csv",
                        stringsAsFactors = FALSE)
  
  # Creates new dataframe where each bedroom size, month, and price is in one
  # column. This solution was taken from the first answer in this post:
  # https://stackoverflow.com/questions/27382649/a-line-graph-for-each-row
  avg_means2 <- melt(
    avg_means, id = "Bedroom_Size", na.rm = TRUE, value.name = "price"
  )
  
  # Removes the "X" and converts the variable column into dates
  avg_means2$variable <- format(
    as.Date(avg_means2$variable, format = "X%Y.%d"), "%Y-%d")
  
  
    output$seattle <- renderPlot({

      # How to filter by two standards? one by year, and one by months only? IF year then show t
      # the years only and the months then filter the months only? 
      # Creates a data plot.
        ggplot(data = avg_means2,
               aes(x = variable, y = price, color = Bedroom_Size), group = 3) +
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
    
    output$TEST_Code <- renderText({
      paste("This page has the minimally functioning ShinyApp")
    })
    
}
