# Libraries####
library(tidyverse)
library(readxl)
library(janitor)

# read data, remove header row
dat <- read_xlsx("./research/sex-chromosome-project/Data/Raw/Sex_chromosome_genome_size_data.xlsx", range = "D2:U416")

# clean names
dat <- dat %>% clean_names()

# filter by whether or not we have gs data, and by what species have lifespan data for both sexes
 dat <- dat %>% 
  filter(gs_data_y_n == "Y", ! is.na(homogametic_lifespan), ! is.na(heterogametic_lifespan))
 
 # remove the weird cockroach?, we're not sure the GS values are correct
 # also, remove one of the melanogaster rows? combine them? remove them both?
 # what's up with the sheep (Ovis aries) GS?


 # lifespan is split by heterogametic and homogametic, GS is split male/female, should they be organized the same way for comparison?
 
 # create homo/hetero GS columns
 
 dat <- dat %>%
   mutate("gs_het_mb" = if_else(sex_determination == "female heterogametic", gs_female_mb, gs_male_mb)) %>% 
   mutate("gs_homo_mb" = if_else(sex_determination == "female heterogametic", gs_male_mb, gs_female_mb))



 # add GS diff by determination column
 
 dat <- dat %>% 
   mutate("gs_diff_det_mb" = gs_homo_mb*2 - gs_het_mb*2)
 
 # remove columns I don't care about
 clean <- dat %>% select(-c(ends_with("_pg"), ends_with("_sample_size_n"), ends_with("_sd"), gs_data_y_n,gs_female_mb, gs_male_mb, gs_diff_mb))
 
 write_csv(clean, "./research/sex-chromosome-project/Data/Clean/clean_sex_chromosome_data.csv")
 