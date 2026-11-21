# Raw source data

The CSV in this directory is an export of the [source Google Sheet](https://docs.google.com/spreadsheets/d/1jrO-xAbp_sMstrJlWC6fsNnBINRrmrwquY-oOr8zW5o/edit?gid=44479275#gid=44479275). It is the checked-in source for package data.

Run `Rscript data-raw/extract.R` from the repository root to rebuild the three internal source-range datasets in `R/sysdata.rda`. See [data architecture](../data-architecture/README.md) for the selected ranges and planned analysis datasets.
