library(ggplot2)
library(reshape2)
library(lubridate)


# Read the csv and store it under the name "avg_means"
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


# Return the first and last part of objects in the avg_means2 dataframe.
head(avg_means2)


# Creates a data plot.
ggplot() +
  # Points are placed the prices of housing for each month, separated by the
  # Bedroom Size.
  geom_point(data = avg_means2,
             aes(x = variable, y = price, color = Bedroom_Size), group = 3
  ) +
  # Turns the x-axis labels to 45 degrees so that it is readable
  # This solution was taken from the second answer in this post:
  # https://stackoverflow.com/questions/50399838/how-to-alternate-a-new-line
  # -for-overlapping-x-axis-labels
  theme(axis.text.x  = element_text(angle=45, hjust = 1))