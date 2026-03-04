make_table_model_data_overview <- function(model_df, save_table = FALSE) {
  period_df <- model_df %>% filter(!is.na(period))

  means_by_season <- period_df %>%
    group_by(season, metric, period) %>%
    summarise(mean_temp = mean(temp, na.rm = TRUE), .groups = "drop") %>%
    pivot_wider(
      names_from = c(metric, period),
      values_from = mean_temp
    )

  tbl <- means_by_season %>%
    mutate(
      season = factor(as.character(season), levels = c("winter", "spring", "summer", "autumn")),
      `Mean (H->R)` = sprintf(
        "%.2f -> %.2f (%+.2f)",
        mean_historical, mean_recent, mean_recent - mean_historical
      ),
      `Min (H->R)` = sprintf(
        "%.2f -> %.2f (%+.2f)",
        min_historical, min_recent, min_recent - min_historical
      ),
      `Max (H->R)` = sprintf(
        "%.2f -> %.2f (%+.2f)",
        max_historical, max_recent, max_recent - max_historical
      )
    ) %>%
    arrange(season) %>%
    transmute(
      Season = to_title_case(as.character(season)),
      `Mean (H->R)` = `Mean (H->R)`,
      `Min (H->R)` = `Min (H->R)`,
      `Max (H->R)` = `Max (H->R)`
    )

  if (save_table) {
    dims <- estimate_table_dims(tbl)
    p_tbl <- make_table_plot(
      tbl,
      title = "Table 1. Baseline Means by Season",
      subtitle = "Cell format: historical -> recent (change). H = 1961-1990, R = 1991-2020. All cells use 30/30 years."
    )
    save_table_jpg(
      p_tbl,
      filename = "table_model_baseline_means_by_season.jpg",
      width = dims$width,
      height = dims$height
    )
  }

  tbl
}
