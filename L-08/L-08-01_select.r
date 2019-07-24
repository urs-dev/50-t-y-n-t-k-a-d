# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 08-01		select
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
library(magrittr)
library(stringr)
library(readr)
library(readxl)
library(openxlsx)
#library(DBI)
#library(RSQLite)


# load data
# ---------------------------------------------------------
stones_data = read_csv("L-08/data/rolling_stones.csv",
                       col_types = cols(release_year = col_integer()))
stones_data


sales_xls = read_excel("L-08/data/sales_data_sample.xlsx",
                          sheet = "sales_data_sample", skip = 3)
sales_xls

sales_xls %>% select(contains("ORDER"))

sales_xls %>% select(starts_with("ORDER"))

sales_xls %>% select(ends_with("NAME"))



# exercise 1
# ---------------------------------------------------------
glimpse(stones_data)

stones_data %>% select(contains("song"))

stones_data %>% select(ends_with("name"))

stones_data %>% select(starts_with("song_"))



# exercise 2
# ---------------------------------------------------------
stones_data %>% select(ends_with("_year"), starts_with("song_"))



# exercise 3
# ---------------------------------------------------------
sales_xls %>% select(contains("LINE"), everything())



# exercise 4
# ---------------------------------------------------------
stones_data %>% select(2,1)

sales_xls %>% select(3, everything())



# exercise 5
# ---------------------------------------------------------
sales_xls %>% select_if(is.numeric)



# exercise 6    pull(): one tibble-column -> vector
# ---------------------------------------------------------
sales_xls %>%
  mutate(FULL_ADDRESS = str_glue(
    "{`ADDRESS LINE1`}, {`POSTAL CODE`}, {CITY}")) %>%
  pull(FULL_ADDRESS)



# variantes to get the 34th record
sales_xls %>%
  mutate(full_address = str_glue(
    "{`ADDRESS LINE1`}, {`POSTAL CODE`} {CITY}")) %>%
  pull(full_address) %>%
  extract(34)
#  .[34]
#  head(34)


