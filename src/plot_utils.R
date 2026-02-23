suppressPackageStartupMessages({
  library(dplyr)
  library(ggplot2)
  library(readr)
  library(tidyr)
})

metric_colors <- c(
  mean = "#1f77b4",
  min = "#2ca02c",
  max = "#d62728"
)

period_colors <- c(
  historical = "#9ecae1",
  recent = "#fdae6b"
)

season_order <- c("winter", "spring", "summer", "autumn", "annual")

load_hadcet_long <- function(
  include_annual = TRUE,
  year_min = 1879,
  year_max = 2024
) {
  mean_df <- readr::read_csv(
    file.path("data", "processed", "data_mean_cleaned.csv"),
    show_col_types = FALSE
  ) %>%
    mutate(metric = "mean")

  min_df <- readr::read_csv(
    file.path("data", "processed", "data_min_cleaned.csv"),
    show_col_types = FALSE
  ) %>%
    mutate(metric = "min")

  max_df <- readr::read_csv(
    file.path("data", "processed", "data_max_cleaned.csv"),
    show_col_types = FALSE
  ) %>%
    mutate(metric = "max")

  out <- bind_rows(mean_df, min_df, max_df) %>%
    pivot_longer(
      cols = c(winter, spring, summer, autumn, annual),
      names_to = "season",
      values_to = "temp"
    ) %>%
    mutate(
      year = as.integer(year),
      temp = suppressWarnings(as.numeric(temp)),
      metric = factor(metric, levels = c("mean", "min", "max")),
      season = factor(season, levels = season_order)
    ) %>%
    filter(!is.na(year), !is.na(temp)) %>%
    filter(year >= year_min, year <= year_max)

  if (!include_annual) {
    out <- out %>% filter(season != "annual")
  }

  out
}

rolling_mean <- function(x, window = 30) {
  as.numeric(stats::filter(x, rep(1 / window, window), sides = 1))
}

rolling_sd <- function(x, window = 30) {
  n <- length(x)
  out <- rep(NA_real_, n)
  if (n < window) {
    return(out)
  }

  for (i in seq(window, n)) {
    out[i] <- stats::sd(x[(i - window + 1):i], na.rm = TRUE)
  }

  out
}

base_theme <- function() {
  theme_minimal(base_size = 12) +
    theme(
      legend.position = "bottom",
      legend.title = element_blank(),
      plot.title = element_text(face = "bold"),
      strip.text = element_text(face = "bold")
    )
}

save_figure <- function(plot_obj, filename, width = 12, height = 7, dpi = 300) {
  out_dir <- file.path("outputs", "figures")
  dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)

  out_path <- file.path(out_dir, filename)
  ext <- tolower(tools::file_ext(filename))

  if (ext %in% c("jpg", "jpeg")) {
    ggplot2::ggsave(
      filename = out_path,
      plot = plot_obj,
      width = width,
      height = height,
      dpi = dpi,
      bg = "white",
      quality = 95
    )
  } else {
    ggplot2::ggsave(
      filename = out_path,
      plot = plot_obj,
      width = width,
      height = height,
      dpi = dpi,
      bg = "white"
    )
  }
}
