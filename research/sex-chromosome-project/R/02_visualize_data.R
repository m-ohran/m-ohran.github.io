# libraries ####
library(tidyverse)

# source clean data
source("research/sex-chromosome-project/R/01_clean_data.R")

# x= GS diff by determination, y = lifespan lrr # I think this might be the winner
clean %>% 
  ggplot(aes(x = gs_diff_det_mb, y = ln_r_rlifespan, color = sex_determination)) +
  geom_point(size = 3) +
  labs(x = "Genome Size Difference (mb)", y = "Lifespan Log Response Ratio", color = "Sex Determination") +
  theme_minimal() +
  scale_color_manual(values = c("female heterogametic" = "darkmagenta",
                     "male heterogametic" = "#3EB489")) +
  theme(axis.title.x = element_text(face = "bold", size = 13),
        axis.title.y = element_text(face = "bold", size = 13),
        axis.text.x = element_text(face = "bold", size = 11),
        axis.text.y = element_text(face = "bold", size = 11),
        legend.text = element_text(face = "bold", size = 10),
        legend.title = element_text(face = "bold", size = 12))
  

ggsave("research/sex-chromosome-project/Output/Figs/GS_diff_Lifespan_lrr.png", height = 10, width = 10, dpi = 300)


# Closer Look
clean %>% 
  ggplot(aes(x = gs_diff_det_mb, y = ln_r_rlifespan, color = sex_determination)) +
  geom_point(size = 3) +
  coord_cartesian(xlim = c(-250,250)) +
  labs(x = "Genome Size Difference (mb)", y = "Lifespan Log Response Ratio", color = "Sex Determination") +
  theme_minimal() +
  scale_color_manual(values = c("female heterogametic" = "darkmagenta",
                                "male heterogametic" = "#3EB489")) +
  theme(axis.title.x = element_text(face = "bold", size = 13),
        axis.title.y = element_text(face = "bold", size = 13),
        axis.text.x = element_text(face = "bold", size = 11),
        axis.text.y = element_text(face = "bold", size = 11),
        legend.text = element_text(face = "bold", size = 10),
        legend.title = element_text(face = "bold", size = 12))

ggsave("research/sex-chromosome-project/Output/Figs/Zoomed_GS_diff_Lifespan_lrr.png", height = 10, width = 10, dpi = 300)
                  