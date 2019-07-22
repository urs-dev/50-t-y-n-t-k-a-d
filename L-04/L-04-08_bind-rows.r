# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 4-08    rename column
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


# exercise 1
# ---------------------------------------------------------
bind_rows(stones_data, stones_data, stones_data)



# exercise 2
# ---------------------------------------------------------
stones_data                           # 340x6 records
select(stones_data, -release_year)    # 340x5 records

bind_rows(
  select(stones_data, -release_year),
  stones_data)
# 680x6 records



# exercise 3
# ---------------------------------------------------------
stones_data                           # 340x6 records

stones_data %>%
  select(album_name, release_year, everything()) %>%
  bind_rows(stones_data) %>%
  View

# result: columns are aligned in order of the first tibble


# exercise 4    remove duplicat rows
# ---------------------------------------------------------
stones_data_3 = stones_data %>%
    bind_rows(stones_data, stones_data, stones_data)

stones_data_3     # 1360 x 6 records

stones_data_4 = stones_data %>%
  bind_rows(stones_data, stones_data, stones_data) %>%
  distinct()

stones_data_4


# exercise 5
# ---------------------------------------------------------
# create a tibble
stones_data %>%
  distinct(release_year)

# create a vector
bind_rows(stones_data, stones_data, stones_data) %>%
  pull(release_year) %>% # pull() converts a tibble column to a vector
  unique()


# exercise 6
# ---------------------------------------------------------
sales_report %>%
  distinct(product_type, deal_size)


# exercise 7
# ---------------------------------------------------------
stones_data %>% select(release_year)  # only 'year'
select(stones_data, -release_year)    # all except 'year'


stones_data %>%
  select(release_year) %>% # Only keeping release_year
  bind_cols(
    select(stones_data, -release_year)) # No release_year

# this creates an error message since not the same amount of rows
stones_data %>%
  select(release_year) %>%
  filter(release_year == 1989) %>% # Create copy with less rows
  bind_cols(select(stones_data, -release_year))






