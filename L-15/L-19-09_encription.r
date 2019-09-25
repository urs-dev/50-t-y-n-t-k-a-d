# ==========================================================================
#  50 Things You Should Know About Data
#
#  L-15-09   encription
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


# ---------------------------------------------------------
#   1   hash
# ---------------------------------------------------------
library(digest)

digest("Leo Johnson", algo="md5")     # "389b2b4a45cf50848d37765894b0ce74"

digest("Leo Johnson", algo="crc32")   # "43bdc51b"

digest("Leo Johnson", algo="sha256")  # "a3b1f53dbd62cffd274eb5359720dffc16d2592aea7bfb9f2030f55d2448dc7b"




# ---------------------------------------------------------
#   2
# ---------------------------------------------------------
sales_xls = read_excel("L-15/data/sales_data_sample.xlsx",
                       sheet = "sales_data_sample", skip = 3)
sales_xls


library(purrr)

sales_xls %>%
  select(COUNTRY) %>%
  mutate(country = map_chr(.$COUNTRY, digest, algo="sha256"))



# ---------------------------------------------------------
#   3         public/private key: password = bookhouse
# ---------------------------------------------------------
library(encryptr)


sales_xls %>%
  select(DEALSIZE)

getwd()
# -->  "D:/6_DEV/RStudio/r_workspace/50-t-y-n-t-k-a-d"
setwd("D:/6_DEV/RStudio/r_workspace/50-t-y-n-t-k-a-d/L-15")

encrypted_data = sales_xls %>%
                 select(DEALSIZE) %>%
                 encrypt(DEALSIZE, public_key_path="D:/6_DEV/RStudio/r_workspace/50-t-y-n-t-k-a-d/L-15/data/id_rsa.pub")

encrypted_data

encrypted_data %>%
  decrypt(DEALSIZE, private_key_path="D:/6_DEV/RStudio/r_workspace/50-t-y-n-t-k-a-d/L-15/data/id_rsa")

# ---------------------------------------------------------
#   4   exercises
# ---------------------------------------------------------

###   Question 1
decrypt_vec("a81e94bf2fa0a9ec6a6805ed5fe95deb0c2751d7c2722a0fbaa5223dabe6fb7a4e39df7c8299997ef5ef71720c8342773980a0a5f3e12b26352ed12f5b95e7b63b7e66deb78e803d5164db7386574d9b7e7bcb402b4964de488121d73b43affc2377ef7abd7941b4283a07aeaa84eabafa460434d8796d49d19474e9d35c53577f0c8895bcc4d9a933ca5efc57bfd30637e395e7b8dba6c563bdb666c88191011ff76e94ca363845cd374a646422db196b778ac4ce0e9d00a1262dc7ee157071323a041298d316e348544de373c7e51336401d3df6ad601e2efed69cbf913c54f00675080067caeb11018adfc949142543663d7c69f00e54272cf8201c2e627e",
        private_key_path = "D:/6_DEV/RStudio/r_workspace/50-t-y-n-t-k-a-d/L-15/data/id_rsa")


###   Question 2
decrypt_file(.path = "D:/6_DEV/RStudio/r_workspace/50-t-y-n-t-k-a-d/L-15/data/message.txt.encryptr.bin",
             private_key_path = "D:/6_DEV/RStudio/r_workspace/50-t-y-n-t-k-a-d/L-15/data/id_rsa")









