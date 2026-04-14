---
output:
  pdf_document: default
  html_document: default
---
# ST422-Team-3

This repository attempts to create an analysis report based on client brief 6 for 
ST422 consultancy portfolio. The aim is to understand the long-run and seasonal 
temperature change in Central England using the Met Office HadCET seasonal mean, 
minimum and maximum temperature series (v2.1.0.0). The project starts from the 
raw HadCET seasonal totals files, rebuilds cleaned datasets, and renders the final 
technical report from a single R Markdown source.


## What this repo produces

A report that follows the required structure:

1. Cover page
2. Table of Contents
3. Contribution declaration
4. Client Report
    i. Executive Summary
    ii. Client brief and Scope
    iii. Data and Context
    iv. Findings
         a. Claim
         b. Evidence
         c. Figure/Table reference
         d. Key numbers
         e. Interpretation
         f. Implication
    v. Uncertainity and limitations
    vi. Recommendations and next steps
5. Professional Technical Report
    i. Technical abstract
    ii. Problem definition
    iii. Data provenance and structure
    iv. Pre-processing and feature construction 
    v. Exploratory analysis and descriptive checks
    vi. Primary methodology
         a. Method statement
         b. Assumptions
         c. Interpretation
    vii. Model selection and tuning
    viii. Validation and diagnostics
    ix. Robustness and sensitivity analysis
    x. Uncertainty quantification
    xi. Threats to validity and limitations
    xii. Alternative approaches considered
    xiii. Traceability to client report
6. Appendix I: Individual Reflection
7. Appendix II: Evidence of group contact and professional working
8. Appendix III: Management plan


Output policy: Outputs generated at render time and written to:
  - outputs/tables/
  - outputs/figures/
  - rendered report in reports/
  These outputs are not committed to the repository.


Meeting Minutes and Action log is present in 'management/ST422_group_contact_log.'
For more information on those please refer to the README.md present in that folder.

## Repo structure [Adjust according to your repo]


```text
ST422_Personal_Portfolio/
  |
  |-- raw/
  |   |-- data-cleansing.Rmd
  |   |-- mean/
  |   |   |-- cet_v2-1-0-0_meantemp-seasonal-totals.csv
  |   |   `-- cet_v2-1-0-0_meantemp-seasonal-ranked.csv
  |   |-- min/
  |   |   |-- cet_v2-1-0-0_mintemp-seasonal-totals.csv
  |   |   `-- cet_v2-1-0-0_mintemp-seasonal-ranked.csv
  |   `-- max/
  |       |-- cet_v2-1-0-0_maxtemp-seasonal-totals.csv
  |       `-- cet_v2-1-0-0_maxtemp-seasonal-ranked.csv
  |-- processed/
  |   |-- data_mean_cleaned.csv
  |   |-- data_min_cleaned.csv
  |   |-- data_max_cleaned.csv
  |   |-- features/
  |   |   |-- hadcet_long_with_flags.csv
  |   |   `-- hadcet_wide_with_flags.csv
  |   `-- qa/
  |       |-- quality_summary.csv
  |       |-- missingness_summary.csv
  |       |-- outlier_summary.csv
  |       `-- outlier_review.csv
  |-- src/
  |   |-- models/
  |   |   |-- model_plot_baseline_shift_gls_ar1.R
  |   |   |-- model_plot_long_run_trend_gls_ar1.R
  |   |   |-- model_plot_error_dependence_gls_ar1.R
  |   |   |-- model_plot_qq_diagnostics.R
  |   |   `-- model_plot_robustness.R
  |   |-- plots/
  |   |   |-- plot_eda_annotated_series.R
  |   |   |-- plot_eda_warming_rate_curve.R
  |   |   |-- plot_eda_distribution_checks.R
  |   |   `-- plot_eda_rolling_variability.R
  |   |-- tables/
  |   |   |-- table_model_shift_results.R
  |   |   |-- table_model_trend_results.R
  |   |   |-- table_monitoring_framework.R
  |   |   `-- table_thresholds.R
  |   `-- utils/
  |       |-- eda_utils.R
  |       `-- table_utils.R
  |-- outputs/
  |   |-- figures/
  |   `-- tables/
  |-- reports/
  |   |-- cache/
  |   |-- ST422_Professional_Technical_report.Rmd
  |   `-- ST422_Professional_Technical_report.pdf
  |-- cache/
  |-- renv/
  |   |-- activate.R
  |   |-- settings.json
  |   `-- library/
  |-- renv.lock
  |-- README.md
  |-- .gitignore
 

```

## Quick start

Run the project from the repository root.

1. Open the project in RStudio or an R session with working directory set to the repository root.
2. Install or restore the required R packages listed in the environment section below.
3. Rebuild the cleaned data by running `raw/data-cleansing.Rmd`.
- This recreates:
  - `processed/data_mean_cleaned.csv`
  - `processed/data_min_cleaned.csv`
  - `processed/data_max_cleaned.csv`
  - `processed/features/*`
  - `processed/qa/*`
4. Render the technical report from the repository root with:
  
```r
rmarkdown::render("reports/ST422_Professional_Technical_report.Rmd",
                  output_format = "pdf_document")
```

5. Confirm that the regenerated PDF appears at:
  
```text
reports/ST422_Professional_Technical_report.pdf
```

For a clean reproducibility check, delete `cache/`, `reports/cache/`, and any 
previous files under `outputs/` before rerunning steps 3 to 4.

## Dataset selection

The report uses the cleaned and processed dataset present in the 'data/processed/' 
folder. 
  - `data_mean_cleaned.csv`
  - `data_min_cleaned.csv`
  - `data_max_cleaned.csv`
  - `features/*`
  - `qa/*`

## No Randomness in Workflow

The workflow is deterministic. It does not use random sampling, simulation, 
bootstrap methods, MCMC, or random initialisation. The GLS, OLS, AR(1), AR(2), 
diagnostics, threshold tables, and all report figures are deterministic numerical or graphical outputs conditional on unchanged data, code, and package versions. No random seed is required for the main analytical pipeline.

## Included datasets

The following were copied into 'data/raw/' when this repo was generated:
- 'min/cet_v2-1-0-0_mintemp-seasonal-ranked.csv'
- 'min/cet_v2-1-0-0_mintemp-seasonal-totals.csv'
- 'mean/cet_v2-1-0-0_meantemp-seasonal-ranked.csv'
- 'mean/cet_v2-1-0-0_meantemp-seasonal-totals.csv'
- 'max/cet_v2-1-0-0_maxtemp-seasonal-ranked.csv'
- 'max/cet_v2-1-0-0_maxtemp-seasonal-totals.csv'

If any are missing, add them into `data/raw/` with the exact names above.

Data was taken from the Met Office (2025): Seasonal Mean, Minimum and Maximum 
Central England Temperature (HadCET) series v2.1.0.0. NERC EDS Centre for 
Environmental Data Analysis, 05 June 2025. doi:10.5285/ca43505702fa4eeeba4b65f1ce2c1e6a. 
<https://dx.doi.org/10.5285/ca43505702fa4eeeba4b65f1ce2c1e6a>

## Environment Management
  
  The current codebase requires R plus the following core packages.

- `dplyr`
- `ggplot2`
- `knitr`
- `nlme`
- `purrr`
- `readr`
- `rmarkdown`
- `tidyr`
- `tibble`

The project is configured at the repository root with:
  
  - `ST422_Personal_Portfolio.Rproj`
  - `.Rprofile`
  - `renv/`
  - `renv.lock`

This means the repository root is the project root for reproducibility purposes. 
The environment should be restored from the root-level `renv.lock`, not from any subdirectory.


