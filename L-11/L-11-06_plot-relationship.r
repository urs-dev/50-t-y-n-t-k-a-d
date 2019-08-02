# ==========================================================================
#  50 Things You Should Know About Data
#
#  L-11-06   ggplot2 relationship
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



# colored points with transparency
# (creating this plot takes quite some time)
# ---------------------------------------------------------
airbnb %>%
  ggplot(mapping=aes(x= bedrooms_count,
                     y= average_rate_per_night)) +
  geom_point(size=3, shape=13, color="green", alpha=0.1)

airbnb %>%
  ggplot(mapping=aes(x= bedrooms_count,
                     y= average_rate_per_night)) +
  geom_point(size=3, shape=13, color="green")

# plot points colored by variable
# ---------------------------------------------------------
airbnb %>%
  ggplot(mapping=aes(x= bedrooms_count,
                     y= average_rate_per_night)) +
  geom_point(size=3, aes(color=date_of_listing))



# line plot - 1
# ---------------------------------------------------------
listings_per_day <- airbnb %>%
  arrange(date_of_listing) %>%
  group_by(date_of_listing) %>%
  summarise(listings_count = n()) %>%
  ungroup() %>%
  mutate(cum_number_of_listings = cumsum(listings_count))

listings_per_day %>%
  ggplot(mapping=aes(x=date_of_listing,
                     y=cum_number_of_listings)) +
  geom_line()

airbnb %>%
  arrange(date_of_listing) %>%   # sorting
  group_by(date_of_listing)%>%
  summarise(listings_count = n()) %>%
  ungroup() %>%
  mutate(cum_number_of_listings = cumsum(listings_count))





# line plot - 2: multiple lines
# ---------------------------------------------------------
listings_per_day_per_city <- airbnb %>%
  group_by(date_of_listing, city) %>%
  summarise(listings_count = n()) %>%
  ungroup() %>%
  arrange(date_of_listing) %>%
  group_by(city) %>%
  mutate(cum_number_of_listings = cumsum(listings_count)) %>%
  ungroup()

listings_per_day_per_city

listings_per_day_per_city %>%
  ggplot(mapping=aes(x=date_of_listing,
                     y=cum_number_of_listings)) +
  geom_line(aes(group=city, color=city),
            linetype = "dotted") +
  theme(legend.position = 'none')



# bar plot
# ---------------------------------------------------------
listings_per_city <- airbnb %>%
  group_by(city) %>%
  summarise(number_of_listings = n())

listings_per_city %>%
  ggplot(mapping=aes(x=city,
                     y=number_of_listings)) +
  geom_bar(stat="identity")

# only top 5 cities
listings_per_city %>%
  arrange(desc(number_of_listings)) %>%
  head(5) %>%
  ggplot(mapping=aes(x=city,
                     y=number_of_listings)) +
  geom_bar(stat="identity") +
  coord_flip()








