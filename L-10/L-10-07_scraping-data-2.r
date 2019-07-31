# ==========================================================================
#  50 Things You Should Know About Data
#
#  L-10-07 scraping data: part 2
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
"https://en.wikipedia.org/wiki/Cantons_of_Switzerland" %>%
  xml2::read_html() %>%
  rvest::html_table()

#   -->  error message
#          "Error: Table has inconsistent number of columns. Do you want fill = TRUE?"
#   because several tables


# analyse tables in HTML page
# ---------------------------------------------------------
"https://en.wikipedia.org/wiki/Cantons_of_Switzerland" %>%
  xml2::read_html() %>%
  rvest::html_nodes(css="table")

#  --> all tables

#
# ---------------------------------------------------------
"https://en.wikipedia.org/wiki/Cantons_of_Switzerland" %>%
  xml2::read_html() %>%
  rvest::html_nodes(css="sortable.wikitable.jquery-tablesorter")

#   --> result = "{xml_nodeset (0)}"      --> no table was found
#       why?
#
#   in the nodes we see the following lines
#     [2] <table class="sortable wikitable"><tbody>...
#     [3] <table class="wikitable sortable"><tbody>...
#
#   the third class 'jquery-tablesorter' must be added later by javascript


"https://en.wikipedia.org/wiki/Cantons_of_Switzerland" %>%
  xml2::read_html() %>%
  rvest::html_nodes(css=".sortable.wikitable")

#   --> beware: we have 2 tables here



# get content of the tables
# ---------------------------------------------------------
wiki_table = "https://en.wikipedia.org/wiki/Cantons_of_Switzerland" %>%
  xml2::read_html() %>%
  rvest::html_nodes(css=".sortable.wikitable") %>%
  rvest::html_table()

View(wiki_table[[1]])



# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#   exercise
#
#   get the Wiki data for CH cantons --> clean up           v-1
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
library(janitor)
library(dplyr)

#   1   get the data
# ---------------------------------------------------------
wiki_table = "https://en.wikipedia.org/wiki/Cantons_of_Switzerland" %>%
  xml2::read_html() %>%
  rvest::html_nodes(css=".sortable.wikitable") %>%
  rvest::html_table()

wiki_data = wiki_table[[1]]
View(wiki_data)


#   2   clean up
# ---------------------------------------------------------
# convert to tibble
data = as_tibble(wiki_data)


#   2.1   headers
data = data %>%
  janitor::clean_names() %>%
  # column header (and without arms column)
  select(CODE = code,
         CANTON = canton_of,
         CAPITAL = capital,
         SINCE = since,
         POPULATION = population_note_3,
         GDP = gdp_percapita_2014_17_in_chf,
         AREA = area_km2,
         DENSITY = density_per_km2_note_4,
         NOF_MUNIC = no_munic_2018_18,
         LANGUAGES = official_languages
         )
View(data)


#   2.2   CAPITAL
data = data %>%
  filter(CODE != "CH") %>%    # without CH
  #  select (CODE, CAPITAL) %>%
  mutate(CAPITAL = str_replace(CAPITAL, "\\[Note \\d+\\]", "")  #  remove '[12]'
  )
#    unique() #%>%    view()
View(data)


#   2.3   SINCE: cleanup --> integer
data = data %>%
    filter(CODE != "CH") %>%    # without CH
#    select (CODE, SINCE) %>%
    mutate(SINCE = str_replace(SINCE, "\\[Note \\d+\\]", ""),           # remove '[Note 5]'
           SINCE = str_replace(SINCE, "\\((\\w|\\d|\\s|/)*\\)", ""),    #        ' (as ...)'
           SINCE = str_replace(SINCE, " or \\d{4} ", ""),               #        ' or 1234'
           SINCE = str_replace(SINCE, "/{1}\\d{4}", ""),                #        '/1234 '
           SINCE = str_replace(SINCE, "\\s", ""),                       #         blank
           SINCE = strtoi(SINCE)                                        # --> integer
    )

View(data)


#   2.4   POPULATION --> integer
data = data %>%
  filter(CODE != "CH") %>%    # without CH
#  select (CODE, POPULATION) %>%
  mutate(POPULATION = str_replace(POPULATION, "\\[\\d{2}\\]", ""),  #  remove '[12]'
         POPULATION = str_replace_all(POPULATION, ",", ""),          #         ','
         POPULATION = strtoi(POPULATION)
        )
View(data)


#   2.5   GDP --> integer
data = data %>%
  filter(CODE != "CH") %>%    # without CH
  #  select (CODE, POPULATION) %>%
  mutate(GDP = str_replace_all(GDP, ",", ""),          #         ','
         GDP = strtoi(GDP)
  )
View(data)


#   2.6   AREA --> integer
data = data %>%
  filter(CODE != "CH") %>%    # without CH
  #  select (CODE, POPULATION) %>%
  mutate(AREA = str_replace_all(AREA, ",", ""),          #         ','
         AREA = strtoi(AREA)
  )
View(data)


#   2.7   DENSITY --> integer
data = data %>%
  filter(CODE != "CH") %>%    # without CH
  #  select (CODE, POPULATION) %>%
  mutate(DENSITY = str_replace_all(DENSITY, ",", ""),          #         ','
         DENSITY = strtoi(DENSITY)
  )

View(data)





# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#   exercise
#
#   get the Wiki data for CH cantons --> clean up           v-2
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
library(janitor)
library(dplyr)

#   1   get the data
# ---------------------------------------------------------
wiki_table = "https://en.wikipedia.org/wiki/Cantons_of_Switzerland" %>%
  xml2::read_html() %>%
  rvest::html_nodes(css=".sortable.wikitable") %>%
  rvest::html_table()

wiki_data = wiki_table[[1]]
View(wiki_data)


#   2   clean up
# ---------------------------------------------------------
# convert to tibble
data = as_tibble(wiki_data)


#   2.1   headers
data = data %>%
  janitor::clean_names() %>%
  # column header (and without arms column)
  select(CODE = code,
         CANTON = canton_of,
         CAPITAL = capital,
         SINCE = since,
         POPULATION = population_note_3,
         GDP = gdp_percapita_2014_17_in_chf,
         AREA = area_km2,
         DENSITY = density_per_km2_note_4,
         NOF_MUNIC = no_munic_2018_18,
         LANGUAGES = official_languages
  )
View(data)


#   2.1   remove '[...]
data %>%
  filter(CODE != "CH") %>%    # without CH
  #  select (CODE, POPULATION) %>%
  mutate_all(str_replace_all, "\\[.*?\\]", "") %>%
  mutate_all(str_replace_all, "\\(.*?\\)", "") %>%
  mutate_all(str_replace_all, ",", "") %>% View()


