# ==========================================================================
#  50 Things You Should Know About Data
#
#  L-11-09   ggplot2 advanced:  highlight
#                               annotate
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


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
#     highlight
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# example 1
sales_xls %>%
  ggplot(aes(x=quantity_ordered, y=sales)) +
  geom_point(mapping=aes(color=dealsize), alpha=0.3)


# example 2
sales_xls %>%
  ggplot(aes(x=quantity_ordered, y=sales)) +
  geom_point(mapping=aes(color=dealsize), alpha=0.3) +
  geom_point(data=filter(sales_xls, territory=="APAC",
                         status=="Disputed"),
             shape=1, size=4, stroke=2, color="red")

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#
#     annotate
#
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# example 1
# ---------------------------------------------------------
avg_sales_by_dealsize <- sales_xls %>%
  group_by(dealsize) %>%
  summarise(avg_quantity_ordered = mean(quantity_ordered),
            avg_sale = mean(sales)) %>%
  ungroup()

# chart with geom_point()
avg_sales_by_dealsize %>%
  ggplot(aes(x=avg_quantity_ordered, y=avg_sale)) +
  geom_point()

# chart with geom_text()
avg_sales_by_dealsize %>%
  ggplot(aes(x=avg_quantity_ordered, y=avg_sale)) +
  geom_text(aes(label=dealsize))



# example 2
# ---------------------------------------------------------
avg_sales_by_dealsize %>%
  ggplot(aes(x=dealsize, y=avg_sale)) +
  geom_bar(stat="identity") +
  geom_text(aes(label=avg_sale))

avg_sales_by_dealsize %>%
  ggplot(aes(x=dealsize, y=avg_sale)) +
  geom_bar(stat="identity") +
  geom_text(aes(label=round(avg_sale)), nudge_y = 300)


# example 3
# ---------------------------------------------------------
avg_sales_by_dealsize %>%
  ggplot(aes(x=dealsize, y=avg_sale)) +
  geom_bar(stat="identity") +
  geom_text(
    # Order by avg_sale and keep only first and last row
    data=avg_sales_by_dealsize %>% arrange(avg_sale) %>%
      filter(row_number()==1 | row_number()==n()),
    aes(label=round(avg_sale)), nudge_y = 300)
