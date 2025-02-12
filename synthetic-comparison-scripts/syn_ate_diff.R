



rm(list=ls())
source(paste0(here::here(), "/0-config.R"))
source(paste0(here::here(), "/0-project-functions/0_clean_study_data_functions.R"))
library(gtable)





#Load data
ate <- readRDS(paste0(here::here(),"/results/rf results/pooled_ATE_results.rds"))
head(ate)
table(ate$syntype)



levels(ate$syntype)
df <- ate %>% group_by( intervention_variable,agecat, intervention_level, baseline_level, outcome_variable, region ) %>%
  arrange(syntype) %>%
  mutate(diff=ATE-first(ATE)) %>% filter(syntype!="Real") 
head(df)

df %>% group_by(syntype) %>%
  summarise(mean(diff))
  

medians <- df %>% group_by(syntype) %>% summarize(med=median(diff))

p <- ggplot(df, aes(x=diff, fill=syntype, group=syntype)) +
  geom_density() + facet_wrap(~syntype, ncol=1) + 
  xlab("Difference in ATE from real-data estimates") +
  geom_vline(xintercept=0) +
  geom_vline(aes(xintercept=med), data=medians, linetype="dashed") +
  #scale_fill_manual(values=cbbPalette[-1]) +
  scale_fill_manual(values=cbbPalette[-1]) +
  scale_color_manual(values=cbbPalette[-1]) +
  coord_cartesian(xlim=c(-0.5, 0.5))



saveRDS(p, file=paste0(here::here(), "/results/rf results/ate_diff_object.RDS"))




