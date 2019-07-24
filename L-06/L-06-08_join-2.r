# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 6-08    join-2
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
library(readxl)
library(openxlsx)
library(datapasta)


# load data (from MS excel)
# ---------------------------------------------------------
country_code = read_excel("L-06/data/country_data.xlsx",
                          sheet = "country_code", skip = 2)

population = read_excel("L-06/data/country_data.xlsx",
                        sheet = "population", skip = 2)

country_code %>% arrange(Id)
population   %>% arrange(Id)


# test data (tibble by hand)
# ---------------------------------------------------------
canton_surface = tribble(
  ~CANTON   , ~ZONE           ,~SURFACE,
  'Geneva'  ,	'Capital City'  ,	16,
  'Geneva'  ,	'Rest of Canton',	266,
  'Vaud'    ,	'Capital City'  ,	41,
  'Vaud'    ,	'Rest of Canton',	3171
  )
canton_surface

canton_population = tribble(
  ~CANTON   , ~ZONE           ,~POPULATION,
  'Geneva'  ,	'Capital City'  ,	200000,
  'Geneva'  ,	'Rest of Canton',	289524,
  'Vaud'    ,	'Capital City'  ,	133897,
  'Vaud'    ,	'Rest of Canton',	654822
)
canton_population



# test data (copy&paste by {datapasta})
# ---------------------------------------------------------
library(datapasta)

canton_surface = tibble::tribble(
   ~Canton,            ~Zone, ~Surface.Area,
  "Geneva",   "Capital City",            16,
  "Geneva", "Rest of Canton",           266,
    "Vaud",   "Capital City",            41,
    "Vaud", "Rest of Canton",          3171
  )
canton_surface

canton_population = tibble::tribble(
                       ~Canton,            ~Zone, ~Population,
                      "Geneva",   "Capital City",       2e+05,
                      "Geneva", "Rest of Canton",      289524,
                        "Vaud",   "Capital City",      133897,
                        "Vaud", "Rest of Canton",      654822
                      )
canton_population


# exercise
# ---------------------------------------------------------
# ... Then try to do a left_join() with multiple key columns.
# When you have a the final  tibble, create a new column with mutate called Density and
# fill it with the population divided by surface area.
# ---------------------------------------------------------
canton_surface
canton_population

canton_surface %>%
  left_join(canton_population, by=c("Canton", "Zone")) %>%
  mutate(Density = Population / Surface.Area) %>%
  arrange(Canton, Zone)



# exercise: full join
# ---------------------------------------------------------
country_code %>%
  full_join(population, by = c("Id")) %>%
  arrange(Id)


# exercise: inner join
# ---------------------------------------------------------
country_code %>%
  inner_join(population, by = c("Id")) %>%
  arrange(Id)




# exercise
# ---------------------------------------------------------



# exercise
# ---------------------------------------------------------



