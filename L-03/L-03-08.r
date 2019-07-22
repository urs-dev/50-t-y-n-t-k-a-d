# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 3-08
# ==========================================================================

# exercise
# ---------------------------------------------------------
my_numbers <- c(32,14,52,34,59,98,78,90)
head(my_numbers, 3)


# exercise
# ---------------------------------------------------------
my_birds <- c("swallow","parrot","owl","pigeons","goose")
tail(my_birds, 2)


# exercise
# ---------------------------------------------------------
my_animals <- c("dog", "cat", "canary", "dog")
my_animals[3]


# exercise
# ---------------------------------------------------------
my_animals <- c("dog", "cat", "canary", "dog")
my_animals[c(1,1,4,3)]


# exercise
# ---------------------------------------------------------
my_animals <- c("dog", "cat", "canary", "dog")
my_animals[-2]


# exercise: range
# ---------------------------------------------------------
# define a range: <start_number:end_number>
# example
my_range = 4:12
my_range


# exercise
# ---------------------------------------------------------
my_animals <- c("dog", "cat", "canary", "dog", "lion")
length(my_animals)

my_animals[2:4]

my_animals[c(2,3,4)]
my_animals[c(-1,-5)]



# exercise:  6th to 3rd, in reverse order
#           => 9, 98, 21, 5
# ---------------------------------------------------------
my_numbers <- c(34, 21, 5, 21, 98, 9, 0)

my_numbers[6:3]

rev(my_numbers)
rev(my_numbers)[3:6]     # invalid: index would be 2..5
rev(my_numbers)[2:5]     # also correct



# info
# ---------------------------------------------------------
c(1,2,3) > 2




# exercise
# ---------------------------------------------------------
my_vec <- c(2,4,5,34,29,1,0,8,78)
my_vec > 25

my_vec[my_vec > 25]

sum(my_vec[my_vec > 25])


# exercise
# ---------------------------------------------------------
c(1,2,3,4)[c(TRUE,FALSE,TRUE,FALSE,FALSE,TRUE,TRUE)]


# info

# c(TRUE) will silently be converted to c(TRUE,TRUE,TRUE)
c(1,2,3)[c(TRUE)]

# c(FALSE) will be silently converted to c(FALSE,FALSE,FALSE) (resulting in nothing)
c(1,2,3)[c(FALSE)]

# c(FALSE,TRUE) will be silently converted to c(FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,FALSE)
c(1,2,3,4,5,6,7)[c(FALSE,TRUE)]


# exercise
# ---------------------------------------------------------
vect <- c(3235,23,12,56,42,68,32)
vect[3:length(vect)]
vect[3:(length(vect)-1)]



