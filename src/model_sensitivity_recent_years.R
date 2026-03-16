library(dplyr)
library(purrr)
library(tibble)

run_recent_years_sensitivity <- function() {
  
  recent_specs <- tibble::tribble(
    ~year_min, ~year_max, ~sample_label,
    1879, 2024, "Full sample",
    1879, 2023, "Exclude 2024",
    1879, 2019, "Exclude 2020-2024"
  )
  
  results <- purrr::map_dfr(seq_len(nrow(recent_specs)), function(i) {
    
    spec <- recent_specs[i, ]
    
    model_df <- prepare_model_data(
      year_min = spec$year_min,
      year_max = spec$year_max,
      historical_start = 1961,
      historical_end   = 1990,
      recent_start     = 1991,
      recent_end       = min(2020, spec$year_max)
    )
    
    model_results <- run_gls_models(model_df)
    
    trend_res <- model_results$trend %>%
      dplyr::mutate(
        sample_label = spec$sample_label,
        year_min = spec$year_min,
        year_max = spec$year_max
      )
    
    trend_res
  })
  
  results
}