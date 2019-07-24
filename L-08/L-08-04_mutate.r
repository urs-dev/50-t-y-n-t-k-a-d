# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 08-04	mutate
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
library(readr)
#library(readxl)
#library(openxlsx)
#library(DBI)
#library(RSQLite)


# load data
# ---------------------------------------------------------
sales_xls = readxl::read_excel(
  "L-08/data/sales_data_sample.xlsx",
  sheet=2, skip=2) %>%
  janitor::clean_names()

sales_xls

stones_data = read_csv("L-08/data/rolling_stones.csv",
                       col_types = cols(release_year = col_integer())) %>%
              janitor::clean_names()
stones_data



# exercise 1
# ---------------------------------------------------------
sales_xls %>%
  mutate(MANAGER = if_else(dealsize %in% c('Small', 'Medium'),
                           true='Tim', false= 'Sonja')) %>%
  select(dealsize, MANAGER) %>%
  group_by(dealsize, MANAGER) %>%
  summarise(NOF_DEALS = n())


# exercise 2
# ---------------------------------------------------------
#   v-1
stones_data %>%
  mutate(favorite=if_else(
    condition=song_popularity > mean(song_popularity),
    true=TRUE,false=FALSE)) %>%
  select(song_name, song_popularity, favorite)

#   v-2
stones_data %>%
  mutate(avg_popularity = mean(song_popularity)) %>%
  mutate(FAVORITE = if_else(song_popularity > avg_popularity, TRUE,FALSE)) %>%
  select(song_name, song_popularity, avg_popularity)

#   v-3
stones_data %>%
  mutate(avg_popularity = mean(song_popularity),
         FAVORITE = if_else(song_popularity > avg_popularity, TRUE,FALSE)) %>%
  select(song_name, song_popularity, avg_popularity)



# exercise 3    nested if-else
# ---------------------------------------------------------
sales_xls %>%
  mutate(MANAGER = if_else(dealsize == 'Small', 'Tim', 'xxx')) %>%
  select(dealsize, MANAGER)

sales_xls %>%
  mutate(MANAGER = if_else(dealsize == 'Small', 'Tim',
                           if_else(dealsize == 'Medium', true='Olga', false='Sonja')
                           )) %>%
  select(dealsize, MANAGER) %>%
  group_by(dealsize, MANAGER) %>%
  summarise(NOF_DEALS = n())



# info    case_when
# ---------------------------------------------------------
#   v-1
sales_xls %>%
  mutate(MANAGER = case_when(
    dealsize == "Small"  ~ "Tim",
    dealsize == "Medium" ~ "Olga",
    dealsize == "Large"  ~ "Sonia")) %>%
  select(dealsize, MANAGER) %>%
  group_by(dealsize, MANAGER) %>%  summarise(NOF_DEALS = n())


#   v-2
sales_xls %>%
  mutate(MANAGER=case_when(
    dealsize == "Small"  ~ "Tim",
    dealsize == "Medium" ~ "Olga",
    dealsize == "Large"  ~ "Sonja",
    TRUE ~ "<not defined>")) %>%
  select(dealsize, MANAGER) %>%
  group_by(dealsize, MANAGER) %>%  summarise(NOF_DEALS = n())



# exercise 4    case_when
# ---------------------------------------------------------
stones_data %>%
  mutate(SONG_LENGTH = case_when(
    song_duration <= 200 ~ 'short',
    song_duration <= 300 ~ 'medium',     # no '> 200 & <= 300' since all '< 200' were already found
    TRUE ~ 'long'
  )) %>%
  select(song_name, song_duration, SONG_LENGTH) %>%
  arrange(song_duration)



