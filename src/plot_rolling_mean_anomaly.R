make_figure_2 <- function(save_plot = FALSE, window = 30) {
  df <- load_hadcet_long(include_annual = FALSE, year_min = 1879, year_max = 2024) %>%
    arrange(metric, season, year) %>%
    group_by(metric, season) %>%
    mutate(
      roll_mean = rolling_mean(temp, window = window),
      baseline_roll = first(roll_mean[!is.na(roll_mean)]),
      roll_anomaly = roll_mean - baseline_roll
    ) %>%
    ungroup()

  p <- ggplot(df, aes(x = year, y = roll_anomaly, color = metric, group = metric)) +
    geom_hline(yintercept = 0, linewidth = 0.3, linetype = "dashed", color = "gray45") +
    geom_line(linewidth = 0.8, alpha = 0.9) +
    facet_wrap(~season, ncol = 2) +
    scale_color_manual(values = metric_colors) +
    labs(
      title = "Rolling 30-Year Mean Anomaly",
      subtitle = "Anomaly is relative to the first available rolling-mean value in each panel",
      x = "Year",
      y = "Rolling anomaly (degC)"
    ) +
    base_theme()

  if (save_plot) {
    save_figure(p, "eda_rolling_30y_mean_anomaly.jpg", width = 12, height = 8)
  }

  p
}
