# Stream estimates

Estimates recorded alongside the stream log, retained for later
comparison with analytical estimates. Values are taken from the source
sheet; they are not recalculated by this package.

## Usage

``` r
stream_estimate
```

## Format

A data frame with 162 rows and 7 variables:

- date:

  Stream date, matched to \`stream_obs\` using source row order.

- estimate_just_today:

  Source estimate labeled “Estimate Just Today”; its units are inferred.

- average_blocks_per_hour:

  Source values under “Estimate Average”; they appear to be a running
  average of blocks per hour. This interpretation is inferred.

- estimated_hours_at_average_rate:

  Source column T has no header. Values appear to estimate hours
  remaining using the average rate; this interpretation and unit are
  inferred pending Jamie's confirmation.

- streams_left:

  Source estimate of streams remaining.

- weeks, months:

  Source estimates of time remaining.

Estimates are available from 2017-01-03 to 2017-08-10 under the
provisional year assumption. Keep the inferred meanings of the
average-rate columns clearly distinguished from the source headings
until confirmed.

## Source

Doug's Nether Perimeter source spreadsheet:
<https://docs.google.com/spreadsheets/d/1jrO-xAbp_sMstrJlWC6fsNnBINRrmrwquY-oOr8zW5o/edit?gid=44479275>

## See also

\[stream_obs\]
