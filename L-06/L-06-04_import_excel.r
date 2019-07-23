# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 6-04    import MS excel
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
library(readxl)
library(openxlsx)
library(tibble)
library(dplyr)



# load data (from MS excel)
# ---------------------------------------------------------
country_code = read_excel("L-06/data/country_data.xlsx",
                           sheet = "country_code", skip = 2)

population = read_excel("L-06/data/country_data.xlsx",
                         sheet = "population", skip = 2)

country_code
population



# info
# ---------------------------------------------------------
# cars is a preinstalled dataset
glimpse(cars)

write.xlsx(x=cars, file="L-06/data/R_cars_spreadsheet.xlsx")


# exercise
# ---------------------------------------------------------



# exercise
# ---------------------------------------------------------



# exercise
# ---------------------------------------------------------



# exercise
# ---------------------------------------------------------



# exercise
# ---------------------------------------------------------



# exercise
# ---------------------------------------------------------



