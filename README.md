# **Housing Price Analysis**
## - Housing Price Report in 5 Major Cities in The United States

#### Team Members And Contact Information:   
Jennifer Wang, yw298@uw.edu   
Jin Son, jinson@uw.edu   
Jisu Kim, anie0521@uw.edu    
Israel Martinez, israelma@uw.edu   

_Info-201: Technical Foundations of Informatics_    
_The Information School_    
_University of Washington_
_Autumn 2019_

### **1.0 Introduction**
1.1 _Problem Situation_

      Every year, a large number of people are moving to new locations for school and work.
      The very first problem they are facing is to find a suitable and affordable apartment or house to live in.
      Our goal for this project is to use open-source data and to find their best option.

1.2 _What is the problem?_

      Renting a home without physically seeing it before people move in is not ideal.
      People have limited time to gather information on the housing,
      and once they start digging into the details, they often feel overwhelmed by the information online.

1.3 _Why does it matter?_

      The problem we are trying to solve matters because it’s a real,
      urgent issue that most people are facing when they move to a new city.

1.4 _How it will be addressed?_

       We will collect our data from open source websites and mostly from Zillow.
       We will analyze and compare housing data for 5 major cities in the United States
       which includes Boston, NYC, Seattle, San Francisco and Los Angeles
### **2.0 Research questions**
<Q1: Which state has the cheapest mean value for rent based on the data from 2015-2019?>(We might change in the future)

<Q2: What is the mean housing price in each city(Los Angeles, San Francisco, Seattle, NYC and Boston) from 2015- 2019, and the trend of the price over the term and predictions of the housing prices in the future?>

<Q3: What is the best month to rent an apartment (1bedroom, 2bedroom, studio) in Seattle based on the data collected between 2015-2019?>

### **3.0 The data set(s)**
Both of our data set was created by Apartment List and it was created in order to provide price transparency to America’s 110 million renters to help them make the best possible decisions in choosing a place to call home. I had access on their "data" page on Apartment List Rentonomics. Each locations represents an "observation" and the variables that each observation have are location type, state, bedroom size, and the price in each month from January, 2014 to October, 2019. The original city data sets we are using have 3376 rows and 74 columns but we created a sub-set and only focused on 5 major cities in the U.S. The data set represents mean value of rent for certain type of house.  

* Strengths: Our data set is clean and organized already, all the prices are rounded up integers and it's the mean price for each month for certain place and we don't have any missing values. According to the Envisioning Cards, it is important to evaluate user experience of values and I think this data set did a great job on this.

* Weaknesses: Since the data set is organized and cleaned already, we don't have access to the original data and in this case, we don't know if the data set is accurate. Another weakness for this data set is that the value they use is dollar-value and for some people who don't live in America and not used to dollar-value, they might have a hard time to analyze it and this is the same phenomenon as "Perceptions of a Value" from the one of the Envisioning Cards. Sometimes stakeholders have different perceptions of the definition of a specific value.

Data wrangling: We first started working on the Seattle city data. Originally, all of the columns except for "Bedroom_size" were month dates and there were 3 rows (the bedroom sizes). To fix this, we used the gather() function to combine all of the month columns into a single column of rows, the "months" column; also, we used "-Bedroom_size" because it's the column we wanted gather data from. This changed the data frame from 3 rows to 174 observations. The final data frame was stored under "avg_means2", in order to indicate that we have manipulated the original data set. After that, we changed the format of months to dates so that we can get rid of the "X" before every date and so the date format can be easier to read.

### **4.0 Information Visualization**
The first visualization we intend to include is a US map which each marker on the map will be represent a state. When clicked on, each point will provide information of mean price for studio, 1bedroom and 2 bedroom of that state. The bigger the marker on the map means the more expensive the rent is for that state. In this way, we can indirectly answer the 1st research question. The second graph will be a bar chart that directly compare the rent for 5 major cities in the United States from 2015-2019. We will include 3 different types of housing which are studio, 1 bedroom and 2 bedroom. The last graph will only focus on the monthly rent for Seattle Area. We used a line chart to see directly which month from January, 2015 to October, 2019 has the cheapest rental price for studio, 1br and 2 br apartments.


### **5.0 Technical description of Shiny application**
(1) We downloaded the csv file from Apartment List and saved in the "data" folder then loaded to the Rstudio. In rstudio, we used read.csv() and stored it in an avg_means variable so that we can manipulate the data frame.    
(2) shiny and shinythems, ggplot2, tidyr, lubridate       
(3) We have ui.R file, server.R, average_mean_graph.R files so far. ui.R will have the UI of the ShinyApp, and will display all visualization of the shinyApp. These displays are created by the server.R file, by using functions such as renderText, and renderPlot. average_mean_graph.R file is the file that we did an analysis of rent for Seattle Area, and this file is sourced into both ui.R and server.R files. In the future, we will do more analysis in the average_mean_graph.R file, rename it to something appropriate and continue to use the file for the source file for the ShinyApp. Dataset used in the source file is kept and will be kept in data folder of our project. All the other files, such as ui.R, server.R and the source file itself will be in the project folder itself (base directory), not under sub-folders.


