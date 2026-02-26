make_table_model_shift_results <- function(
  shift_tbl,
  save_table = FALSE,
  historical_start = 1961,
  historical_end = 1990,
  recent_start = 1991,
  recent_end = 2020
) {
  tbl <- build_wide_ci_table(
    shift_tbl,
    estimate_col = "shift",
    lower_col = "lower",
    upper_col = "upper",
    digits = 3
  )

  if (save_table) {
    dims <- estimate_table_dims(tbl)
    p_tbl <- make_table_plot(
      tbl,
      title = "Table 2. GLS AR(1) Baseline Shift Summary",
      subtitle = paste0(
        "Recent minus historical window in degC: ",
        recent_start, "-", recent_end, " minus ", historical_start, "-", historical_end,
        ". Cell format: estimate [95% interval]. Asterisk means interval does not cross zero."
      )
    )
    save_table_jpg(
      p_tbl,
      filename = "table_model_gls_ar1_shift_summary.jpg",
      width = dims$width,
      height = dims$height
    )
  }

  tbl
}
