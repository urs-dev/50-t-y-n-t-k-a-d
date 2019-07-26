# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 09-06		list and JSON
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
#install.packages("jsonlite")
library(jsonlite)
#library(readr)
#library(readxl)
#library(openxlsx)
#library(DBI)
#library(RSQLite)


# load data
# ---------------------------------------------------------
### v1    import as JSON/LIST
clients_data_json = read_json("L-09/data/clients.json")

class(clients_data_json)   # list
View(clients_data_json)


### v2    import  as LIST/data.frame
clients_data_json = read_json("L-09/data/clients.json", simplifyDataFrame=TRUE)

class(clients_data_json)   # list
View(clients_data_json)

clients_data_json["data"]
clients_data_json[["data"]]
utils::View(clients_data_json)

class(clients_data_json["data"])
class(clients_data_json[["data"]][["clients"]])

#   --> tibble
tib = as_tibble(clients_data_json[["data"]][["clients"]])
tib



# save data as JSON
# ---------------------------------------------------------
write_json(clients_data_json, "L-09/data/clients_2.json")


write_json(clients_data_json, "L-09/data/clients_3.json", auto_unbox=TRUE)





# exercise 1
# ---------------------------------------------------------



# exercise 2
# ---------------------------------------------------------



# exercise 3
# ---------------------------------------------------------


