# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 4-03
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


# info
# ---------------------------------------------------------
c(1992, 1995, 2000) == 1995 # return: FALSE  TRUE FALSE


# exercise
# ---------------------------------------------------------
filter(stones_data, song_duration <= 280)


# exercise
# ---------------------------------------------------------
filter(stones_data, song_duration <= 280, release_year == 1989)


# exercise
# ---------------------------------------------------------
filter(stones_data, album_name == 'Flashpoint', live == FALSE)



# exercise
# ---------------------------------------------------------
sales_report = read_delim("L-04/data/sales_data.tsv",
                          "\t", escape_double = FALSE, trim_ws = TRUE,
                          skip = 3,
                          col_types = cols(order_id = col_integer(),
                                           quantity = col_integer() ))
sales_report

filter(sales_report,
       status == "In Process",
       country == "France",
       product_type == "Classic Cars")



# exercise
# ---------------------------------------------------------
filter(sales_report)


# exercise
# ---------------------------------------------------------
filter(sales_report, album_name == "Start me up")


# exercise
# ---------------------------------------------------------
stones_data
filter(stones_data, live)


# exercise
# ---------------------------------------------------------
sales_report
filter(select(sales_report, status, product_type),
       country == "Germany")
