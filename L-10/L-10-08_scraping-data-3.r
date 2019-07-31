# ==========================================================================
#  50 Things You Should Know About Data
#
#  L-10-08 scraping data: part 3
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


# exercise
# ---------------------------------------------------------
sports_html <- xml2::read_html("https://sport.unil.ch/?pid=26")
sport_tbl = sports_html %>%
  rvest::html_nodes(css = ".group .items a")

# Sport: titel
sport_tbl %>% rvest::html_text()
# Sport: link
sport_tbl %>% rvest::html_attr("href")

title_list = rvest::html_text(sport_tbl)
link_list = rvest::html_attr(sport_tbl, "href")

# create a tobble
bind_cols("TITLE"= rvest::html_text(sport_tbl),
          "LINK"= str_c("https://sport.unil.ch/", rvest::html_attr(sport_tbl, "href"))
          )
