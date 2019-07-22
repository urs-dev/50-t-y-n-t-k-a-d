# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 4-02
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



#     selecting columns    # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# exercise
# ---------------------------------------------------------
select(stones_data, song_name, song_duration)



# exercise
# ---------------------------------------------------------
select(stones_data, song_duration, live, song_popularity)


# exercise
# ---------------------------------------------------------
select(stones_data, song_duration, live, song_duration, song_duration, song_popularity)
# --> no column duplicates!


# exercise
# ---------------------------------------------------------
stones_data
select(stones_data, live, everything())


# exercise
# ---------------------------------------------------------
select(stones_data, -song_popularity, -song_duration)



#     renaming columns    # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# exercise
# ---------------------------------------------------------
names(stones_data)
glimpse(stones_data)

select(stones_data,
       track_name = song_name,
       release_year,
       track_popularity = song_popularity)


# exercise
# ---------------------------------------------------------
test = select(stones_data)

#   --> no columns are defined --> return a valid tibble with 340 records
#                                  but withour data (no columns)
glimpse(test)
View(test)


# exercise
# ---------------------------------------------------------
sales_report = read_delim("L-04/data/sales_data.tsv",
                          "\t", escape_double = FALSE, trim_ws = TRUE,
                          skip = 3,
                          col_types = cols(order_id = col_integer(),
                                           quantity = col_integer() ))

glimpse(sales_report)

select(sales_reports, order_date, quantity)


# exercise
# ---------------------------------------------------------
select(sales_report, year, banana)


# exercise
# ---------------------------------------------------------



# exercise
# ---------------------------------------------------------


# exercise
# ---------------------------------------------------------



# exercise
# ---------------------------------------------------------





