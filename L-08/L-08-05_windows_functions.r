# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 08-05		windows functions
# ==========================================================================

library(tibble)
library(dplyr)

# test data
# ---------------------------------------------------------
tib = tribble(
  ~CLIENT, ~SALES,
  "Bob", 34,
  "Bob", 32,
  "Bob", 76,
  "Alice", 2,
  "Alice", 40,
  "Alice", 12
)


# ---------------------------------------------------------
# 1     FIRST
# ---------------------------------------------------------

# 1-a    first value in a group
tib %>% group_by(CLIENT) %>%
  mutate(FIRST_SALES = first(SALES))


# 1-b    percentage by first of group
tib %>% group_by(CLIENT) %>%
  mutate(VS_FIRST = SALES / first(SALES))


# ---------------------------------------------------------
# 2     LAST
# ---------------------------------------------------------

# 2-a    last value in a group
tib %>% group_by(CLIENT) %>%
  mutate(LAST_SALES = last(SALES))


# 2-b    percentage by last of group
tib %>% group_by(CLIENT) %>%
  mutate(VS_LAST = SALES / last(SALES))


# ---------------------------------------------------------
# 3     LAG   (previous in group)
# ---------------------------------------------------------

# 3-a    previous in group
tib %>% group_by(CLIENT) %>%
  mutate(PREV_SALE = lag(SALES, n=1))


# 3-b    percentage by previous in group
tib %>% group_by(CLIENT) %>%
  mutate(VS_PREV = SALES / lag(SALES, n=1))


# ---------------------------------------------------------
# 4     LEAD   (next in group)
# ---------------------------------------------------------

# 4-a    next in a group
tib %>% group_by(CLIENT) %>%
  mutate(NEXT_SALE = lead(SALES, n=1))


# 4-b    percentage by next of group
tib %>% group_by(CLIENT) %>%
  mutate(VS_NEXT = SALES / lead(SALES, n=1))