### **6.0 Conclusion**
(1) Strengths: We have clear graph to answer our research question.
  Weaknesses: We should start working on the project and assign the works earlier.    
(2) We have learned to think more critically and learned data visualization, data wrangling and shiny app from this project.     
(3) In the future, Jin will still work on the shiny app, Israel will do the data wrangling for visualization for 5 major cities in the US and Jisu will use data visualization to present the graph. Jennifer will do the US map data visualization.      

### **Acknowledgements:**
Benji Xie


### **References**
* “U.S. Rent Data - Apartment List Rentonomics.” Rentonomics, https://www.apartmentlist.com/rentonomics/rental-price-data/.
* Excel Easy. Line Chart. n.d. 31 OCT 2019. https://www.excel-easy.com/examples/line-chart.html
* Smoky Mountains. Fall Foliage Map. 2019. 31 OCT 2019. https://smokymountains.com/fall-foliage-map/


### **Appendix 1: Data Dictionary**
The Data Dictionary for original dataset:

| Variable Name | Description     | Data Type    | Measurement Type|
| ------------- |:---------------:|--------------|-----------------|
| Location      |The location of measured place which could be either state or city| Character| Location|
|Location_type|The type of location can be in either state or city|Character|State or city|
| State| The state which measured place at| Character| State|
|Bedroom_size|The size of bedrooms which can be studio, 1br, 2br, 3br, or 4br|Character|The size of bedroom|
|Price_20XX_XX|The rounded up mean price in certain month of certain year(2014-2019)|Integer|Dollar value|

The Data Dictionary for Seattle Monthly Rent Analysis:

| Variable Name | Description     | Data Type    | Measurement Type|
| ------------- |:---------------:|--------------|-----------------|
| Bedroom_size    |The size of bedrooms which can be studio, 1br, 2br, 3br, or 4br| Character| The size of bedroom|
|Price_20XX_XX|The rounded up mean price in certain month of certain year(2014-2019)|Integer|Dollar value|

### **Appendix 2: Reflections**
* Jisu Kim:
      Before P2(group project draft 2), I felt that our project topic was great, but the data was vague because even though there was lots of data on websites, but it was not suitable data that we wanted. Thus, it was hard to decide our questions about the topic. However, while talking about our project after submitting P1, we gradually brainstormed and came to a consensus. While I was doing P2, I learned how I arrange the data for the project and how we work as a team because overall, our team is working great because we are communicating well for the project. As a thinker, I was trying to gather some data for creating an interesting graph, not a common graph that people can expect. So, I was sharing my ideas with data and a rough graph with my team. Also, I received feedback from my team to get better information.
* Jin Son:
        From working on the project, I have grown to become a better coder, thinker, and innovator. I have tried to come up with innovative ideas to solve the questions that we had in mind, such as how to effectively categorize and perform an analysis on the dataset that we have, and pitch and share ideas with the teammates. My main job was to create the ShinyApp Framework and connect the UI to the server to make a minimally functioning ShinyApp. In doing so, I have learned new skills and materials, such as how the server functions, and how to connect it with the UI. Overall, I really enjoyed coding the visualizations into the server. There were obviously some difficulties, such as linking the visualization -- a ggplot of the rental pricing for the 2015-2019 by months in Seattle. For some reason, the graph would not appear on the UI, but texts appeared on the UI with no big problems. I used the textbook, online resources to help me solve my problems. Aside from coding difficulties, there were some parts of the instructions that were unclear to me, but I asked the teammates and the TA -- especially Benji to get more clarification and to make sure that I was on the right track. I think the team worked hard to contribute to the project, and it was nice that the teammates were prompt, and clear in communication. I will continue to communicate and work together as a member of the team, to create a successful result. Next time, if I have to develop, or code from server-side, I think I would be more confident.

* Jennifer Wang:
      I have learned that I need to think more critically through the project, for example, when considering the rental apartment we need to include different house types. I also learned that it is important to communicate effectively with my team members in order to distribute the project properly and as what we expected. One thing I would do differently in the future is to start working on the project as early as possible instead of finishing up the day before it. I also developed the ability to become a better coder, thinker, and innovator from this project. I also had the chance to practice my skills for data visualization by making the US map for average rent.

* Israel Martinez:
      For me, I learned some new ways to design a graph that is easier to decipher. When I first got our graph to start showing up, I noticed that the x-axis labels were a complete disaster. You could not read anything because they were all mushed together. However, I researched different ways that people deal with x-axis labels crossing over each other and I finally found one that worked for our graph. I changed the x-axis labels to be rotated by 45 degrees, so all the x-axis is readable now (if the resize of the plot window is wide enough in rstudio). In the future, I want to ask for more help from the TAs. When I was creating my plot, I think I spent more time researching solutions to my coding problems than actually coding and analyzing data. I believe that getting help from a TA will be much better because it could save me a lot of time and I can focus my energy on coding and data manipulation.


### **Appendix 3: Use of Envisioning Cards**
We used Envisioning Cards as a references to our project. We were able to reflect our Strengths and Weaknesses based on the information on the Envisioning Cards.
