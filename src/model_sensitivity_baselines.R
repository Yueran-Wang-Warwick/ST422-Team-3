library(dplyr)
library(purrr)
library(tibble)

run_baseline_sensitivity <- function(
    year_min = 1879,
    year_max = 2024
) {
  
  baseline_specs <- tibble::tribble(
    ~historical_start, ~historical_end, ~recent_start, ~recent_end, ~spec_label,
    1931, 1960, 1961, 1990, "1931-1960 vs 1961-1990",
    1951, 1980, 1981, 2010, "1951-1980 vs 1981-2010",
    1961, 1990, 1991, 2020, "1961-1990 vs 1991-2020"
  )
  
  results <- purrr::map_dfr(seq_len(nrow(baseline_specs)), function(i) {
    
    spec <- baseline_specs[i, ]
    
    model_df <- prepare_model_data(
      year_min = year_min,
      year_max = year_max,
      historical_start = spec$historical_start,
      historical_end   = spec$historical_end,
      recent_start     = spec$recent_start,
      recent_end       = spec$recent_end
    )
    
    model_results <- run_gls_models(model_df)
    
    shift_res <- model_results$shift %>%
      dplyr::mutate(
        spec_label = spec$spec_label,
        historical_start = spec$historical_start,
        historical_end   = spec$historical_end,
        recent_start     = spec$recent_start,
        recent_end       = spec$recent_end
      )
    
    shift_res
  })
  
  results
}