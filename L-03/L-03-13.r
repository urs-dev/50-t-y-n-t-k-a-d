# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 3-13
# ==========================================================================

# clean up
# ---------------------------------------------------------
### clear plots: like click on the button clear all plots in the plots panel
if(!is.null(dev.list())) dev.off()

### clean workspace: remove variables ...
rm(list=ls())

### clear console
cat("\014")


# libraries
# ---------------------------------------------------------
library(tibble)



# exercise
# ---------------------------------------------------------
cosmic_table <- tribble(
  ~Planet, ~Distance,
  "Mars",      228,
  "Earth",      150,
  "Venus",      108,
  "Mercury",       58
)

cosmic_table
names(cosmic_table)
glimpse(cosmic_table)



# exercise
# ---------------------------------------------------------
# Quelle: https://opendata.swiss/de/dataset/bahnhofsliste-station-list
#         - in MS-Excel geöffnet (',' --> ';')
#         - copy
myTibble = tibble::tribble(
  ~StationID, ~Longitude, ~Latitude, ~Height,               ~Remark,
  2,  26.074412,  44.44677,       0,           "Bucuresti",
  3,   1.811446, 50.901549,       0,              "Calais",
  4,   1.075329, 51.284212,       0,          "Canterbury",
  5,  -3.543547, 50.729172,       0,              "Exeter",
  7,   9.733756, 46.922368,     744,    "Fideris; Bahnhof",
  8,   8.571251, 50.051219,       0, "Frankfurt Flughafen",
  9,  18.643803,  54.35552,       0,              "Gdansk",
  11,   7.389462, 47.191804,     467,            "Grenchen",
  13,  29.019602, 40.996348,       0,            "Istanbul",
  17,   9.873959, 48.577852,       0,  "Amstetten (WÃ¼rtt)",
  19,   4.786044, 43.921937,       0,             "Avignon",
  21,   2.140369, 41.378914,       0,           "Barcelona",
  22,   7.589551, 47.547405,     277,               "Basel",
  24,   7.395229, 46.937482,     562,       "Bern BÃ¼mpliz",
  27,   -1.89948, 52.483627,       0,          "Birmingham",
  28,   6.838953, 46.949588,     491,           "Boudry TN"
)

myTibble


# exercise
# ---------------------------------------------------------
myTibble = tibble::tribble(
  ~Name.in.English, ~Number.of.speakers, ~Degree.of.endangerment,
  "Low Saxon",             4800000,            "Vulnerable",
  "Belarusian",               4e+06,            "Vulnerable",
  "Lombard",             3500000, "Definitely endangered",
  "Romani",             3500000, "Definitely endangered"
)

myTibble
