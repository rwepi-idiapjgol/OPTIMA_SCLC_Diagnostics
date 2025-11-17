output_folder <- here(paste0("Results_", database_name))
if (!dir.exists(output_folder)) {
  dir.create(output_folder)
}

# Logger ----
log_file <- here(output_folder, paste0("log", "_", gsub("-", "", Sys.Date()), ".txt"))
if (file.exists(log_file)) {
  unlink(log_file)
}
logger <- create.logger()
logfile(logger) <- log_file
level(logger) <- "INFO"
info(logger, "CREATE LOGGER")

#Drug codes
# List of drug ingredient concept IDs
ingredient_concept_ids <- c(
  42629079,  # atezolizumab
  1594034,   # durvalumab
  1350504,   # etoposide
  1397599,   # cisplatin
  1344905,   # carboplatin
  1518254    # dexamethasone
)


# Run diagnostics ----
info(logger, "Run drug exposure diagnostics")  
all_checks <- executeChecks(
  cdm = cdm,
  ingredients = ingredient_concept_ids,
  minCellCount = minimum_counts,
  tablePrefix = table_stem,
  checks = c(
    "missing", "exposureDuration", "type", "route", "sourceConcept", "daysSupply",
    "verbatimEndDate", "dose", "sig", "quantity", "diagnosticsSummary"
  )
)

info(logger, "Save drug exposure diagnostics results in zip")  
writeResultToDisk(all_checks, databaseId = database_name, outputFolder = output_folder)

# Disconnect ----
cdmDisconnect(cdm)