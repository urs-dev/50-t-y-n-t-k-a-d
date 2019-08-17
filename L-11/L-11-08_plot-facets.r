# ==========================================================================
#  50 Things You Should Know About Data
#
#  L-11-08   ggplot2 advanced:  facet_wrap
#                               facet_grid
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
library(readxl)


# load data
# ---------------------------------------------------------
sales_xls = read_excel("L-11/data/sales_data_sample.xlsx",
                       sheet = "sales_data_sample", skip = 3) %>%
  janitor::clean_names()  # clean up column names
sales_xls


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
#     facet_wrap
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# example 1
sales_xls %>%
  ggplot(aes(x=quantity_ordered, y=price_each)) +
  geom_jitter() +
  facet_wrap(~dealsize)


# example 2
sales_xls %>%
  ggplot(aes(x=quantity_ordered, y=price_each)) +
  geom_point(aes(color=dealsize))



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
#     facet_grid
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# example 1
sales_xls %>%
  ggplot(aes(x=quantity_ordered, y=price_each)) +
  geom_point() +
  facet_grid(rows=vars(territory),
             cols=vars(dealsize))


# exercise 1
# ---------------------------------------------------------



# exercise 2
# ---------------------------------------------------------

