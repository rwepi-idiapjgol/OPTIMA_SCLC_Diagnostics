# OPTIMA_SCLC_Diagnostics
This code is designed to run CohortDiagnostics and Drug Exposure Diagnostics on the following outcome cohorts for the OPTIMA Research Question 16 on treatment patterns of SCLC:
- SCLC cancer (overall, limited, extensive and stages 1-4)
- Radiotherapy
- Stereotactic radiotherapy
- Conformal radiotherapy
- Intensity modulated radiotheraphy
- Prophylactic cranial irradiation
- Chemotherapy
- Systematic therapy
- Cisplatin
- Etoposide
- Carboplatin
- Surgery
- Lung excision
- Lobectomy
- Sleeve resection
- Durvalumab
- Atezolizumab
- Dexamethasone
  
## To Run
1) Download this entire repository. You can do this by selecting Code > Download ZIP or by using GitHub Desktop.
   
2) Open the folder "CohortDiagnostics"
    1) Open the project <i>CohortDiagnostics.Rproj</i> in RStudio. When the project is open, its name will appear in the top-right corner of your RStudio session.
    2) Install the necessary packages for the study by activating and restoring the renv. Please note that the required R version is 4.4.1.
    3) Open and work through the <i>CodeToRun.R</i>, which is the primary file you'll need. Execute the lines in the file, adding your database-specific information as instructed in the comments. To run the study, use the command <i>
    source(here("RunAnalysis.R"),echo=TRUE </i>
    4) After running the analysis, merge the results with the provided line. You will find a zip folder with results in your output folder
    5) To check your results, run the following command <i>CohortDiagnostics::launchDiagnosticsExplorer()</i>. It may prompt you to install OhdsiShinyModules, if not already installed. We advise you to skip the updates of other packages.
       
3) Open de folder "DED"
    1) Open the project <i>DrugExposureDiagnostics.Rproj</i> in RStudio. When the project is open, its name will appear in the top-right corner of your RStudio session.
    2) Install the necessary packages for the study by activating and restoring the renv. 
    3) Open and work through the <i>CodeToRun.R</i>, which is the primary file you'll need. Execute the lines in the file, adding your database-specific information as instructed in the comments. To run the study, use the command <i>
    source(here("RunAnalysis.R")</i>
    4) After running the analysis, merge the results with the provided line. You will find a zip folder with results in your output folder
   5) To check your results, you can move the resultant zip folder to the "DrugExposureDiagnosticsShiny" inside the "data" folder, open the project, run renv::activate and run::restore, and then shiny::runApp()
