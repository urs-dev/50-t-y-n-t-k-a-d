# ==========================================================================
#  50 Things You Should Know About Data
#
#  L-11-12   ggplot2 advanced:  animated
#                               interactive
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
mp <- tribble(
  ~Month,~Area,~Price,
  "2017-01", "EU",   "12",
  "2017-01", "USA",  "17",
  "2017-02", "EU",   "11",
  "2017-02", "USA",  "13",
  "2017-03", "EU",   "8",
  "2017-03", "USA",  "11",
  "2017-04", "EU",   "10",
  "2017-04", "USA",  "15"
)

#   1     static plot
# ---------------------------------------------------------
plot <- mp %>%
  mutate(Month=lubridate::parse_date_time(Month, orders="ym"),
         Price=as.numeric(Price)) %>%
  ggplot(mapping=aes(x=Month, y=Price)) +
  geom_line(mapping=aes(color=Area), size=2) +
  theme_minimal() +
  labs(title="Price per Area per Month",
       subtitle="EU prices are lower than USA ones")

plot


#   2     animated plot
#         default renderer: gifski_renderer()  --> install package gifski
# ---------------------------------------------------------
plot+
  gganimate::transition_reveal(id=Area, along=Month)

