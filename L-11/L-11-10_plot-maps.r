# ==========================================================================
#  50 Things You Should Know About Data
#
#  L-11-10   ggplot2 advanced:  maps
# ==========================================================================

# clean up
#   clear plots: like click on the button clear all plots in the plots panel
#   clean workspace: remove variables ...
#   clear console
# ---------------------------------------------------------
if(!is.null(dev.list())) dev.off()
rm(list=ls())
cat("\014")


# libararies
# ---------------------------------------------------------
library(dplyr)
library(readr)
library(lubridate)
library(stringr)

library(ggplot2)
library(readxl)


# load data
# ---------------------------------------------------------
airbnb_raw = read_csv("L-11/data/airbnb_texas_rental.csv")

glimpse(airbnb_raw)
airbnb_raw                  #  tibble: 18,259 x 10

library(dplyr)
library(stringr)
library(lubridate)

airbnb <- airbnb_raw %>%
  mutate(
    date_of_listing =
      parse_date_time(date_of_listing, orders="bY"),
    bedrooms_count = if_else(bedrooms_count == "Studio",
                             0.5, as.numeric(bedrooms_count)),
    average_rate_per_night =
      as.numeric(str_replace(average_rate_per_night, "\\$", "")))

airbnb



# plot 1
# ---------------------------------------------------------
airbnb %>%
  ggplot(aes(x=longitude, y=latitude)) +
  geom_point(alpha=0.5)



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
#     map
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

#   1   remove existing package
remove.packages("ggmap")


#   2   install new ggmap
if(!requireNamespace("devtools")) install.packages("devtools")
devtools::install_github("dkahle/ggmap", ref = "tidyup")



# plot 2
# ---------------------------------------------------------
library(ggmap)
texas_area <- c(left=-107.86, bottom=25.12, right=-92.26, top=36.94)
texas_map <- get_stamenmap(bbox=texas_area, zoom=6)

#  all points
ggmap(texas_map) +
  geom_point(data=airbnb,
             aes(x=longitude, y=latitude), alpha=0.5) +
  labs(title="Where are AirBNB listings in Texas?",
       subtitle="Geolocation of 18k listings over the last 8 years")


#  hot spots
ggmap(texas_map) +
  geom_density_2d(data=airbnb,
             aes(x=longitude, y=latitude), alpha=0.5) +
  labs(title="Where are AirBNB listings in Texas?",
       subtitle="Geolocation of 18k listings over the last 8 years")





# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
#     interactive maps with {leaflet}
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

install.packages("leaflet")


# plot 3
# ---------------------------------------------------------
library(leaflet)

airbnb %>%
  sample_n(100) %>% # Remove at your own risk
  leaflet() %>%
  addTiles() %>%
  addMarkers(lng=~longitude,lat=~latitude)


# plot 4    with mouse over information
# ---------------------------------------------------------
airbnb %>%
  sample_n(100) %>% # Remove at your own risk
  leaflet() %>%
  addTiles() %>%
  addMarkers(lng=~longitude,lat=~latitude,
             label=~as.character(average_rate_per_night),
             popup=~description)

