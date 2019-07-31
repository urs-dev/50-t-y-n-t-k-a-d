# ==========================================================================
#  50 Things You Should Know About Data
#
#  L-10-09 scraping twitter
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
twitter_html <- xml2::read_html("https://twitter.com/hashtag/switzerland?f=users&vertical=default&lang=en")

#   1   fullnames
fullnames = twitter_html %>%
  rvest::html_nodes(css="a.fullname") %>%
  rvest::html_text(trim=TRUE)

fullnames


#   2   user names
usernames <- twitter_html %>%
  rvest::html_nodes(css=".username") %>%
  rvest::html_text(trim=TRUE)
#   --> too much results due duplicates
usernames <- twitter_html %>%
  rvest::html_nodes(css="a.ProfileCard-screennameLink > span.username") %>%
  rvest::html_text(trim=TRUE)

usernames


# tibble
dplyr::bind_cols(full_names=fullnames, user_names=usernames)


