# ==========================================================================
#  50 Things You Should Know About Data
#
#  L-13-05   Linear regression
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
library(dplyr)
library(readr)
library(lubridate)
library(stringr)
library(tidyr)

library(ggplot2)
library(readxl)


# ---------------------------------------------------------
#   1   test data: cars
# ---------------------------------------------------------
head(cars)


# ---------------------------------------------------------
#   2   first look at the data
# ---------------------------------------------------------
ggplot(data = cars,
       mapping = aes(x = speed, y = dist)) +
  geom_point() +
  # geom_smooth(method = "lm", se = TRUE) +
  labs(title = "The Relationship between Speed and Stopping Distance",
       x = "Speed",
       y = "Stopping Distance")



# ---------------------------------------------------------
#   3   build 'linear regression model'
#
#       LM: dist = X + Y*speed
#
#           - independent = 'speed'
#           -   dependent = 'dist'
# ---------------------------------------------------------
cars_lm <- lm(dist ~ speed, data = cars)

cars_lm

# Result
#
#   LM:  dist = -17.579  +  ( 3.932 * speed)


# ---------------------------------------------------------
#   4   visual check the values of LM
# ---------------------------------------------------------
cars$predicted <- cars_lm$fitted.values

ggplot(data = cars,
       mapping = aes(x = dist, y = predicted)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE) +
  labs(title = "Stopping Distance: Predicted and Observed Values",
       x = "Actual Stopping Distance",
       y = "Predicted Stopping Distance")

# ---------------------------------------------------------
#   5   check the values of LM    --> using 'p-values'
# ---------------------------------------------------------
summary(cars_lm)

# result
#
#   p-value = 1.49e-12
#   --> p-values is less than 0.05  --> reasonable good   --> "model is statistically significant"




# ---------------------------------------------------------
#   6   test new values
# ---------------------------------------------------------
cars_new <- tibble(speed = c(30, 42, 37, 48, 60))

predict(object = cars_lm,  newdata = cars_new)









