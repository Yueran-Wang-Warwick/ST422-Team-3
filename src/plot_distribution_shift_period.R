make_figure_6 <- function(
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
    filter(!is.na(period)) %>%
    mutate(period = factor(period, levels = c("historical", "recent")))

  p <- ggplot(df, aes(x = metric, y = temp, fill = period)) +
    geom_violin(
      position = position_dodge(width = 0.75),
      alpha = 0.35,
      trim = FALSE,
      color = NA
    ) +
    geom_boxplot(
      position = position_dodge(width = 0.75),
      width = 0.20,
      outlier.alpha = 0.16,
      linewidth = 0.35
    ) +
    stat_summary(
      fun = mean,
      geom = "point",
      shape = 21,
      size = 2.1,
      stroke = 0.3,
      color = "black",
      position = position_dodge(width = 0.75)
    ) +
    facet_wrap(~season, ncol = 2, scales = "free_y") +
    scale_fill_manual(
      values = period_colors,
      labels = c(
        historical = paste0(historical_start, "-", historical_end),
        recent = paste0(recent_start, "-", recent_end)
      )
    ) +
    scale_x_discrete(labels = c(mean = "Mean", min = "Min", max = "Max")) +
    labs(
      title = "Distribution Shift Between Historical and Recent Windows",
      subtitle = paste0(
        "Historical: ", historical_start, "-", historical_end,
        " | Recent: ", recent_start, "-", recent_end
      ),
      x = "Metric",
      y = "Temperature (degC)"
    ) +
    base_theme() +
    theme(panel.grid.major.x = element_blank())

  if (save_plot) {
    save_figure(p, "eda_distribution_shift_historical_recent.jpg", width = 12, height = 8.5)
  }

  p
}
