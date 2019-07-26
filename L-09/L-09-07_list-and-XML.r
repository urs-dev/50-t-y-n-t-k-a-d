# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 09-07		list and XML
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
#library(stringr)
#library(janitor)

install.packages("xml2")
library(xml2)
install.packages("purrr")
library(purrr)
#install.packages("jsonlite")
#library(jsonlite)

#library(readr)
#library(readxl)
#library(openxlsx)
#library(DBI)
#library(RSQLite)



# load XML data     --> xml_document
# ---------------------------------------------------------
clients_xml = read_xml("L-09/data/clients.xml")

clients_xml
class(clients_xml)
View(clients_xml)


# load XML data     --> list
# ---------------------------------------------------------
clients_list = as_list(clients_xml)

clients_list
class(clients_list)
View(clients_list)


#   --> tibble
tib = as_tibble(clients_list[["data"]][["clients"]][[1]]["last_name"])
View(tib)



# exercise 1-a        PURRR:  XML list --> tibble
# ---------------------------------------------------------
clients_list[["data"]][["clients"]]

class(clients_list)
View(clients_list)

tib = clients_list %>%
  pluck("data", "clients")      # result = 1 list with 3 lists

class(tib)
class(tib[[1]])



# exercise 1-b        PURRR:  XML list --> tibble
#                             one "row"
# ---------------------------------------------------------
clients_list[["data"]][["clients"]]

class(clients_list)
View(clients_list)

tib2 = clients_list %>%
  pluck("data", "clients", 1) %>%
  flatten_df()

tib2     # result = list with several '1-element' tibbles


# exercise 1-c        PURRR:  XML list --> tibble
#                             MAP: for all "row"
# ---------------------------------------------------------
clients_list[["data"]][["clients"]]

class(clients_list)
View(clients_list)

tib2 = clients_list %>%
  pluck("data", "clients") %>%
  map(flatten_df)

tib2     # result = tibble        BUT only for one "row"


# exercise 1-c        PURRR:  XML list --> tibble
#                             MAP: for all "row"
# ---------------------------------------------------------
clients_list[["data"]][["clients"]]

class(clients_list)
View(clients_list)

tib3 = clients_list %>%
  pluck("data", "clients") %>%
  map(flatten_df) %>%
  bind_rows()

tib3     # result = tibble  with multiple "rows"




# exercise 2:   saving a XML file
# ---------------------------------------------------------
new_xml = as_xml_document(clients_xml)

new_xml

write_xml(new_xml, "L-09/data/clients-2.xml")



# exercise 3
# ---------------------------------------------------------


