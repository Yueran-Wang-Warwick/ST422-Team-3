make_model_rho_plot <- function(rho_tbl, save_plot = FALSE) {
  p <- ggplot(rho_tbl, aes(x = season, y = rho_avg, fill = metric)) +
    geom_col(position = position_dodge(width = 0.75), width = 0.65) +
    scale_fill_manual(values = metric_colors) +
    labs(
      title = "Model Figure 3. Estimated AR(1) Dependence",
      subtitle = "Higher rho means stronger year-to-year dependence in model errors",
      x = "Season",
      y = "AR(1) rho"
    ) +
    base_theme()

  if (save_plot) {
    save_figure(p, "model_gls_ar1_error_dependence_rho_by_season_metric.jpg", width = 11, height = 6)
  }

  p
}
