# ==========================================================================
#  50 Things You Should Know About Data
#
#  L-12-05   statistics:  descriptive
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


# load data
# ---------------------------------------------------------
library(tibble)
scores <- c(7,7,1,0,10,4,6,1,1,7,3,2,1,8,0,3,10,7,1,1)
df <- tibble(x = scores)

df


#   1     visualize datat
# ---------------------------------------------------------
ggplot(data=df, aes(x)) +
  geom_histogram(binwidth = 0.5) +
  labs(x="Score", y="Count", title="Histogram of student scores")


#  helper function for 'mode'
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}



#   2     central tendency
# ---------------------------------------------------------

min(scores)     # 0

max(scores)     # 10

sum(scores)     # 80

mean(scores)    # 4       --> arithmetic mean / middle value

median(scores)  # 3       --> middle position

getmode(scores) # 1       --> mode = Most-often Occurring Data Element

var(scores)     # 11.58   --> variance=  deviations (Abweichung von Median)

sd(scores)      # 3.40    --> standard deviations (Abweichung von Median)
                #             average square deviation from the mean


# ---------------------------------------------------------
#   video example
# ---------------------------------------------------------

#
math_results = tribble(
  ~child_id, ~school, ~maths_start_year, ~maths_end_year,
  1,  "a", 14, 12,
  2,  "a", 15, 16,
  3,  "a", 13, 15,
  4,  "a", 13, 13,
  5,  "a", 12, 13,
  6,  "b", 11, 13,
  7,  "b", 16, 17,
  8,  "b", 15, 14,
  9,  "b", 15, 14,
  10, "b", 15, 16,
)

math_results

#   A
math_results %>%
  summarize(mean_end_year = mean(maths_end_year),
            median_end_year = median(maths_end_year))


#   B
math_results %>%
  group_by(school) %>%
  summarize(mean_end_year = mean(maths_end_year),
            median_end_year = median(maths_end_year))

# C
math_results_tidy = math_results %>%
  gather(key = 'time_point', value = 'scores', maths_end_year, maths_start_year)


math_results_tidy

math_results_tidy %>%
  group_by(school) %>%
  summarize(mean_result = mean(scores),
            meadian_result = median(scores))

# D
math_results_tidy %>%
  group_by(time_point) %>%
  summarize(mean_result = mean(scores),
            meadian_result = median(scores))


# Q-3     compute the difference between each data point and the mean
#         and then add up these differences
sum( c(5, 10, 15, 5, 15))   # 50
mean(c(5, 10, 15, 5, 15))   # 10
var( c(5, 10, 15, 5, 15))   # 25
sd(  c(5, 10, 15, 5, 15))   # 5

(5-10)+(10-10)+(15-10)+(5-10)+(15-10)   # --> 0
-5 + 0 + 5 + -5 + 5                     # --> 0
