run_period_sensitivity <- function() {
  
  period_specs <- tibble::tribble(
    ~year_min, ~year_max, ~label,
    1879, 2024, "1879–2024",
    1900, 2024, "1900–2024",
    1950, 2024, "1950–2024"
  )
  
  results <- purrr::map_dfr(seq_len(nrow(period_specs)), function(i) {
    
    spec <- period_specs[i, ]
    
    model_df <- prepare_model_data(
      year_min = spec$year_min,
      year_max = spec$year_max,
      historical_start = 1961,
      historical_end   = 1990,
      recent_start     = 1991,
      recent_end       = 2020
    )
    
    model_results <- run_gls_models(model_df)
    
    trend_res <- model_results$trend %>%
      mutate(period_label = spec$label)
    
    trend_res
  })
  
  results
}