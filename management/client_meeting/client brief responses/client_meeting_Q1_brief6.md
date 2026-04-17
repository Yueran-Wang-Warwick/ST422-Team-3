# Q1: What We Can Now Say With Confidence (Brief 6)

## 1a) Early conclusions supported by current analysis

### Headline conclusion
Current evidence supports a **sustained warming shift** in Central England seasonal temperatures across **mean, minimum, and maximum** series.

### What we can state with confidence now
1. A clear recent-vs-historical shift is already visible and measurable.
   - Using the baseline comparison **1991-2020 minus 1961-1990**, all 12 season-metric combinations are positive.
   - Estimated shift range is approximately **+0.596 to +1.276 degC**.
   - The largest shifts are in **spring**, especially spring maximum.
2. Long-run warming is structurally positive rather than driven by a few isolated years.
   - Across 1879-2024, estimated warming rates are positive in all season-metric combinations.
   - Trend magnitudes are approximately **+0.069 to +0.132 degC per decade**.
   - In current trend outputs, intervals are above zero across combinations, supporting robust long-run warming.
3. The warming signal is persistent over decades.
   - Rolling 30-year anomalies are positive by the end of the series for all season-metric combinations.
   - This indicates sustained change, not only short-term fluctuation.
4. Seasonality matters for effect size.
   - **Spring** shows the strongest recent baseline jump.
   - **Autumn** and **spring** show stronger long-run trend slopes than winter minimum.
5. Variability is changing, but less uniformly than level shifts.
   - The mean/level warming conclusion is high confidence.
   - Variability patterns are season-dependent and should be presented as a secondary finding with caveats.

### Confidence statement for client
- **High confidence**: the direction of long-run and baseline change (warming) is positive and consistent across mean/min/max.
- **Medium confidence**: exact ranking of seasonal variability changes, pending final robustness checks.

## 1b) Specific figures and tables we can show now

### Core figures (already generated)
1. **Figure 3: Baseline Shift Between 30-Year Windows**
   - File: `outputs/figures/eda_baseline_shift_30y_windows.jpg`
   - Purpose: Directly answers "is there a sustained shift, and how large?"
   - Meeting message: all bars are above zero; warming shift is positive in every season and metric.
2. **Figure 2: Rolling 30-Year Mean Anomaly**
   - File: `outputs/figures/eda_rolling_30y_mean_anomaly.jpg`
   - Purpose: Shows persistence over time.
   - Meeting message: recent decades remain above early baseline across panels.
3. **Figure 4: Linear Warming Rate by Season and Metric**
   - File: `outputs/figures/eda_linear_warming_rate_by_season_metric.jpg`
   - Purpose: Quantifies long-run rate of change.
   - Meeting message: positive per-decade slopes in all combinations.
4. **Figure 6: Distribution Shift Between Historical and Recent Windows**
   - File: `outputs/figures/eda_distribution_shift_historical_recent.jpg`
   - Purpose: Shows whole-distribution movement, not only means.
   - Meeting message: recent distributions are shifted upward across seasons and metrics.

### Optional supporting figures
1. **Figure 1: Seasonal Temperature Trajectories**
   - File: `outputs/figures/eda_seasonal_temperature_trajectories.jpg`
   - Use for visual context on long-run pattern.
2. **Figure 5: Rolling 30-Year Variability (SD)**
   - File: `outputs/figures/eda_rolling_30y_variability_sd.jpg`
   - Use with caution: helpful for variability discussion, but not the primary headline for Q1.

### Optional model-based evidence (if included in meeting deck)
1. **GLS AR(1) baseline shift and trend summaries** from `reports/reports.Rmd`.
2. Model outputs are useful to reinforce that conclusions are not dependent on simple OLS assumptions.
3. **Table: Baseline Means by Season**
   - File: `outputs/tables/table_model_baseline_means_by_season.jpg`
   - Message: shows historical -> recent change by season for mean/min/max in one view.
4. **Table: GLS AR(1) Baseline Shift Summary**
   - File: `outputs/tables/table_model_gls_ar1_shift_summary.jpg`
   - Message: shows model-estimated recent-minus-historical shift with 95% intervals.
5. **Table: GLS AR(1) Long-Run Trend Summary**
   - File: `outputs/tables/table_model_gls_ar1_trend_summary.jpg`
   - Message: shows model-estimated warming rate (degC per decade) with 95% intervals.

## Suggested 60-second verbal summary for Q1

"Our current analysis already supports an early conclusion of sustained warming in Central England seasonal temperatures. The recent 30-year period is warmer than the earlier 30-year baseline across all seasons and across mean, minimum, and maximum series, with shifts around +0.6 to +1.3 degrees C. Long-run trends are also positive in all combinations, roughly +0.07 to +0.13 degrees C per decade. We can show this clearly using the baseline shift chart, rolling anomaly chart, and trend chart. Variability appears season-dependent and is being treated as a secondary finding pending final robustness checks."
