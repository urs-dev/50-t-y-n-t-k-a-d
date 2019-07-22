# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 4-06    create/modify columns
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


#   tibble  1
# ---------------------------------------------------------
tbl = as_tibble(iris)
tbl


#   tibble  2
# ---------------------------------------------------------
tbl = tribble(
  ~x, ~y, ~z,
  #--|--|----
  "a", 2, 3.6,
  "b", 1, 8.5
)
tbl


#   tibble  3
# ---------------------------------------------------------
tbl = tibble(
  x = 1:5,
  y = 1,
  z = x ^ 2 + y
)
tbl

#   tibble  4
# ---------------------------------------------------------
tbl = tibble(
  `:)` = "smile",
  ` ` = "space",
  `2000` = "number"
)
tbl


# exercise
# ---------------------------------------------------------
tbl = tribble(
  ~C1, ~C2,
  #--|--|
  10,NULL,
  20,NULL,
  30,NULL,
  40,NULL,
  50,NULL
)
tbl



# exercise
# ---------------------------------------------------------
tbl2 = tbl %>% mutate(C3 = C1 * 2)

tbl
tbl2


# exercise
# ---------------------------------------------------------
stones_2 =  stones_data %>% mutate(band = 'The Rolling Stones')

stones_data
stones_2


# exercise
# ---------------------------------------------------------
stones_2 =  stones_data %>%
            mutate(band_formed = 1962) %>%
            select(band_formed, everything())
stones_2


# exercise
# ---------------------------------------------------------
stones_data %>%
  mutate(show = live)
stones_2


# exercise
# ---------------------------------------------------------
stones_2 =  stones_data %>%
  mutate(song_popularity = song_popularity / 10)
stones_2


# exercise    v1
# ---------------------------------------------------------
sales_report

library(lubridate)
sales_report2 = sales_report %>%
                mutate(
                  sales = quantity * unit_price,
                  year = year(dmy(order_date))
                )
sales_report2

# exercise    v2
# ---------------------------------------------------------
sales_report2 = sales_report %>%
                  mutate(sales = quantity * unit_price) %>%
                  mutate(year = year(dmy(order_date)))
sales_report2




# exercise
# ---------------------------------------------------------


# exercise
# ---------------------------------------------------------


# exercise
# ---------------------------------------------------------


# exercise
# ---------------------------------------------------------


