# ==========================================================================
#  50 Things You Should Know About Data
#
#  L-10-06 scraping data
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
library(xml2)
library(rvest)


#
# ---------------------------------------------------------
simple_request <- httr::GET("https://epfl-exts.github.io/data50-scraping/simple_page.html")
simple_request


# get only the tables from the HTML page
# ---------------------------------------------------------
content <- httr::content(simple_request, as = "parsed")
content2 = rvest::html_table(content)

class(content2)
class(content2[[1]])

tib = as_tibble(content2[[1]] )
tib





# get the entire HTML content
# ---------------------------------------------------------
simple_request <- httr::GET("https://epfl-exts.github.io/data50-scraping/simple_page.html")
page_html <- httr::content(simple_request, as = "parsed")
page_html

page_html <- xml2::read_html("https://epfl-exts.github.io/data50-scraping/simple_page.html")
page_html


# imporoved
"https://epfl-exts.github.io/data50-scraping/simple_page.html" %>%
  xml2::read_html() %>%
  rvest::html_table()



