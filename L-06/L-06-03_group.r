# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 6-03  group
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
library(readr)
library(tibble)
library(dplyr)


# load data
# ---------------------------------------------------------
stones_data = read_csv("L-04/data/rolling_stones.csv",
                       col_types = cols(release_year = col_integer()))


glimpse(stones_data)


sales_report = read_delim("L-04/data/sales_data.tsv",
                          "\t", escape_double = FALSE, trim_ws = TRUE,
                          skip = 3,
                          col_types = cols(order_id = col_integer(),
                                           quantity = col_integer() ))
sales_report


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
#     group by
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


# info
# ---------------------------------------------------------
# Without group_by()
stones_data


# With group_by()
stones_data %>%
  group_by(release_year)
#   --> a tibble with groups (2nd line)


# initial question
stones_data %>%
  group_by(release_year) %>%
  summarise(avg_popularity = mean(song_popularity)) %>%
  arrange(release_year)


# exercise 1
# ---------------------------------------------------------
### v1
stones_data %>%
  group_by(release_year) %>%
  mutate( max_duration = max(song_duration) ) %>%   # add column
  filter(release_year == 2018)

### v2
stones_data %>%
  group_by(release_year) %>%
  summarise(max_duration  = sum(song_duration)) %>% View()



# exercise 2
# ---------------------------------------------------------
library(lubridate)

### v1
sales_report %>%
  mutate(order_year = year(dmy(order_date))) %>%
  group_by(order_year) %>%
  filter(order_year == 2005) %>%
  mutate(nof_orders = n())

### v2
sales_report %>%
  mutate(order_year = year(dmy(order_date))) %>%
  group_by(order_year) %>%
#  filter(order_year == 2005) %>%
  summarise(nof_orders = n())

### v3
sales_report %>%
  group_by(ORDER_YEAR=year(dmy(order_date))) %>%
  mutate(orders_per_year = n())


# exercise 3
# ---------------------------------------------------------
stones_data %>%
  group_by(live) %>%
#  filter(song_popularity > 0) %>%
  summarise(mean_popularity = mean(song_popularity))


# exercise 4
# ---------------------------------------------------------
sales_report %>%
  mutate(sales = quantity * unit_price) %>%
  group_by(product_type) %>%
  summarise(sales = sum(sales)) %>%
  arrange(desc(sales)) %>%
  head(3)


# info    ungroup
# ---------------------------------------------------------
sales_report %>%
  mutate(sales = unit_price * quantity) %>%
  group_by(product_type) %>%
  summarise(sales = sum(sales)) %>%
  ungroup()



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
#     multi group
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


# exercise 5
#
# In stones_data, how would you get the shortest song per year and
# separating live (live=TRUE) from studio (live=FALSE).
# ---------------------------------------------------------

### V1: by Xavier
stones_data %>%
  group_by(release_year, live) %>%
  summarise(min_duration = min(song_duration)) %>%
  ungroup()


### v2: I'd like to see the song name for the shortest song per year and separted by LIVE
# NOT WORKING
stones_data %>%
  filter(release_year == 1991) %>%                           # in 1991 we have LIVE and STUDIO recordings
  select(song_name, release_year, live, song_duration) %>%   # only the relevant columns
  group_by(release_year, live) %>% view()
  summarise(shortest = min(song_duration)) %>% view()
  ungroup()

  # NOT WORKING
stones_data %>%
  filter(release_year == 1991) %>%                           # in 1991 we have LIVE and STUDIO recordings
  select(song_name, release_year, live, song_duration) %>%   # only the relevant columns
  arrange(live, song_duration)

# ??? how can I get such a list of songs ?
#
# expected result
  #    Sex Drive                    1991    FALSE   268.
  #    Continental Drift - Live     1991    FALSE    27.7
