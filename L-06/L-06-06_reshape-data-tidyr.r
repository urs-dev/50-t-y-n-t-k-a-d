# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 6-06    reshape data with TIDYR
#               - gather    columns -> rows
#               - spread    rows    -> columns
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
library(tidyr)
library(tibble)
library(readr)


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
#   EXAMPLE: gather
#
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
### test data

tib = tribble(
  ~NAME   , ~STREET         ,~CITY     ,~ZIPCODE,
  'Julia' ,'Bahnhofstr. 15' ,'Bern'    ,3000,
  'Xavier','Route Cantonale','Lausanne',1015
)
tib

# GATHER: columns -> rows
# ---------------------------------------------------------
tib %>% gather(key="ADDRESS", value = "VALUE",
               STREET, CITY, ZIPCODE) %>%
        arrange(NAME, ADDRESS)

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #



# load data
# ---------------------------------------------------------
stones_data = read_csv("L-06/data/rolling_stones.csv",
                       col_types = cols(release_year = col_integer()))
stones_data


sales_report = read_delim("L-04/data/sales_data.tsv",
                          "\t", escape_double = FALSE, trim_ws = TRUE,
                          skip = 3,
                          col_types = cols(order_id = col_integer(),
                                           quantity = col_integer() ))
sales_report

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
#     GATHER
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


# exercise 1: gather
# ---------------------------------------------------------

#  working !!!
stones_data %>%
  group_by(album_name) %>%
  summarise(
    number_of_songs = n(),
    avg_popularity = mean(song_popularity)) %>%
  tidyr::gather(
    metrics, value, number_of_songs, avg_popularity) %>%
  arrange(album_name)



# exercise 2: sales report
# ---------------------------------------------------------
sales_report %>%
  group_by(product_type) %>%
  summarise(nof_orders = n(),
            total_quantity = sum(quantity)) %>%
  tidyr::gather(metrics, value, nof_orders, total_quantity) %>%
  arrange(product_type)



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
#     SPREAD
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# exercise 3
# ---------------------------------------------------------
# solution by Xavier
stones_data %>%
  group_by(release_year, live) %>%
  summarise(nof_songs = n()) %>%
  tidyr::spread(live, nof_songs, fill=0) %>%
  rename(not_live = 'FALSE', live = 'TRUE')


# solution without SPREAD
stones_data %>%
  group_by(release_year) %>%
  summarise(not_live = sum(live == FALSE),
            is_live = sum(live == TRUE)) %>%
  arrange(release_year)



# exercise 4
# ---------------------------------------------------------
sales_report %>%
  group_by(status, deal_size) %>%
  summarise(nof = sum(quantity*unit_price)) %>%
  tidyr::spread(deal_size, nof, fill=0)

# solution by Xavier
sales_report %>%
  mutate(sales = unit_price * quantity) %>%
  group_by(status, deal_size) %>%
  summarise(sales = sum(sales)) %>%
  tidyr::spread(deal_size, sales, fill=0)



# exercise
# ---------------------------------------------------------



# exercise
# ---------------------------------------------------------



