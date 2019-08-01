# ==========================================================================
#  50 Things You Should Know About Data
#
#  L-11-04   get dataset for visualization
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
library(tibble)
library(dplyr)
library(readr)
library(lubridate)
library(stringr)


# load data
# ---------------------------------------------------------
airbnb_raw = read_csv("L-11/data/airbnb_texas_rental.csv")

glimpse(airbnb_raw)
airbnb_raw                  #  tibble: 18,259 x 10


# clean up data: analyze single attributes
# ---------------------------------------------------------
# ---
airbnb_raw %>%
  mutate(date_of_listing = parse_date_time(date_of_listing, "bY"))


# ---
airbnb_raw %>%
  pull(bedrooms_count) %>%
  unique

airbnb_raw %>%
  mutate(bedrooms_count = if_else(bedrooms_count == "Studio",
                                  "0.5", bedrooms_count),
         bedrooms_count = as.numeric(bedrooms_count))  # auch Dezimalzahlen
                      #   strtoi(bedrooms_count))        --> nur Ganzzahlen

# ---
airbnb_raw %>%
  pull(average_rate_per_night) %>%
  unique %>%
  length

airbnb_raw %>%
  pull(average_rate_per_night)

airbnb_raw %>%
  filter(!(str_detect(average_rate_per_night, "^\\$[:digit:]+$"))) %>%
  select(average_rate_per_night) %>%
  count()


airbnb_raw %>%
  mutate(average_rate_per_night =
           if_else(average_rate_per_night == "$60",
                   "No Price", average_rate_per_night)) %>%
  filter(!(str_detect(average_rate_per_night, "^\\$[:digit:]+$")))




# clean up data: all together
# ---------------------------------------------------------
airbnb_raw %>%
  mutate(date_of_listing = parse_date_time(date_of_listing, "bY")) %>%

  mutate(bedrooms_count = if_else(bedrooms_count == "Studio",
                                "0.5", bedrooms_count),
       bedrooms_count = as.numeric(bedrooms_count))  # auch Dezimalzahlen




# exercise
# ---------------------------------------------------------
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



# exercise
# ---------------------------------------------------------



# exercise
# ---------------------------------------------------------



# exercise
# ---------------------------------------------------------
