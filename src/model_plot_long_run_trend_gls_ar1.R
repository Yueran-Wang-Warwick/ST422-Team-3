make_model_trend_plot <- function(trend_tbl, save_plot = FALSE) {
  p <- ggplot(trend_tbl, aes(x = season, y = trend_decade, color = metric)) +
    geom_hline(yintercept = 0, linewidth = 0.3, linetype = "dashed", color = "gray45") +
    geom_pointrange(
      aes(ymin = lower, ymax = upper),
      position = position_dodge(width = 0.45),
      linewidth = 0.6
    ) +
    scale_color_manual(values = metric_colors) +
    labs(
      title = "Model Figure 2. GLS AR(1) Long-Run Trend",
      subtitle = "Estimated linear trend over 1879-2024 with 95% intervals",
      x = "Season",
      y = "Trend (degC per decade)"
    ) +
    base_theme()

  if (save_plot) {
    save_figure(p, "model_gls_ar1_long_run_trend_by_season_metric.jpg", width = 11, height = 6.5)
  }

  p
}
