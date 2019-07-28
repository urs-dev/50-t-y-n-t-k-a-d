# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 09-11		API send request
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

library(httr)
#library(readr)
#library(readxl)
#library(openxlsx)
#library(DBI)
#library(RSQLite)


# load data from API
# ---------------------------------------------------------
geo_ip <-  httr::GET("https://ipvigilante.com/json/128.179.146.244")

geo_ip

httr::content(geo_ip, as = "text")    # --> string
httr::content(geo_ip, as = "parsed")  # --> content as LIST



# get content of API response
# ---------------------------------------------------------
geo_content <- httr::content(geo_ip, as = "parsed")
geo_content[["data"]][["city_name"]]

# Or with pluck()
library(purrr)
pluck(geo_content, "data", "city_name")

View(geo_content)

pluck(geo_content, "data", "country_name")


# exercise 1
# ---------------------------------------------------------
# Here is a vector with three IP addresses. Try to create three urls
# from this vector, call them in one go with map() from {purrr},
# convert their Response contents to list like we did for the Lausanne IP
# and extract just the country_name from each one.

ips <- c("85.159.237.59", "89.238.178.213", "185.216.34.220")
ips

get_ips = str_glue("https://ipvigilante.com/json/{ips}")

str_glue("https://ipvigilante.com/json/{ips}") %>%
  map(GET) %>%
  map(content, as="parsed") %>%
  map(pluck, "data", "country_name")




# improvement
# ---------------------------------------------------------
library(stringr)
library(httr)
library(purrr)

ips <- c("85.159.237.59", "89.238.178.213", "185.216.34.220")

get_country_by_api <- function(url) {
  GET(url) %>%
    content() %>%
    pluck("data", "country_name")
}

str_glue("https://ipvigilante.com/json/{ips}") %>%
  map(get_country_by_api) # using our custom function

