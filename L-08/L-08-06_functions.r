# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 08-06	functions
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
#library(tibble)
#library(dplyr)
#library(readxl)
#library(openxlsx)
#library(DBI)
#library(RSQLite)


# load data
# ---------------------------------------------------------



# Info 1    [[]]  get value
# ---------------------------------------------------------
id_data <- list(age=56,
                name=list(first_name="Peter",
                          last_name="Pierrehumbert"))
id_data

id_age <- id_data[["age"]]
# Now id_age contains just the value 56
id_age

id_name <- id_data[["name"]]
# Now id_name contains a list equivalent to
# list(first_name="Peter", last_name="Pierrehumbert"))
id_name


# Info 2    []  get 'key-value element' as a list
# ---------------------------------------------------------
id_data <- list(age=56,
                name=list(first_name="Peter",
                          last_name="Pierrehumbert"))


id_age <- id_data["age"]
# Now id_age contain a list equivalent to list(age=56)
class(id_age)
id_age


id_name <- id_data["name"]
# Now id_name contains a list equivalent to
# list(name=list(first_name="Peter", last_name="Pierrehumbert")))
class(id_name)
id_name



# Info 3
# ---------------------------------------------------------
a_long_list <- list(
  weather=list(temperature=list(unit="Celcius",value=14.5),
               humidity=list(unit="Percentage",value=67)),
  venue=list(address=list(street="34, bvd Harve", city="Zurich"),
             name="Convention Center"),
  speaker=list(list(first_name="Vanessa", last_name="Hornag"),
               list(first_name="Jill", last_name="Rro"),
               list(first_name="Steve", last_name="Gniw")))

View(a_long_list)










# exercise 1
# ---------------------------------------------------------




# exercise 2
# ---------------------------------------------------------




# exercise 3
# ---------------------------------------------------------




# exercise 4
# ---------------------------------------------------------




# exercise 5
# ---------------------------------------------------------





