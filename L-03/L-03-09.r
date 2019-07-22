# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 3-09
# ==========================================================================

library(stringr)


# exercise
# ---------------------------------------------------------
fst_names <- c("Harry", "Hermione", "Ronald", "Sirius")
mid_names <- c("James", "Jean", "Bilius", "Orion")
lst_names <- c("Potter", "Granger", "Weasley", "Black")

str_glue("{fst_names} {mid_names} {lst_names}")


# exercise
# ---------------------------------------------------------
# v1
str_glue("{fst_names} {str_sub(mid_names, 1, 2)}. {lst_names}")
# v2
str_glue("{fst_names} {str_sub(mid_names, end=2)}. {lst_names}")


# result
#   Harry Ja. Potter
#   Hermione Je. Granger
#   Ronald Bi. Weasley
#   Sirius Or. Black


# exercise
# ---------------------------------------------------------



# exercise
# ---------------------------------------------------------



# exercise
# ---------------------------------------------------------



# exercise
# ---------------------------------------------------------
