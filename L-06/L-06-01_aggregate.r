# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 6-01    aggregate
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


# info
# ---------------------------------------------------------
stones_data %>%
  mutate(highest_popularity = max(song_popularity))

stones_data %>%
  mutate(highest_popularity = max(song_popularity, na.rm=TRUE))



# exercise
# ---------------------------------------------------------
###  v1
stones_data %>%
  mutate(max_popularity = max(song_popularity)) %>%
  mutate(popularity_ratio = song_popularity / max_popularity) %>%
  select(song_name, song_popularity, popularity_ratio)  %>% view

###  v2
stones_data %>%
  mutate(popularity_ratio = song_popularity / max(song_popularity)) %>%
  select(song_name, song_popularity, popularity_ratio)





