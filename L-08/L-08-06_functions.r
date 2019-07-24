# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 08-06	functions
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
#library(readxl)
#library(openxlsx)
#library(DBI)
#library(RSQLite)


# load data
# ---------------------------------------------------------



# exercise 1
# ---------------------------------------------------------
my_first_function <- function() { "hello" }

my_first_function()


# exercise 2
# ---------------------------------------------------------
now_tomorrow <- function() {
  lubridate::now() + lubridate::days(1)
}

now_tomorrow()


# exercise 3
# ---------------------------------------------------------
now_in_d_days <- function(d) {
  lubridate::now() + lubridate::days(d)
}

now_in_d_days()



# exercise 4
# ---------------------------------------------------------
now_in_future <- function(d, y) {
  lubridate::now() + lubridate::days(d) + lubridate::years(y)
}

now_in_future(3,5)

now_in_future(y=5, d=3)
now_in_future(y=3, d=5)
now_in_future(d=3, 5)
now_in_future(y=5,3)
now_in_future(3, y=5)


# exercise 5
# ---------------------------------------------------------
now_in_future_w_default <- function(d, y=10) {
  lubridate::now() + lubridate::days(d) + lubridate::years(y)
}

now_in_future_w_default(3)
now_in_future_w_default(3,5)



# exercise 6
# ---------------------------------------------------------
now_in_future_w_default_2 <- function(d=2, y=12) {
  lubridate::now() + lubridate::days(d) + lubridate::years(y)
  1   #  error in code
}

now_in_future_w_default_2()



# exercise 7
# ---------------------------------------------------------
now_in_future_w_default_3 <- function(d=2, y=12) {
  print(lubridate::now() +
          lubridate::days(d) +
          lubridate::years(y))
  1
}

d_day <- now_in_future_w_default_3()
d_day



# exercise 8
# ---------------------------------------------------------
important_date <- lubridate::ymd("2011-01-04")
important_plus_days <- function(d=2) {
  important_date + lubridate::days(d)
}
critical_date <- important_plus_days()
critical_date


# exercise 9
# ---------------------------------------------------------
important_date <- lubridate::ymd("2011-01-05")
important_plus_days <- function(d=2) {
  important_date <- lubridate::now()
}
important_plus_days() # Calling the function
important_date # Calling the variable

