# ==========================================================================
#  50 Things You Should Know About Data
#
#  L-12-07   statistics with R
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
  geom_histogram(binwidth = 0.5, fill=I("orange"), size=0.3) +
  scale_x_continuous(name = "Score", breaks = seq(0,10,1)) +
  scale_y_continuous(name = "Count")+
  ggtitle("Histogram of student scores")+
  theme_classic()



#   2     central tendency
# ---------------------------------------------------------
summary(scores)


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
#   mode  = 'häufigster Wert'
# ---------------------------------------------------------
# Create a table of frequencies
freq <- janitor::tabyl(scores)

# Order the tibble by column percent and extract the first
# same as tib %>% arrange(desc(percent)) %>% head(1)
freq %>% dplyr::top_n(1, percent)


# DATA SET 1
# -------------
#   mean   = 4.0
#   median = 3.0
#   modus  = 1

# ---------------------------------------------------------
#   second test data set
# ---------------------------------------------------------
scores2 <- c(2,6,7,5,5,4,3,10,9,10,6,2,9,4,6,5,8,9,8,6)

summary(scores2)

janitor::tabyl(scores2) %>% dplyr::top_n(1, percent)

# DATA SET 2
# -------------
#   mean   = 6.2
#   median = 6.0
#   modus  = 6

df2 <- tibble(x = scores2)

ggplot(data=df2, aes(x)) +
  geom_histogram(binwidth = 0.5, fill=I("orange"), size=0.3) +
  scale_x_continuous(name = "Score", breaks = seq(0,10,1)) +
  scale_y_continuous(name = "Count")+
  ggtitle("Histogram of student scores")+
  theme_classic()



# ---------------------------------------------------------
#   compare data sources
# ---------------------------------------------------------
a <- tibble(group = "Group 1", value = scores)
b <- tibble(group = "Group 2", value = scores2)
data <- bind_rows(a, b)

ggplot(data, aes(x=group, y=value, fill=group)) +
  geom_boxplot() +
  labs(title="Box plots of student scores") +
  theme_classic()



# #############################################################################
#
#   testing for 'null-hyhothesis'
#
#   null-hypothesis : "The population of homeschooled students and
#                      the population of public school students have the same
#                      average test score."
#
#   alternative     : "the two groups of students do not have the same average test score"
#                     --> 'two-sample t-test'
# #############################################################################


# ---------------------------------------------------------
#   two-sample t-test
# ---------------------------------------------------------
scores_test.test <- t.test(x = scores,
                           y = scores2,
                           alternative = "two.sided")

scores_test.test

# result
#   Welch Two Sample t-test
#
#   data:  scores and scores2
#   t = -2.3286, df = 34.917, p-value = 0.0258
#   alternative hypothesis: true difference in means is not equal to 0
#   95 percent confidence interval:
#     -4.1181933 -0.2818067
#   sample estimates:
#     mean of x mean of y
#     4.0       6.2



