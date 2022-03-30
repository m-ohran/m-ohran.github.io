####Libraries####
library(tidyverse)
library(readxl)
library(janitor)

# read data, remove header row
dat <- read_xlsx("./Data/Raw/Sex_chromosome_genome_size_data.xlsx", )

# clean names
dat <- dat %>% clean_names()

# remove columns I don't want
dat <- dat %>% select(-c(gs_fem_pg,gs_male_pg,gs_sex_unknown_pg,gs_data_y_n,method,standard_species,std_sp_gs_pg,gs_source,source))

# write clean spreadsheet
write_