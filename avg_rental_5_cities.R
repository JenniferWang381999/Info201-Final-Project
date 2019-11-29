# five cities data and graph

# install.packages("plotly")
# install.packages("reshape2")

library(plotly)
library(ggplot2)
library(reshape2)
library(dplyr)

# Read apartment list with rental price and years csv file
rental_df <- read.csv("data/Apartment-List-Rent-Data-City_2019-10.csv", stringsAsFactors = FALSE)


# get 5 city dataframe (Seattle, San Fran, LA, NYC, Boston)

five_cities <- c("New York, NY", "Seattle, WA", "San Francisco, CA", "Los Angeles, CA", "Boston, MA")


five_cities_df <- rental_df %>%
  filter(Location %in% five_cities) %>%
  select(-starts_with("Price_2014")) %>%
  mutate("2015" = rowMeans(.[, 5:16], na.rm = TRUE)) %>%
  mutate("2016" = rowMeans(.[, 17:28], na.rm = TRUE)) %>%
  mutate("2017" = rowMeans(.[, 29:40], na.rm = TRUE)) %>%
  mutate("2018" = rowMeans(.[, 41:52], na.rm = TRUE)) %>%
  mutate("2019" = rowMeans(.[, 53:62], na.rm = TRUE)) %>%
  select(-starts_with("Price_"))

# studio dataframe
stu <- c("Studio")
no_need <- c("Location_Type", "State", "Bedroom_Size")

studio_df <- five_cities_df %>%
  filter(Bedroom_Size %in% stu) %>%
  select(-no_need)

# 1br dataframe

one_br <- c("1br")

one_br_df <- five_cities_df %>%
  filter(Bedroom_Size %in% one_br) %>%
  select(-no_need)

# 2br dataframe

two_br <- c("2br")

two_br_df <- five_cities_df %>%
  filter(Bedroom_Size %in% two_br) %>%
  select(-no_need)


# graph

# studio graph 

stu_avg <- melt(
   studio_df, id = "Location", na.rm = TRUE, value.name = "price"
 )

stu_avg$variable <- format(
   as.Date(stu_avg$variable, format = "%Y"), "%Y"
)

head(stu_avg)

ggplot(stu_avg, aes(variable, price, group = Location, color = Location)) +
  geom_point() +
  geom_line() +
  labs(x = "Year", Y = "Price", title = "Studio Price by year and cities")

# one bed graph

onebr_avg <- melt(
  one_br_df, id = "Location", na.rm = TRUE, value.name = "price"
)

onebr_avg$variable <- format(
  as.Date(onebr_avg$variable, format = "%Y"), "%Y"
)

head(onebr_avg)

ggplot(onebr_avg, aes(variable, price, group = Location, color = Location)) +
  geom_point() +
  geom_line() +
  labs(x = "Year", Y = "Price", title = "One Bedroom Price by year and cities")

# two bed graph

twobr_avg <- melt(
  two_br_df, id = "Location", na.rm = TRUE, value.name = "price"
)

onebr_avg$variable <- format(
  as.Date(twobr_avg$variable, format = "%Y"), "%Y"
)

head(twobr_avg)

ggplot(twobr_avg, aes(variable, price, group = Location, color = Location)) +
  geom_point() +
  geom_line() +
  labs(x = "Year", Y = "Price", title = "Two Bedrooms Price by year and cities")

