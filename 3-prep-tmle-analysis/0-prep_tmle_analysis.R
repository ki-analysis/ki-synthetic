
rm(list=ls())
source(paste0(here::here(), "/0-config.R"))

source(here("3-prep-tmle-analysis/02_calc_wast_rf_outcome.R"))
source(here("3-prep-tmle-analysis/03_calc_wlz-stunt_rf_outcomes.R"))
source(here("3-prep-tmle-analysis/04_calc_stunt_rf_outcomes.R"))
source(here("3-prep-tmle-analysis/05_calc_co_rf_outcomes.R"))
#source(here("3-prep-tmle-analysis/06_calc_mort_rf_outcomes.R"))
source(here("3-prep-tmle-analysis/07_merge_outcomes_and_covariates.R"))
#source(here("3-prep-tmle-analysis/08_merge_mortality_outcomes_and_covariates.R"))
source(here("3-prep-tmle-analysis/09_specify_analyses.R"))
source(here("3-prep-tmle-analysis/09_merge_seasonality_outcomes_and_covariates.R"))
# source(here("3-prep-tmle-analysis/10_specify_mortality_analyses.R"))

# source(here("3-prep-tmle-analysis/14_calc_mort_pooled_logistic_regressions.R"))
# source(here("3-prep-tmle-analysis/15_R2_estimation.R"))

#source(here("3-prep-tmle-analysis/01_risk_factor_presence.R"))
