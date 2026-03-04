make_table_model_trend_results <- function(
  trend_tbl,
  save_table = FALSE,
  year_start = 1879,
  year_end = 2024
) {
  tbl <- build_wide_ci_table(
    trend_tbl,
    estimate_col = "trend_decade",
    lower_col = "lower",
    upper_col = "upper",
    digits = 3
  )

  if (save_table) {
    dims <- estimate_table_dims(tbl)
    p_tbl <- make_table_plot(
      tbl,
      title = "Table 3. GLS AR(1) Long-Run Trend Summary",
      subtitle = paste0(
        "Trend period: ", year_start, "-", year_end,
        ". Cell format: estimate [95% interval] in degC per decade. Asterisk means interval does not cross zero."
      )
    )
    save_table_jpg(
      p_tbl,
      filename = "table_model_gls_ar1_trend_summary.jpg",
      width = dims$width,
      height = dims$height
    )
  }

  tbl
}
