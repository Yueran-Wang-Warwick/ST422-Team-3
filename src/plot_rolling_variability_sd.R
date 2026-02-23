make_figure_5 <- function(save_plot = FALSE, window = 30) {
  df <- load_hadcet_long(include_annual = FALSE, year_min = 1879, year_max = 2024) %>%
    arrange(metric, season, year) %>%
    group_by(metric, season) %>%
    mutate(roll_sd = rolling_sd(temp, window = window)) %>%
    ungroup()

  p <- ggplot(df, aes(x = year, y = roll_sd, color = metric, group = metric)) +
    geom_line(linewidth = 0.8, alpha = 0.9) +
    facet_wrap(~season, ncol = 2, scales = "free_y") +
    scale_color_manual(values = metric_colors) +
    labs(
      title = "Rolling 30-Year Variability (Standard Deviation)",
      subtitle = "Higher values indicate greater multi-year fluctuation",
      x = "Year",
      y = "Rolling SD (degC)"
    ) +
    base_theme()

  if (save_plot) {
    save_figure(p, "eda_rolling_30y_variability_sd.jpg", width = 12, height = 8)
  }

  p
}
