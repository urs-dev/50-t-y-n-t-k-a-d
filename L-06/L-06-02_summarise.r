# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 6-02  summarise
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
  summarise(total_duration = sum(song_duration))


# exercise 1
# ---------------------------------------------------------
###  v1
sales_report %>%
  mutate(sales = unit_price * quantity) %>%
  summarise(number_of_order = n(),
            total_sales = sum(sales))

###  v2
sales_report %>%
  summarise(nof_order = n(),
            total_sales = sum(quantity * unit_price)
            )


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



