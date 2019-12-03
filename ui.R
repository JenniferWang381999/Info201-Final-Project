#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# 


library(shiny)
library(shinythemes)
library(ggplot2)
library(reshape2)
library(lubridate)
library(plotly)
source("average_means_graph.R")


ui <- shinyUI(navbarPage(theme = shinytheme("cerulean"),
                    tags$b("HOUSING PRICES ANALYSIS"), 
    
   page_Overview <- tabPanel(
        "SUMMARY",
                        
        #title of Summary Tab 
        titlePanel("Overview of the Analysis"), 
        
        mainPanel(
            h4("Link to the Wiki : "), 
            h4("https://github.com/JenniferWang381999/Info201-Final-Project/wiki/Technical-Report"),
            h5("Here we will have an overview of the Analysis: 
                1. Questions we are trying to answer, and why it is important.  
                2. Brief explanation for navigation ")
        )
    ),
                    
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
                sliderInput("bins1",
                            "Include Years",
                            min = 2015,
                            max = 2019,
                            value = 5
                ),
                # Dropdown List of cities 
                selectInput(
                    "city", "View by a Specific City :",
                    c("Boston", "Los Angeles", "New York", "San Francisco", "Seattle")                
                )
            ),
            
            # Plot of the Q1. 
            mainPanel(
                h4("Under Construction : 
                    PLEASE go to Tab 2: 
                    RENT ANALYSIS BY MONTH to see the minimally functioning shinyApp"),
                h5("There will be an interactive map showing the rent prices 
                   according to the city/year, and detailed information and analysis of the 
                   question and on the map here.")
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
                sliderInput("slider_range2",
                            "Include Years",
                            min = 2015,
                            max = 2019,
                            value = c(2015,2016),
                            sep = ""
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
                plotlyOutput("seattle"),
                textOutput("TEST_Code"),
                h5("There will be a detailed description of the graph and the analysis of the graph")
            )
        )
    ),
    
   #tab three - conclusion 
   page_three <- tabPanel(
     "CONCLUSION",
     
     #title of Info tab 
     titlePanel("CONCLUSION of the Analysis"),
     
     mainPanel(
       #header text : maybe use verbatim box? 
       h5("Will list the conclusion of the analysis and 
          include the link to the technical report here.")
       
     )
   ), 
  
   #tab four - information about us. 
    page_four <- tabPanel(
        "Info",
        
        #title of Info tab 
        titlePanel("About Us"),
        
        #main panel content 
        mainPanel(
          #header text : maybe use verbatim box? 
          h5("Information about the group members will be under this tab."), 
          h3(tags$b("GROUP MEMBERS")), 
          h5("in alphabetical order"), 
          tags$br(), 
          
          #Annie 
          h4(tags$b("Annie")),
          
          tags$br(), 
          
          #Israel 
          h4(tags$b("Israel")),
          
          tags$br(), 
          
          #Jennifer 
          h4(tags$b("Jennifer")),
          
          tags$br(), 
          
          #Jin 
          h4(tags$b("Jin")),
          h5("Created the UI and the Server of the ShinyWebApp."), 
          h5("I am a UW Junior, majoring in Informatics")
          
          
        )
    )
    
))


