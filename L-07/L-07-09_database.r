# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 07-09    database
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
install.packages("DBI")
install.packages("RSQLite")

library(DBI)
library(RSQLite)
library(readxl)
library(openxlsx)
library(tibble)
library(dplyr)


# load data from SQLite database
# ---------------------------------------------------------
shop_db <- dbConnect(RSQLite::SQLite(), "L-07/data/shop.db")

dbListTables(shop_db)

# Only close connection when you don't need to talk to the database anymore
# (usually toward the end of your script)
dbDisconnect(shop_db)


# test a select statement
# ---------------------------------------------------------
sales = DBI::dbGetQuery(shop_db,
                        "select date, price from sales;")
sales
class(sales)  # data.frame

customers = as_tibble(DBI::dbGetQuery(shop_db,
                                      "select * from customers;"))
customers


# exercise 1
# ---------------------------------------------------------




# exercise 2
# ---------------------------------------------------------





#  close the DB connection at the end
dbDisconnect(shop_db)
