# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 4-05
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
# Select 4 columns
select(stones_data, song_name, song_popularity, song_duration, release_year)

# Filter on popularity
filter(stones_data, song_popularity > 10)

# Order the rows on release_year
arrange(stones_data, release_year)


# A   exercise
# ---------------------------------------------------------
# a
filtered_columns = select(stones_data, song_name, song_popularity, song_duration, release_year)

# b
filtered_by_popul = filter(filtered_columns, song_popularity > 10)

# c
result_arranged = arrange(filtered_by_popul, release_year)

result_arranged

# B   solution with 'nested functions'
# ---------------------------------------------------------
arrange(
  filter(
    select(
      stones_data, song_name, song_popularity, song_duration, release_year
    )
    , song_popularity > 10
  ), release_year
)


# C   piped functions
#     note: tibble is not defined in the (sub-)functions since inserted by the pipe
# ---------------------------------------------------------
select(stones_data, song_name, song_popularity, song_duration, release_year) %>%
  filter(song_popularity > 10)                                               %>%
  arrange(release_year)


# C-2   piped functions
#       note: tibble is not defined in the (sub-)functions since inserted by the pipe
# ---------------------------------------------------------
stones_data %>%
  select(song_name, song_popularity, song_duration, release_year) %>%
  filter(song_popularity > 10)                                               %>%
  arrange(release_year)


# exercise
# ---------------------------------------------------------



# exercise
# ---------------------------------------------------------



# exercise
# ---------------------------------------------------------



# exercise
# ---------------------------------------------------------
