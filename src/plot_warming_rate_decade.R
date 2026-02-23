calc_trend <- function(data_slice) {
  fit <- stats::lm(temp ~ year, data = data_slice)
  slope_yr <- unname(stats::coef(fit)[["year"]])
  slope_decade <- slope_yr * 10
  slope_se_decade <- summary(fit)$coefficients["year", "Std. Error"] * 10

  data.frame(
    slope_decade = slope_decade,
    lower = slope_decade - 1.96 * slope_se_decade,
    upper = slope_decade + 1.96 * slope_se_decade
  )
}

make_figure_4 <- function(save_plot = FALSE, year_min = 1879, year_max = 2024) {
  df <- load_hadcet_long(include_annual = FALSE, year_min = year_min, year_max = year_max)

  trend_df <- df %>%
    group_by(metric, season) %>%
    group_modify(~calc_trend(.x)) %>%
    ungroup()

  p <- ggplot(trend_df, aes(x = season, y = slope_decade, color = metric)) +
    geom_hline(yintercept = 0, linewidth = 0.3, linetype = "dashed", color = "gray45") +
    geom_pointrange(
      aes(ymin = lower, ymax = upper),
      position = position_dodge(width = 0.45),
      linewidth = 0.6
    ) +
    scale_color_manual(values = metric_colors) +
    labs(
      title = "Linear Warming Rate by Season and Metric",
      subtitle = paste0("Slope estimated over ", year_min, "-", year_max, " (per decade)"),
      x = "Season",
      y = "Trend (degC per decade)"
    ) +
    base_theme()

  if (save_plot) {
    save_figure(p, "eda_linear_warming_rate_by_season_metric.jpg", width = 11, height = 6.5)
  }

  p
}
