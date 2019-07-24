# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 6-07    join
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

country_code %>% arrange(Id)
population   %>% arrange(Id)



# exercise 1    LEFT JOIN
# ---------------------------------------------------------
country_code %>%
  left_join(population, by = c("Id")) %>%
  arrange(Id)

left_join(country_code, population, by = c("Id"))%>%
  arrange(Id)



# exercise 2    RIGHT JOIN
# ---------------------------------------------------------
country_code %>%
  right_join(population, by = c("Id")) %>%
  arrange(Id)

right_join(country_code, population, by = c("Id"))%>%
  arrange(Id)

