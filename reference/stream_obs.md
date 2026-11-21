# Stream observations

Date-indexed records of streams documenting excavation of a Minecraft
hole for a Nether farm. Jamie Gumbrell collected and recorded these
observations. The source records span November 2016 to August 2017 using
a provisional start year of 2016; update \`FIRST_STREAM_YEAR\` in
\`data-raw/extract.R\` when Jamie confirms the year.

## Usage

``` r
stream_obs
```

## Format

A data frame with 188 rows and 13 variables:

- date:

  Stream date, using the provisional source year.

- total_minutes:

  Recorded total duration in minutes.

- total_blocks_mined:

  Recorded total blocks mined per stream.

- method:

  Recorded digging method.

- pick_start, pick_end:

  Source counter readings; their meaning is pending confirmation from
  Jamie.

- hours, minutes:

  Duration split from \`total_minutes\`.

- cumulative_total_minutes:

  Running total of \`total_minutes\` in source order.

- cumulative_hours:

  \`cumulative_total_minutes\` divided by 60.

- blocks_per_hour:

  \`total_blocks_mined\` divided by stream hours.

- cumulative_blocks_mined:

  Running total of \`total_blocks_mined\` in source order.

- cumulative_blocks_per_hour:

  Cumulative blocks divided by cumulative hours.

Complete observation rows run from 2016-11-05 to 2017-08-10 under the
provisional year assumption. The year is unverified. Calculated fields
use full precision; round values only for display.

## Source

Doug's Nether Perimeter source spreadsheet:
<https://docs.google.com/spreadsheets/d/1jrO-xAbp_sMstrJlWC6fsNnBINRrmrwquY-oOr8zW5o/edit?gid=44479275>
