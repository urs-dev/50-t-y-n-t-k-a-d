# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 08-02		1: filter
#               2: string
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
library(stringr)
library(readr)
#library(readxl)
#library(openxlsx)
#library(DBI)
#library(RSQLite)


# load data
# ---------------------------------------------------------
stones_data = read_csv("L-08/data/rolling_stones.csv",
                       col_types = cols(release_year = col_integer()))
stones_data



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
#   F I L T E R
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #


# filter: with conditions
# ---------------------------------------------------------

# filter with R (DPLYR)
stones_data %>%
  filter(song_duration <= 280, release_year == 1989)      #  AND

# Basic R syntax
stones_data %>%
  filter((song_duration <= 280) & (release_year == 1989)) #  AND

# DPLYR syntax
stones_data %>%
  filter(song_duration <= 280, release_year == 1989)      #  AND


stones_data %>%
  filter((song_duration <= 280) | (release_year == 1989)) #   OR



# filter: negation
# ---------------------------------------------------------
stones_data %>%
  filter(!(release_year == 1989))


# filter: "in"
# ---------------------------------------------------------
... %>%
  filter((bbbb == 'www') | (bbbb == 'yyy') | (bbbb == 'zzz'))

... %>%
  filter(bbbb %in% c('www', 'yyy', 'zzz'))

myValidValues = c('www', 'yyy', 'zzz')
... %>%
  filter(bbbb %in% myValidValues)


# filter: "between()"
# ---------------------------------------------------------
stones_data %>%
  filter(song_duration >= 100, song_duration <= 280)

stones_data %>%
  filter(between(song_duration, 100, 280))




# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
#   S T R I N G
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# STRING: detect
# ---------------------------------------------------------
str_detect(c("Hello", "Bonjour", "Hallo"), "llo")

str_detect(column_name, "text_to_search")


# exercise 1
# ---------------------------------------------------------
stones_data %>%
  filter(str_detect(song_name, "Love"))   # case sensitive

stones_data %>%
  filter(str_detect(song_name, regex("love", ignore_case=TRUE)))   # case insensitive



# exercise 2
# ---------------------------------------------------------



# exercise 3
# ---------------------------------------------------------



# exercise 4
# ---------------------------------------------------------



# exercise 5
# ---------------------------------------------------------




