---
title: "Group Meeting Log"
subtitle: "Evidence-based record of meetings and actions"
author: ""
date: "13 February 2026"
params:
  input_csv: "../data/meeting_log.csv"
output:
  html_document:
    toc: false
    number_sections: false
    df_print: paged
    keep_md: true
  md_document:
    variant: gfm
---



## Inputs

- Input CSV: ../data/meeting_log.csv





## Meeting log (table)


|Date       |Attendees                    |Duration |Agenda                           |Actions agreed                                              |Owner for each action        |Deadline   |Status      |Evidence pointer      |
|:----------|:----------------------------|:--------|:--------------------------------|:-----------------------------------------------------------|:----------------------------|:----------|:-----------|:---------------------|
|2026-02-13 |A. Smith; B. Jones; C. Patel |45 min   |Agree scope and success criteria |Draft decision statement; Set up repo; Assign roles         |A. Smith; B. Jones; C. Patel |2026-02-14 |in progress |minutes_2026-02-13.md |
|2026-02-14 |A. Smith; B. Jones           |30 min   |Data readiness check             |Run missingness summary; Freeze data v1                     |B. Jones                     |2026-02-15 |completed   |PR#12                 |
|2026-02-15 |A. Smith; C. Patel           |25 min   |Draft exec summary skeleton      |Write 1-page exec summary headings; Create evidence anchors |C. Patel                     |2026-02-16 |blocked     |Teams message link    |

## Quick summary (optional)


|Status      | Count|
|:-----------|-----:|
|blocked     |     1|
|in progress |     1|
|completed   |     1|
