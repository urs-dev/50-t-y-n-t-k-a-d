# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 09-13		work with API 2
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

library(stringr)
library(httr)
library(purrr)

# load data
# ---------------------------------------------------------


# exercise 1
# ---------------------------------------------------------
iex_info = httr::GET("https://cloud.iexapis.com/stable/stock/AAPL/price?token=pk_5a7b42d686c446938397a4389e4c8589")
iex_info = httr::GET("https://cloud.iexapis.com/stable/stock/AAPL/price-target?token=pk_5a7b42d686c446938397a4389e4c8589")

iex_info




# exercise 3
# ---------------------------------------------------------

apiResponse = httr::GET("https://cloud.iexapis.com/stable/stock/amzn/price-target?token=pk_5a7b42d686c446938397a4389e4c8589")
apiResponseCont = httr::content(apiResponse)
apiResponseCont[["symbol"]]

httr::content(
  httr::GET("https://cloud.iexapis.com/stable/stock/amzn/price-target?token=pk_5a7b42d686c446938397a4389e4c8589")
) %>%
  pluck("symbol")




#
# ---------------------------------------------------------
amzn_data_content <- httr::content(amzn_data)
amzn_data_content[["website"]]

# Or with pluck
pluck(amzn_data_content, "website")



#
# ---------------------------------------------------------

ApiBase = "cloud.iexapis.com/stable/"
myAPItoken = "pk_5a7b42d686c446938397a4389e4c8589"

ApiParameter = "AMZN"
ApiService = "price-target"

apiRequest = str_glue("https://{ApiEndpoint}/{ApiParameter}/{ApiService}?token={myAPItoken}" )
httr::GET(apiRequest)

httr::content(httr::GET(apiRequest))


apiContent = httr::content(httr::GET(apiRequest))
pluck(apiContent, "symbol")


#
# ---------------------------------------------------------
httr::GET(str_glue("https://{ApiEndpoint}/AMZN/price-target?token={myAPItoken}" ))
