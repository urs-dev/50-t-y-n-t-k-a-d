# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 09-12		work with API 1
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



# exercise 1
# ---------------------------------------------------------
library(stringr)
library(httr)
library(purrr)

epfl_geo <-  httr::GET("https://geocode.xyz/epfl+lausanne+switzerland?json=1")

epfl_geo
httr::content(epfl_geo, as = "parsed")

epfl_geo_data <- httr::content(epfl_geo)
epfl_geo_data[["longt"]]
epfl_geo_data[["latt"]]

# exercise 2
# ---------------------------------------------------------



# exercise 3
# ---------------------------------------------------------


