

library(ggplot2)
library(tidyr)
library(lubridate)
library(dplyr)

# Read the csv and store it under the name "avg_means"
avg_means <- read.csv("data/seattle_apt_2015_2019.csv",
                      stringsAsFactors = FALSE)

# Creates new dataframe with a column for all month dates
avg_means2 <- avg_means %>%
  gather(
    key = months,
    value = price,
    -Bedroom_Size
  )

# Removes the "X"
avg_means2$months <- sub("X", "", avg_means2$months)
# Adds a day to the dates so that it is compatible with as.Date() function.
avg_means2$months <- paste0(avg_means2$months, ".01")

# Adds a "year" column specifying the year.
avg_means2 <- mutate(
  avg_means2,
  year = format(as.Date(months, format = "%Y.%m.%d"), "%Y")
)


# Converts the "months" column into dates, data type is double.
avg_means2$months <- as.Date(avg_means2$months, format = "%Y.%m.%d")


# Return the first and last part of objects in the avg_means2 dataframe.
head(avg_means2)

# Creates a data plot.
ggplot() +
  # Points are placed the prices of housing for each month, separated by the
  # Bedroom Size.
  geom_point(data = avg_means2,
             aes(x = months, y = price, color = Bedroom_Size), group = 3
  ) +
  # Turns the x-axis labels to 45 degrees so that it is readable
  # This solution was taken from the second answer in this post:
  # https://stackoverflow.com/questions/50399838/how-to-alternate-a-new-line
  # -for-overlapping-x-axis-labels
  theme(axis.text.x  = element_text(angle=45, hjust = 1)) +
  ggtitle("Rental Listing Trend")