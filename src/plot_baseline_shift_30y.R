make_figure_3 <- function(
  save_plot = FALSE,
  historical_start = 1961,
  historical_end = 1990,
  recent_start = 1991,
  recent_end = 2020
) {
  df <- load_hadcet_long(include_annual = FALSE, year_min = 1879, year_max = 2024) %>%
    mutate(
      period = dplyr::case_when(
        year >= historical_start & year <= historical_end ~ "historical",
        year >= recent_start & year <= recent_end ~ "recent",
        TRUE ~ NA_character_
      )
    ) %>%
    filter(!is.na(period))

  shift_df <- df %>%
    group_by(metric, season, period) %>%
    summarise(temp_mean = mean(temp, na.rm = TRUE), .groups = "drop") %>%
    tidyr::pivot_wider(names_from = period, values_from = temp_mean) %>%
    mutate(shift_degC = recent - historical)

  p <- ggplot(shift_df, aes(x = season, y = shift_degC, fill = metric)) +
    geom_hline(yintercept = 0, linewidth = 0.3, linetype = "dashed", color = "gray45") +
    geom_col(position = position_dodge(width = 0.75), width = 0.65) +
    scale_fill_manual(values = metric_colors) +
    labs(
      title = "Baseline Shift Between 30-Year Windows",
      subtitle = paste0(
        "Difference = ", recent_start, "-", recent_end,
        " minus ", historical_start, "-", historical_end
      ),
      x = "Season",
      y = "Shift (degC)"
    ) +
    base_theme()

  if (save_plot) {
    save_figure(p, "eda_baseline_shift_30y_windows.jpg", width = 11, height = 6.5)
  }

  p
}
