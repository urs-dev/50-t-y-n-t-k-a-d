# ==========================================================================
#  50 Things You Should Know About Data
#
#  L-11-11   ggplot2 advanced:  best practices
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

library(ggplot2)
library(readxl)


# load data
# ---------------------------------------------------------
sales_xls = read_excel("L-11/data/sales_data_sample.xlsx",
                       sheet = "sales_data_sample", skip = 3) %>%
  janitor::clean_names()  # clean up column names
sales_xls

# example 1
# ---------------------------------------------------------
#   default theme  = theme_gray
sales_xls %>%
  ggplot(aes(x=quantity_ordered, y=sales)) +
  geom_point(mapping=aes(color=dealsize), alpha=0.3)

#   theme_minimal
sales_xls %>%
  ggplot(aes(x=quantity_ordered, y=sales)) +
  geom_point(mapping=aes(color=dealsize), alpha=0.3) +
  theme_minimal()

#   theme_bw
sales_xls %>%
  ggplot(aes(x=quantity_ordered, y=sales)) +
  geom_point(mapping=aes(color=dealsize), alpha=0.3) +
  theme_bw()

#   theme_linedraw
sales_xls %>%
  ggplot(aes(x=quantity_ordered, y=sales)) +
  geom_point(mapping=aes(color=dealsize), alpha=0.3) +
  theme_linedraw()

#   theme_light
sales_xls %>%
  ggplot(aes(x=quantity_ordered, y=sales)) +
  geom_point(mapping=aes(color=dealsize), alpha=0.3) +
  theme_light()

#   theme_minimal
sales_xls %>%
  ggplot(aes(x=quantity_ordered, y=sales)) +
  geom_point(mapping=aes(color=dealsize), alpha=0.3) +
  theme_minimal()

#   theme_dark
sales_xls %>%
  ggplot(aes(x=quantity_ordered, y=sales)) +
  geom_point(mapping=aes(color=dealsize), alpha=0.3) +
  theme_dark()

#   theme_classic
sales_xls %>%
  ggplot(aes(x=quantity_ordered, y=sales)) +
  geom_point(mapping=aes(color=dealsize), alpha=0.3) +
  theme_classic()





sales_xls %>%
  ggplot(aes(x=quantity_ordered, y=sales)) +
  geom_point(mapping=aes(color=dealsize), alpha=0.3) +
  theme_minimal() +
  theme(axis.line = element_line(colour = "black", size= 4),
        axis.ticks = element_line(size = 4, color = "red"),
        plot.background = element_rect(fill="yellow"))
