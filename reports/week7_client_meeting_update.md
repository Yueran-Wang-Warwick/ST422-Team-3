# Week 7 Client Meeting Update

Purpose:
This note summarises interim progress, current data readiness, key risk controls, and the specific decisions we need from the client before next-week delivery.

## 1. Data Ingested and Readiness

We have ingested three processed files provided by Alex:

- `data/processed/data_mean_cleaned.csv` with 366 rows, covering years 1659-2024
- `data/processed/data_min_cleaned.csv` with 147 rows, covering years 1878-2024
- `data/processed/data_max_cleaned.csv` with 147 rows, covering years 1878-2024

Key fields currently used:

- `year`
- `winter`, `spring`, `summer`, `autumn`, `annual`

Current status:

- Core exploratory analysis and visual outputs are already implemented in `reports/reports.Rmd`
- No access blocker at this stage
- We are ready to move from descriptive summary to robustness and decision framing

Questions for client:

1. Should the primary headline comparison remain 1961-1990 versus 1991-2020
2. Do you require one mandatory secondary baseline comparison in the main report

## 2. Data Health and Bias Risks

### 2a. Data health summary

| File | Year range | Rows | Missing or NA | Duplicate rows | Basic validity |
|---|---:|---:|---|---:|---|
| `data_mean_cleaned.csv` | 1659-2024 | 366 | 1 NA in `winter` at year 1659 | 0 | Numeric ranges look plausible |
| `data_min_cleaned.csv` | 1878-2024 | 147 | 1 NA in `winter` at year 1878 | 0 | Numeric ranges look plausible |
| `data_max_cleaned.csv` | 1878-2024 | 147 | 1 NA in `winter` at year 1878 | 0 | Numeric ranges look plausible |

Note:
The isolated winter NA values occur at the first available year and are likely boundary effects because winter spans Dec-Jan-Feb.

### 2b. Potential bias risks and mitigation

There are four main bias risks at this stage. The first is comparability risk because the mean series starts earlier than the min and max series, so direct cross-metric statements can be distorted if we do not align year ranges. The second is baseline sensitivity, since estimated shifts can vary depending on which 30-year windows are selected. The third is outlier influence, where a small number of extreme years could over-shape the headline effect size. The fourth is serial dependence in annual data, which can make uncertainty look too small if independence is assumed.

To mitigate these risks, we will align year ranges for cross-metric comparisons, run alternative 30-year baseline checks, include outlier sensitivity tests, and use dependence-aware modelling for uncertainty estimation.

Questions for client:

1. Is excluding boundary-year winter NA values acceptable for final estimation
2. Do you prefer complete-case reporting only, or complete-case plus sensitivity appendix
3. Is there any policy concern where min or max should be prioritised over mean in headline messaging

## 3. Next Week Plan and Team Owners

Planned deliverables:

1. Final EDA narrative and figure set in `reports/reports.Rmd`
2. Compact robustness section with alternative baseline windows and start-end sensitivity
3. Reintroduced modelling add-on with uncertainty-focused interpretation

Expected tangible outputs:

- Updated report draft with decision-ready wording
- One short robustness subsection
- One short modelling subsection with clear confidence framing

Named owners:

- Data QA and provenance: Alex
- Visualisation and report integration: Yueran
- Robustness checks: [Name]
- Modelling and interpretation: [Name]

Question for client:

1. Is this owner split and next-week scope aligned with your expectation for interim review

## 4. Any Other Business

Points for confirmation:

1. Preferred baseline windows for internal decision reporting
2. Practical threshold for defining a material change in planning

Additional questions for client sign-off:

1. Which two to three metrics should be highlighted first in the briefing
2. Should uncertainty be communicated as confidence intervals only, or with plain-language confidence statements
3. Should final recommendations emphasise means, extremes, or balanced treatment of both
