# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 4-04
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
songs_by_year <- arrange(stones_data, release_year)
songs_by_year


# exercise
# ---------------------------------------------------------
arrange(stones_data, song_popularity)

view(arrange(stones_data, song_popularity))



# exercise
# ---------------------------------------------------------
arrange(stones_data, desc(song_popularity))


# exercise
# ---------------------------------------------------------
view(arrange(stones_data, release_year, desc(song_popularity)))


# exercise
# ---------------------------------------------------------
arrange(sales_report, desc(quantity) )

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



