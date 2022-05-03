library(easystats)

source("research/sex-chromosome-project/R/01_clean_data.R")


mod1 <- clean %>% 
  glm(data = ., formula = lifespan_diff ~ gs_diff_det_mb)

sink("./research/sex-chromosome-project/Output/Stats/mod1.txt")
summary(mod1)
sink(NULL)

mod2 <- clean %>% 
  glm(data = ., formula = ln_r_rlifespan ~ gs_diff_det_mb)

sink("./research/sex-chromosome-project/Output/Stats/mod2.txt")
summary(mod2)
sink(NULL)

compare_models(mod1,mod2)
compare_performance(mod1,mod2) %>% plot()
