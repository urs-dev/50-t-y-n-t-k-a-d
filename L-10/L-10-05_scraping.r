# ==========================================================================
#  50 Things You Should Know About Data
#
#  L-10-05_scraping
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
library(rvest)

#
# ---------------------------------------------------------
simple_request <- httr::GET("https://epfl-exts.github.io/data50-scraping/simple_page.html")

simple_request


#
# ---------------------------------------------------------
content <- httr::content(simple_request, as = "parsed")
content
