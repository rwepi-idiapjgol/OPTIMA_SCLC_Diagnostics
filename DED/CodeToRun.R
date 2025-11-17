renv::activate()
renv::restore()

library(DBI)
library(here)
library(zip)
library(dbplyr)
library(dplyr)
library(CDMConnector)
library(readr)
library(log4r)
library(SqlRender)
library(DrugExposureDiagnostics)


# Database name
database_name <- "..."


# DBI driver (change based on your dbms)
drv <- RPostgres::Postgres()

# Connection details
db <- DBI::dbConnect(
  drv, 
  "..." # add your connection details here
)

cdm_database_schema <- "..."
results_database_schema <- "..."
achilles_database_schema <- "..."

# cohort stem where cohorts will be instantiated
table_stem <- "..."

cdm <- cdmFromCon(
  con = db,
  cdmSchema = cdm_database_schema,
  writeSchema = results_database_schema,
  writePrefix = tolower(table_stem),
  achillesSchema = achilles_database_schema,
  cdmName = database_name
)

# minimum counts to report
minimum_counts <- 5

# Run diagnostics
source(here("RunDiagnostics.R"))

# Done!
print("Thanks for running the study!")
