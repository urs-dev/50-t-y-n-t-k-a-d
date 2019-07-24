# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 07-10    R vs SQL
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
# install.packages("DBI")
# install.packages("RSQLite")

library(DBI)
library(RSQLite)
library(readxl)
library(openxlsx)
library(tibble)
library(dplyr)


# load data from SQLite database
# ---------------------------------------------------------
shop_db = dbConnect(RSQLite::SQLite(), "L-07/data/shop.db")

dbListTables(shop_db)

# Only close connection when you don't need to talk to the database anymore
# (usually toward the end of your script)
dbDisconnect(shop_db)


# test a select statement
# ---------------------------------------------------------
sales = as_tibble(DBI::dbGetQuery(shop_db,
                                  "select * from sales;"))
sales

customers = as_tibble(DBI::dbGetQuery(shop_db,
                                      "select * from customers;"))
customers


# info / test
# ---------------------------------------------------------
sales
customers

sales %>%
  left_join(customers, by=c("customer_id")) %>%
  select(first_name, last_name, date, price)

dbDisconnect(shop_db)




# exercise 1    table as a datasource
# ---------------------------------------------------------
shop_db = dbConnect(RSQLite::SQLite(), "L-07/data/shop.db")

customers_tbl = tbl(shop_db, "customers")

customers_tbl
class(customers_tbl)  # tbl_SQLiteConnection

#   output of "customer_tbl"
#
#   # Source:   table<customers> [?? x 5]
#   # Database: sqlite 3.22.0
#   #   [D:\6_DEV\RStudio\r_workspace\50-t-y-n-t-k-a-d\L-07\data\shop.db]
#     customer_id first_name last_name   age gender
#           <int> <chr>      <chr>     <int> <chr>
#   1           1 Courtney   Little       17 Female
#   2           2 Olga       Stein        34 Female
#   3           3 Byron      Morgan       22 Male
#   4           4 Jeff       Byrd         21 Male

# INFO:
customers_tbl %>%
  select(first_name) %>%
  show_query()


# join with R
sales_tbl = tbl(shop_db, "sales")

# show join query
customers_tbl %>%
  left_join(sales_tbl, by=c("customer_id")) %>%
  show_query()

# get data for join
customers_tbl %>%
  left_join(sales_tbl, by=c("customer_id"))



# Info: show query
customers_tbl %>%
  select_if(is.numeric) %>%
  show_query()


# Info: get the full data result
customers_tbl %>%
  select(first_name) %>%
  collect()

tbl(shop_db, "customers") %>%
  collect() %>%
  mutate(FULL_NAME = stringr::str_glue("{last_name}, {first_name}"))


#  close the DB connection at the end
dbDisconnect(shop_db)
