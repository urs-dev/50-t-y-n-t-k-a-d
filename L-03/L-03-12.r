# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 3-12
# ==========================================================================

# clean up
# ---------------------------------------------------------
### clear plots: like click on the button clear all plots in the plots panel
if(!is.null(dev.list())) dev.off()

### clean workspace: remove variables ...
rm(list=ls())

### clear console
cat("\014")

### set working directory
# setwd("~/Downloads/MyScripts")
# rstudioapi::getActiveDocumentContext()$path
# getwd()


# info
# ---------------------------------------------------------
mtcars
class(mtcars)

View(mtcars)
head(mtcars , 3)
tail(mtcars , 7)

nrow(mtcars)
ncol(mtcars)

# libraries
# ---------------------------------------------------------
library(tibble)



# info
# ---------------------------------------------------------
mtcars
as_tibble(mtcars)
# mtcars: first column without header --> missing in tibble

# set column name
rownames_to_column(mtcars, "model")
as_tibble(rownames_to_column(mtcars, "model"))



# exercise
# ---------------------------------------------------------
mtib = as_tibble(rownames_to_column(mtcars, "model"))

mtib
names(mtib)
glimpse(mtib)

# exercise
# ---------------------------------------------------------
