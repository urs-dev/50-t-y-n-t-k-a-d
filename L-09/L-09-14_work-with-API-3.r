# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 09-14		work with API 3
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
library(stringr)
library(httr)
library(purrr)


# TASK
# ---------------------------------------------------------
# get the CEO names for some companies using IEX api (endpoint = company)


# input
# ---------------------------------------------------------
my_sport_companies <- c(
  "nke",    # Nike
  "ua",     # Under Armour
  "colm",   # Columbia Sports Wear
  "fl"      # Foot Locker
)
my_sport_companies



# api params
# ---------------------------------------------------------
ApiBase = "cloud.iexapis.com/stable/stock"
ApiEndpoint = "company"
myAPItoken = "pk_5a7b42d686c446938397a4389e4c8589"


# build the API requests
# ---------------------------------------------------------
str_glue("https://{ApiBase}/",
         "{my_sport_companies}",
          "/{ApiEndpoint}?token={myAPItoken}" )



# call every request
# ---------------------------------------------------------
str_glue("https://{ApiBase}/",
         "{my_sport_companies}",
         "/{ApiEndpoint}?token={myAPItoken}" ) %>%
  map(GET) %>%
  map(content) %>%
  map(pluck("CEO"))

#  --> done  ;-)


# improvements / shortcuts
# ---------------------------------------------------------
library(magrittr) # Let's not forget that extract() comes from {magrittr}

str_glue("https://{ApiBase}/",
         "{my_sport_companies}",
         "/{ApiEndpoint}?token={myAPItoken}" ) %>%
  map(GET) %>%
  map(content) %>%
#  map(extract, c("companyName", "CEO"))
  map_df(extract, c("companyName", "CEO"))


