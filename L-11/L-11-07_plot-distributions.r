# ==========================================================================
#  50 Things You Should Know About Data
#
#  L-11-07   ggplot2 distributions
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



# exercise 1
# ---------------------------------------------------------
###   A   --> 3
airbnb %>%
  ggplot(aes(x="1", y=average_rate_per_night)) +
  geom_point(alpha=0.01)


###   B   --> 2
airbnb %>%
  ggplot(aes(x="1", y=average_rate_per_night)) +
  geom_point()


###   C   --> 4
airbnb %>%
  ggplot(aes(x="1", y=average_rate_per_night)) +
  geom_jitter()


###   D   --> 1
airbnb %>%
  ggplot(aes(x="1", y=average_rate_per_night)) +
  geom_jitter(alpha=0.01)




# exercise 2
# ---------------------------------------------------------
# only top 5 cities
top_5 <- airbnb %>% count(city) %>% arrange(desc(n)) %>% head(5) %>% pull(city)
top_5

airbnb %>%
#  filter(city %in% pull(top_5, city)) %>%
  filter(city %in% top_5) %>%
  ggplot(mapping=aes(x=city, y=average_rate_per_night)) +
  geom_jitter(alpha=0.2)



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
# 3  Histogram and density charts
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
#   4 Histogram and density charts in {ggplot2}
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

#
# ---------------------------------------------------------
airbnb %>%
  ggplot(aes(x=average_rate_per_night)) +
  geom_histogram()
#  geom_density()

#
# ---------------------------------------------------------
airbnb %>%
  filter(average_rate_per_night < 200) %>%
  ggplot(aes(x=average_rate_per_night)) +
  geom_histogram()


# exercise 3
# ---------------------------------------------------------
# only top 5 cities
airbnb_top_3 <- airbnb %>%
                count(city) %>% arrange(desc(n)) %>% head(3) %>% pull(city)
airbnb_top_3

airbnb %>% filter(city == "Houston" | city == "Austin" | city == "San Antonio" | city == "Dallas" | city == "Fort Worth") %>%
            distinct(city)


## 1
airbnb %>%
  filter(city %in% airbnb_top_3,
         average_rate_per_night < 150) %>%
  ggplot(aes(x=average_rate_per_night, color=city, fill=city)) +
  geom_density(aes(group=city), alpha=0.1)

## 2
# ...

## 3
airbnb %>%
  filter(city %in% airbnb_top_3,
         average_rate_per_night < 150) %>%
  ggplot(aes(x=average_rate_per_night, color=city, fill=city)) +
  geom_density(aes(group=city), alpha = 0.1)


## 3-b
airbnb %>%
  filter(city %in% airbnb_top_3,
         average_rate_per_night < 150) %>%
  ggplot(mapping=aes(x=average_rate_per_night, color=city, fill=city)) +
  geom_density(alpha = 0.1)



