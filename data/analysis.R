library(dplyr)


apt_df <- read.csv("./data/Apartment-List-Rent-Data-City_2019-10.csv", stringsAsFactors = FALSE)

seattle_value <- apt_df %>%
  filter(Location == "Seattle, WA") %>%
  slice(1:3) %>%
  select(-(Price_2014_01:Price_2014_12))
