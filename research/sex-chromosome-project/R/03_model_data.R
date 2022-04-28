source("research/sex-chromosome-project/R/01_clean_data.R")

mod <- clean %>% 
  aov(data = ., formula = ln_r_rlifespan ~ gs_diff_det_mb)
summary(mod)
