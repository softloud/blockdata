# Use blockdata in an analysis

`blockdata` provides two date-indexed datasets about streams documenting
the excavation of a Minecraft hole for a Nether farm perimeter. Jamie
Gumbrell collected and recorded the stream observations. The estimates
are retained separately from the source spreadsheet.

## Install

Install the package from GitHub with `pak` (install `pak` once if
needed):

``` r

if (!requireNamespace("pak", quietly = TRUE)) {
  install.packages("pak")
}
pak::pak("softloud/blockdata")
```

If you already use `devtools`,
`devtools::install_github("softloud/blockdata")` also works. Current
devtools documentation recommends
[`pak::pak()`](https://pak.r-lib.org/reference/pak.html).

## Stream observations

`stream_obs` has one row per stream date. Its first six fields are the
recorded date, total minutes, blocks mined, method, pick start, and pick
end. The remaining fields split the duration and calculate stream-level
and cumulative rates and totals.

``` r

observations <- blockdata::stream_obs

head(observations[c(
  "date", "total_minutes", "total_blocks_mined", "method",
  "pick_start", "pick_end", "blocks_per_hour"
)])
```

    ##         date total_minutes total_blocks_mined       method pick_start pick_end
    ## 1 2016-11-05           274             144060       Mining     355943   500003
    ## 2 2016-11-07           190              95213       Mining     739818   835031
    ## 3 2016-11-08           197             105593       Mining    5783020  5888613
    ## 4 2016-11-11           201              49609 Floss Mining    5894092  5943634
    ## 5 2016-11-13           179              43196 Floss Mining    5946950  5990146
    ## 6 2016-11-18           107              19322 Floss Mining    5994307  6013629
    ##   blocks_per_hour
    ## 1        31545.99
    ## 2        30067.26
    ## 3        32160.30
    ## 4        14808.66
    ## 5        14479.11
    ## 6        10834.77

The date year is provisional: the package currently uses 2016 as the
start year. Jamie can update the `FIRST_STREAM_YEAR` line in
`data-raw/extract.R` when the year is confirmed. The meanings of the
pick-start and pick-end readings are also awaiting Jamie’s
clarification.

## Spreadsheet estimates

`stream_estimate` keeps the spreadsheet’s estimates alongside their
dates. These values are not recalculated by the package. The
average-rate fields and the interpretation of the source’s blank-header
column are documented as inferences, so they remain distinguishable from
confirmed source meanings.

``` r

estimates <- blockdata::stream_estimate

head(estimates)
```

    ##         date estimate_just_today average_blocks_per_hour
    ## 1 2017-01-03                30.5                     717
    ## 2 2017-01-04                16.9                     875
    ## 3 2017-01-05                15.4                     880
    ## 4 2017-01-06                14.7                     842
    ## 5 2017-01-07                16.8                     776
    ## 6 2017-01-10                12.6                     734
    ##   estimated_hours_at_average_rate streams_left weeks months
    ## 1                            30.5            8   1.5    0.4
    ## 2                            20.0            5   1.0    0.2
    ## 3                            15.5            4   0.8    0.2
    ## 4                            12.7            3   0.6    0.1
    ## 5                            11.1            3   0.6    0.1
    ## 6                             9.0            2   0.4    0.1

The estimates begin later than the observations, so not every
`stream_obs` date has a corresponding estimate. See the [dataset
reference for
`stream_obs`](https://softloud.github.io/blockdata/reference/stream_obs.md)
and the [dataset reference for
`stream_estimate`](https://softloud.github.io/blockdata/reference/stream_estimate.md)
for field details.
