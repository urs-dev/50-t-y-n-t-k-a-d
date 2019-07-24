# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 08-03	rename
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
library(tibble)
library(dplyr)
#library(magrittr)
library(stringr)
library(janitor)
library(readr)
#library(readxl)
#library(openxlsx)
#library(DBI)
#library(RSQLite)



# load data
# ---------------------------------------------------------
stones_data = read_csv("L-08/data/rolling_stones.csv",
                       col_types = cols(release_year = col_integer()))
stones_data



# rename_all
# ---------------------------------------------------------
stones_data %>% rename_all(str_to_lower)

stones_data %>% rename_all(str_to_upper)



# exercise 1
# ---------------------------------------------------------
sales_xls = readxl::read_excel(
  "L-08/data/sales_data_sample.xlsx",
  sheet=2, skip=2)

# a   column name without blanks --> no '`' needed
sales_xls %>%
  janitor::clean_names()

# b
sales_xls =   readxl::read_excel(
  "L-08/data/sales_data_sample.xlsx",
  sheet=2, skip=2) %>%
  janitor::clean_names()

sales_xls


