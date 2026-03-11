make_model_shift_plot <- function(shift_tbl, save_plot = FALSE) {
  p <- ggplot(shift_tbl, aes(x = season, y = shift, color = metric)) +
    geom_hline(yintercept = 0, linewidth = 0.3, linetype = "dashed", color = "gray45") +
    geom_pointrange(
      aes(ymin = lower, ymax = upper),
      position = position_dodge(width = 0.45),
      linewidth = 0.6
    ) +
    scale_color_manual(values = metric_colors) +
    labs(
      title = "Model Figure 1. GLS AR(1) Baseline Shift",
      subtitle = "Estimated shift for 1991-2020 relative to 1961-1990 with 95% intervals",
      x = "Season",
      y = "Shift (degC)"
    ) +
    base_theme()

  if (save_plot) {
    save_figure(p, "model_gls_ar1_baseline_shift_by_season_metric.jpg", width = 11, height = 6.5)
  }

  p
}
