# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 4-07    rename column
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
  select(song_title = song_name, everything())


stones_data %>% rename(SONG_TITLE = song_name,
                       SONG_LENGTH = song_duration)


# exercise
# ---------------------------------------------------------
sales_report %>%
  rename(ORDER_STATUS = status,
         DATE = order_date) %>%
  select(ORDER_STATUS, DATE)


# exercise
# ---------------------------------------------------------



# exercise
# ---------------------------------------------------------



# exercise
# ---------------------------------------------------------



# exercise
# ---------------------------------------------------------



# exercise
# ---------------------------------------------------------



