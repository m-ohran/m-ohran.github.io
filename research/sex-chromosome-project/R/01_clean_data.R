####Libraries####
library(tidyverse)
library(readxl)
library(janitor)

# read data, remove header row
dat <- read_xlsx("./research/sex-chromosome-project/Data/Raw/Sex_chromosome_genome_size_data.xlsx", range = "A2:X416")

# clean names
dat <- dat %>% clean_names()

# filter by whether or not we have gs data, and by what species have lifespan data for both sexes
 dat <- dat %>% 
  filter(gs_data_y_n == "Y", ! is.na(homogametic_lifespan), ! is.na(heterogametic_lifespan))
 
# eliminate columns I don't want/need?
 dat %>% select(-c(gs_sex_unknown_pg, gs_data_y_n)) %>% glimpse
 