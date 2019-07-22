# ==========================================================================
#  50 Things You Should Know About Data
#
#  Unit 3-10
# ==========================================================================

library(lubridate)

# info
# ---------------------------------------------------------
d = ymd("2018-01-04")
d = mdy("120987")
typeof(d)   #   --> double

class(ymd("2018-01-04"))

parse_date_time("120987", orders="mdy")


# exercise
# ---------------------------------------------------------
dates1 <- c("1996-06-18","2008-12-21","2009-11-24","2015-01-28",
            "1978-06-04","1998-03-13","1977-11-05","1970-02-04",
            "1973-11-15","2013-02-17")

dates2 <- c("June 18 1996","December 21 2008","November 24 2009",
            "January 28 2015","June 04 1978","March 13 1998",
            "November 05 1977","February 04 1970","November 15 1973",
            "February 17 2013")

dates3 <- c("06181996","12212008","11242009","01282015",
            "06041978","03131998","11051977","02041970",
            "11151973","02172013")

dates4 <- c("1996/Jun-18","2008/Dec-21","2009/Nov-24",
            "2015/Jan-28","1978/Jun-04","1998/Mar-13",
            "1977/Nov-05","1970/Feb-04","1973/Nov-15",
            "2013/Feb-17")

### dates1
ymd(dates1)

class(ymd(dates1)[1])
class(ymd(dates1))

### dates2
parse_date_time(dates2, orders="bdy")

class( parse_date_time(dates2, orders="bdy") )

### dates3
mdy(dates3)

class(mdy(dates3))


### dates4
parse_date_time(dates4, orders="ybd")

class( parse_date_time(dates4, orders="ybd") )





# exercise
# ---------------------------------------------------------
parse_date_time("Montag 11 März 2018", orders="AdBy")
parse_date_time("Dienstag 11 März 2018", orders="Admy")
parse_date_time("Dienstag 11 März 2018", orders="dmy")



# exercise
# ---------------------------------------------------------
dates1 <- c("1996-06-18","2008-12-21","2009-11-24","2015-01-28",
            "1978-06-04","1998-03-13","1977-11-05","1970-02-04",
            "1973-11-15","2013-02-17","2013-02-18","2013-02-19","2013-02-20")

length(dates1)  #

year(dates1)

#  unique years
unique(year(dates1))

length( unique(year(dates1)) )


# exercise: add 1 day + 2 month
# ---------------------------------------------------------
dates <- c("June 18 1996","December 21 2008","November 24 2009",
           "January 28 2015","June 04 1978","March 13 1998",
           "November 05 1977","February 04 1970","November 15 1973",
           "February 17 2013")

mdy(dates) + days(1) + months(2)



# exercise: rounding date
# ---------------------------------------------------------
# July 18 2019  --> Mittwoch    soll: 2019-07-15
# July 22 2019  --> Montag            2019-07-22

dates <- c("July 18 2019","July 22 2019",
           "June 18 1996","December 21 2008","November 24 2009",
           "January 28 2015","June 04 1978","March 13 1998",
           "November 05 1977","February 04 1970","November 15 1973",
           "February 17 2013")

### get previous mondays
dates2 <- parse_date_time(dates, orders="bdy")

floor_date(dates2, unit = "weeks", week_start = 1)

ceiling_date(dates2, unit = "weeks", week_start = 1)


# exercise
# ---------------------------------------------------------




# exercise
# ---------------------------------------------------------




# exercise
# ---------------------------------------------------------
