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
source("avg_rental_5_cities.R")


ui <- shinyUI(navbarPage(theme = shinytheme("cerulean"),
                    tags$b("HOUSING PRICES ANALYSIS"), 
    
   page_Overview <- tabPanel(
     "OVERVIEW",
     
     #title of Summary Tab 
     titlePanel("Students Performance Dataset"), 
     
     mainPanel(
       h3("Our Goal:"),
       h4("Every year, a large number of people are moving to new locations for school and work.
  The very first problem they are facing is to find a suitable and affordable apartment or house 
  to live in. Our goal for this project is to use open-source data to find out the best option of renting."),
       br(),
       h3("Where the dataset is from: "), 
       h4("The dataset is collected from the Apartment List which is the platfrom that connects
               renters and enters with apartment listings through an online marketplace. We downloaded 
               the csv file from the Apartment List Rentonomics and we used data wrangling
               to only focus on the year 2015-2019."),
       br(),
       h3("Link to the Original Data"),
       h4("https://www.apartmentlist.com/rentonomics/rental-price-data/"),
       br(),
       h3("Research Questions:"),
       h4("Q1: What is the average housing price in each city (Los Angeles, San Francisco, 
            Seattle, NYC and Boston) from 2015- 2019, and the trend of the price over the 
            term and predictions of the housing prices in the future?"),
       h4("Q2: What is the best month to rent an apartment (1bedroom, 2bedroom, studio) in Seattle 
               based on the data collected between 2015-2019?"),
       br(),
       h3("Audience:"),
       h4("Our project can be beneficial basically for everyone who wants to move to Boston,
               Los Angeles, New York, San Francisco, and Seattle. Indeed, we focused on the Greater
               Seattle Area to help people estimate the best month to move in."),
       br(),
       h3("Authors and Contact Information"),
       h4("Jennifer Wang, yw298@uw.edu; 
                Jin Son, jinson@uw.edu; 
                Jisu Kim, anie0521@uw.edu; 
                Israel Martinez, israelma@uw.edu")
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
                # Dropdown List of cities 
                selectInput(
                    "BedroomType", "View by a Specific Type of Bedroom :",
                    c("Studio", "One bedroom", "Two bedrooms")                
                )
            ),
            
            # Plot of the Q1. 
            mainPanel(
                h5("This linechart shows the rental price for three different bedroom types which include 
                   studio, 1bedroom and 2 bedroom in 5 major cities in the U.S. from 2015 to 2019."),
                plotlyOutput("city_comparison")
                
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
                plotlyOutput("seattle")
            )
        )
    ),
    
   #tab three - conclusion 
   page_three <- tabPanel(
     "REPORT",
     
     #title of Info tab 
     titlePanel("CONCLUSION ANALYSIS"),
     
     mainPanel(
       #header text : maybe use verbatim box? 
       h3("What is the average housing price in each city (Los Angeles, San Francisco, 
            Seattle, NYC and Boston) from 2015- 2019, and the trend of the price over the 
            term and predictions of the housing prices in the future?"),
       br(),
       h4("The first graph shows the average housing price for 5 major cities in the U.S. from 2015 to 2019.
            From the frist graph, we can conclude that San Francisco has the highest average housing
           price for all three apartment types which includes studio, 1 bedroom and 2 bedroom 
           from 2015-2019 while Seattle has the lowest price for 1 bedroom and 2 bedroom apartments and 
           Los Angeles has the lowest price for studio."),
       
       h4("If we look at the trends over time, we can see that there is a slight increase of rent within
          the years that we studied. San Franscico, haviing the highest rent of all cities, does not experience
           that much of a dramatic change. Whereas cities like Seattle and Los Angeles, had experience a more 
           significant change as they started off with lower pricing, hence creating more room of growth."),
       br(),
       
       h3("What is the best month to rent an apartment (1bedroom, 2bedroom, studio) in Seattle 
               based on the data collected between 2015-2019?"),
       
       h4("The second graph shows a general trend of increasing rent as time passed from January 
          2015 to 2019. Within this trend, there is also a less significant, in terms of magnitude, trend 
          in each year. The rent generally goes up in the first half of the year then decrease a bit after 
          mid year."),
       br(),
       
       h3("Conclusion:"),
       
       h4("By analyzing the graphs we generated, we came to the conclusion that there is indeed an increase 
          in rent in cities that are growing. As cities grow toward its own capacity, the trend of increasing 
          rent slows down. This statement is true regardless of the housing type.")
     )
   ), 
  
   #tab four - information about us. 
    page_four <- tabPanel(
      "ABOUT US",
      
      #title of Info tab 
      titlePanel("About Us"),
      
      #main panel content 
      mainPanel(
        #header text : maybe use verbatim box? 
        h3(tags$b("GROUP MEMBERS")), 
        tags$br(), 
        
        #Annie 
        h4(tags$b("Jisu Kim")),
        h5("I am UW junior, majoring in Informatics"),
        h5("Worked data wrangling and created five cities graph and server part on ShinyWebApp"),
        h5("Email: anie0521@uw.edu"),
        
        tags$br(), 
        
        #Israel 
        h4(tags$b("Israel Martinez")),
        h5("I am UW sophmore, majoring Infomatics"),
        h5("I worked on creating a graph for the average monthly rates in the Seattle area."),
        h5("Email: israelma@uw.edu"),
        
        tags$br(), 
        
        #Jennifer 
        h4(tags$b("Jennifer Wang")),
        h5("I am UW junior, majoring in Mathematics and minor ACMS"),
        h5("I finished the Overview and Conclusion"),
        h5("Email: yw298@uw.edu"),
        
        tags$br(), 
        
        #Jin 
        h4(tags$b("Jin Son")),
        h5("I am a UW Junior, majoring in Informatics"), 
        h5("Created the UI and the Server of the ShinyWebApp."),
        h5("Email: jinson@uw.edu")
      )
    )
    
))


