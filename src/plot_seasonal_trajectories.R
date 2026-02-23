make_figure_1 <- function(save_plot = FALSE) {
  df <- load_hadcet_long(include_annual = FALSE, year_min = 1879, year_max = 2024)

  p <- ggplot(df, aes(x = year, y = temp, color = metric, group = metric)) +
    geom_line(alpha = 0.30, linewidth = 0.35) +
    geom_smooth(se = FALSE, method = "loess", span = 0.20, linewidth = 0.9) +
    facet_wrap(~season, ncol = 2, scales = "free_y") +
    scale_color_manual(values = metric_colors) +
    labs(
      title = "Seasonal Temperature Trajectories (1879-2024)",
      subtitle = "Lines show annual values; smooth curves indicate long-run direction",
      x = "Year",
      y = "Temperature (degC)"
    ) +
    base_theme()

  if (save_plot) {
    save_figure(p, "eda_seasonal_temperature_trajectories.jpg", width = 12, height = 8)
  }

  p
}
