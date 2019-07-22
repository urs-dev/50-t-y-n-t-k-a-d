# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 3-14
# ==========================================================================

# clean up
# ---------------------------------------------------------
### clear plots: like click on the button clear all plots in the plots panel
if(!is.null(dev.list())) dev.off()

### clean workspace: remove variables ...
rm(list=ls())

### clear console
cat("\014")


# libararies
# ---------------------------------------------------------
library(readr)


# info
# ---------------------------------------------------------
myCsvData = read_csv("L-03/data/rolling_stones.csv")

view(myCsvData)
glimpse(myCsvData)



# exercise
# ---------------------------------------------------------
myCsvData2 = read_csv("L-03/data/rolling_stones.csv",
                           col_types = cols(release_year = col_integer()))
glimpse(myCsvData2)


# exercise
# ---------------------------------------------------------
myTsvData <- read_delim("L-03/data/sales_data.tsv",
                        "\t", escape_double = FALSE, trim_ws = TRUE,
                        skip = 3 )

myTsvData <- read_delim("L-03/data/sales_data.tsv",
                         "\t", escape_double = FALSE, trim_ws = TRUE,
                         skip = 3,
                        col_types = cols(order_id = col_integer(),
                                         quantity = col_integer() ))

myTsvData
glimpse(myTsvData)
tail (myTsvData)



# exercise
# ---------------------------------------------------------
