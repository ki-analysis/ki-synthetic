
rm(list=ls())
try(.libPaths( c( "/data/KI/R/x86_64-pc-linux-gnu-library/3.6/" , .libPaths() ) ))

source(paste0(here::here(), "/0-config.R"))
try(.libPaths( "~/rlibs" ))
library(data.table)
library(longbowtools)
library(jsonlite)
library(progress)
library(longbowRiskFactors)


# 1. enumerate analysis
setwd(here("4-longbow-tmle-analysis","run-longbow","glm"))
inputs <- "inputs_template.json"
default_params <- fromJSON(inputs)

#Set to continious
default_params$script_params$count_Y <- FALSE

#load analyses
load(here("4-longbow-tmle-analysis","analysis specification","adjusted_continuous.rdata"))

#Drop growth velocity
dim(analyses)
analyses <- analyses %>% filter(Y=="haz" | Y=="whz")
dim(analyses)

#specify analyses
enumerated_analyses <- lapply(seq_len(nrow(analyses)), specify_longbow)


writeLines(toJSON(enumerated_analyses[[17]]),"single_cont_analysis.json")
writeLines(toJSON(enumerated_analyses),"all_cont_analyses.json")


# 2. run batch
configure_cluster(here("0-project-functions","cluster_credentials.json"))

rmd_filename <- system.file("templates/longbow_RiskFactors_glm.Rmd", package="longbowRiskFactors")
inputs <- "single_cont_analysis.json"

#run test/provisioning job
run_on_longbow(rmd_filename, inputs, provision = TRUE)

# send the batch to longbow (with provisioning disabled)
batch_inputs <- "all_cont_analyses.json"
batch_id_cont <- run_on_longbow(rmd_filename, batch_inputs, provision = FALSE)
batch_id_cont

# wait for the batch to finish and track progress
wait_for_batch(batch_id_cont)

# download the longbow outputs
get_batch_results(batch_id_cont, results_folder="results_cont_glm")
length(dir("results_cont_glm"))

# load and concatenate the rdata from the jobs
results <- load_batch_results("results.rdata", results_folder = "results_cont_glm")
obs_counts <- load_batch_results("obs_counts.rdata", results_folder = "results_cont_glm")

# save concatenated results
filename1 <- paste(paste('results_cont_glm',Sys.Date( ),sep='_'),'RDS',sep='.')
filename2 <- paste(paste('results_cont_glm_obs_counts',Sys.Date( ),sep='_'),'RDS',sep='.')
saveRDS(results, file=here("results","rf results","raw longbow results",filename1))
saveRDS(obs_counts, file=here("results","rf results","raw longbow results",filename2))
