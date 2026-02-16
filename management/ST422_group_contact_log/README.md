# Meeting Log Report (RMarkdown)

This repo generates a clean **HTML** and **Markdown (.md)** report from a 
meeting-log CSV.

A group meeting template `meetings_template.md` is provided for minutes of 
team meetings.

## 1. Repo structure

- `data/`  
  - `meeting_log.csv` (your input; see required columns below)  
  - `example_meeting_log.csv` (example file)
- `report/`  
  - `meeting_log.Rmd` (the report template)
- `outputs/`  
  - rendered reports will be written here

## 2. Required CSV columns

Your CSV must contain **exactly** these column names (case-insensitive is OK;
spaces/underscores are OK):

- Date
- Attendees
- Duration
- Agenda
- Actions agreed
- Owner for each action
- Deadline
- Status
- Evidence pointer

Notes:

- `Status` should be one of: `completed`, `in progress`, `blocked` (case-insensitive).
- `Date` and `Deadline` can be in any common format (e.g., `2026-02-13`, `13/02/2026`).

## 3. Install dependencies

```r
install.packages(c("rmarkdown", "readr", "dplyr", "stringr", "lubridate", "knitr"))
```

## 4. Render the reports

From the project root:

### HTML
```r
rmarkdown::render(
  input = "report/meeting_log.Rmd",
  output_format = "html_document",
  output_file = "meeting_log.html",
  output_dir = "outputs",
  params = list(input_csv = "data/meeting_log.csv")
)
```

### Markdown (.md)
```r
rmarkdown::render(
  input = "report/meeting_log.Rmd",
  output_format = "md_document",
  output_file = "meeting_log.md",
  output_dir = "outputs",
  params = list(input_csv = "data/meeting_log.csv")
)
```

## 5. Quick start

1. Copy your CSV to `data/meeting_log.csv` (or change the `input_csv` parameter).
2. Run the render commands above.
3. Open `outputs/meeting_log.html` (or use the Markdown file in `outputs/meeting_log.md`).

## 6. Troubleshooting

- If you see a message about missing columns, check your CSV headers match the
  required names.
- If dates do not parse, keep them in ISO format (`YYYY-MM-DD`).
