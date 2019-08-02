# ==========================================================================
#  50 Things You Should Know About Data
#
#  L-11-05   ggplot2 basics
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


# load data
# ---------------------------------------------------------
airbnb_raw = read_csv("L-11/data/airbnb_texas_rental.csv")

airbnb_raw                  #  tibble: 18,259 x 10


# clean up data: analyze single attributes
# ---------------------------------------------------------
airbnb <- airbnb_raw %>%
  mutate(
    date_of_listing =
      parse_date_time(date_of_listing, orders="bY"),
    bedrooms_count = if_else(bedrooms_count == "Studio",
                             0.5, as.numeric(bedrooms_count)),
    average_rate_per_night =
      as.numeric(str_replace(average_rate_per_night, "\\$", "")))

glimpse(airbnb)



# first plot
# ---------------------------------------------------------
ggplot(data= airbnb,
       mapping=aes(x= bedrooms_count,
                   y= average_rate_per_night))


airbnb %>%
  ggplot(mapping=aes(x= bedrooms_count,
                     y= average_rate_per_night)) +
  geom_jitter() +
  labs(title="Rate per night vs number of bedrooms",
       subtitle="More rooms isn't always more expansive",
       caption="Data from AirBNB",
       x="Bedrooms count", y="Average rate per night")



# exercise
# ---------------------------------------------------------
airbnb %>%
  ggplot(mapping=aes(x= bedrooms_count,
                     y= average_rate_per_night)) +
  geom_jitter() +
#  expand_limits(x = c(0, 15), y = c(0, 11000)) +
    scale_x_continuous(breaks=0:14)
  #  scale_x_continuous(breaks=c(0, 2,4,6,8,10,12,14))
  # scale_x_continuous(breaks=seq(0, 14, by=2))

# exercise
# ---------------------------------------------------------
