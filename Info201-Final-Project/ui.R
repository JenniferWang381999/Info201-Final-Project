#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library("shiny")
library("shinythemes")


shinyUI(navbarPage(theme = shinytheme("cerulean"),
                    "HOUSING PRICES ANALYSIS", 
    page_one <- tabPanel(
        #Title of the first question
        "RENT COMPARISON IN 5 CITIES", 
        
        titlePanel("Analysis of Rent Comparison from 2015-2019 in 5 Cities :
                   Seattle, New York, San Francisco, Boston, Los Angeles"),
        
        sidebarLayout(
            # Sidebar with a slider input for number of bins
            sidebarPanel(
                sliderInput("bins",
                            "Include Years",
                            min = 2015,
                            max = 2019,
                            value = 5
                ),
                selectInput(
                    "date", "View by a Specific Year :",
                    c("2015", "2016", "2017", "2018", "2019")                
                )
            ),
            
            # Plot of the Q1. 
            mainPanel(
                plotOutput("distPlot")
            )
        )
        
    ), 

    
    page_two <- tabPanel(
        "RENT ANALYSIS BY MONTH",
        
        #title of second Tab 
        titlePanel("Analysis of Rent Comparison from 2015-2019 by Month, in Seattle")
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

