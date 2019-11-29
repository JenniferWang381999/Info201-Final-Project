#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#


library(shiny)
library(shinythemes)
library(ggplot2)
library(reshape2)
library(lubridate)
source("average_means_graph.R")


shiny <- shinyUI(navbarPage(theme = shinytheme("cerulean"),
                    "HOUSING PRICES ANALYSIS", 
                    
   page_one <- tabPanel(
        #Title of the first question
        "RENT COMPARISON IN 5 CITIES", 
        
        titlePanel("Analysis of Rent Comparison from 2015-2019 in 5 Cities :
                   Seattle, New York, San Francisco, Boston, Los Angeles"),
        
        sidebarLayout
        (
            
            sidebarPanel
            (
                # Sidebar with a slider input for number of bins
                sliderInput("bins",
                            "Include Years",
                            min = 2015,
                            max = 2019,
                            value = 5
                ),
                # Dropdown List of cities 
                selectInput(
                    "date", "View by a Specific City :",
                    c("Boston", "Los Angeles", "New York", "San Francisco", "Seattle")                
                )
            ),
            
            # Plot of the Q1. 
            mainPanel(
                h4("Under Construction : 
                    PLEASE go to Tab 2: 
                    RENT ANALYSIS BY MONTH to see the minimally functioning shinyApp"),
                plotOutput("seattle_Rent_2015_2019"), 
                textOutput("TEST")
            )
        )
        
    ), 

    
    page_two <- tabPanel(
        "RENT ANALYSIS BY MONTH",
        
        #title of second Tab 
        titlePanel("Analysis of Rent Comparison from 2015-2019 by Month, in Seattle"),
        
        sidebarLayout(
            sidebarPanel(
                # Sidebar with a slider input for number of bins
                sliderInput("bins",
                            "Include Years",
                            min = 2015,
                            max = 2019,
                            value = 5
                ),
                # Dropdown List of Months  
                selectInput(
                    "date", "View by a Specific Month :",
                    c("JAN", "FEB", "MAR", "APR", "MAY", "JUN",
                      "JULY", "AUG", "SEPT", "OCT", "NOV", "DEC")                
                )
            ),
            
            mainPanel(
                #header text : maybe use verbatim box? 
                h5("This is a scatterplot chart for rental prices from 
                   January 2015 to October 2019 in Seattle.",
                   "The chart includes prices for studios, one-bedrooms, two-bedrooms"),
                #display the graph
                plotOutput("seattle"),
                textOutput("TEST_Code"),
            )
        )
    ),
    
    page_three <- tabPanel(
        "SUMMARY",
        
        #title of Summary Tab 
        titlePanel("Summary of the Analysis")
    ),
    
    page_four <- tabPanel(
        "Info",
        
        #title of Info tab 
        titlePanel("About Us")
    )
    
))


