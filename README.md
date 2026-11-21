# blockdata

`blockdata` is a data package for analyses in `blockhole`. It contains observations from a livestream documenting a Minecraft hole dug for the perimeter of a Nether farm. The source spreadsheet is linked from [`data-raw/README.md`](data-raw/README.md); the livestream reference and fuller context still need to be documented.

## Repository layout

- `DESCRIPTION`, `NAMESPACE`, and `R/` — package metadata, internal source ranges, and dataset documentation.
- `data/` — public analysis datasets, `stream_obs` and `stream_estimate`.
- `data-raw/` — source CSV, its spreadsheet reference, and the extraction script.
- `data-raw/extract.R` — rebuilds internal ranges and public analysis datasets.
- `man/` — help pages generated from dataset documentation.
- `data-architecture/` — lineage diagram and architecture notes.
- `renv.lock` — pinned R package versions.
- `renv/` and `.Rprofile` — project-local R environment activation.
- `LICENSE` — MIT license.

## Data architecture

See [data architecture](data-architecture/README.md) for the source ranges, dataset contents, and calculation notes.

## Website

> TODO: The data package is documented via `pkgdown`.

## Set up

Install [R 4.6.1](https://cran.r-project.org/) and clone this repository. From the repository root, restore the project library:

```sh
Rscript -e 'renv::restore()'
```

## Develop with devtools

Open R in the repository root. Use `load_all()` to load the working package into the current session; rerun it after code or data changes:

```r
devtools::load_all()
```

Use `devtools::install()` when you want to install the package into the active library. The public datasets are available as `blockdata::stream_obs` and `blockdata::stream_estimate`.

## Rebuild datasets and documentation

Run these from the repository root after updating the source CSV in `data-raw/` or changing the extraction code:

```sh
Rscript data-raw/extract.R
Rscript -e 'roxygen2::roxygenise()'
```

The extraction script writes three internal source-range objects to `R/sysdata.rda` and the two public datasets to `data/`. The `FIRST_STREAM_YEAR` setting near the top of the script is a provisional 2016; Jamie can update that single line when the source year is confirmed.

To add an R package dependency, install it into the project library and record it in `renv.lock`:

```r
renv::install("package")
renv::snapshot()
```

After pulling a lockfile change, run `renv::restore()` to sync your local library.

See the [`renv` documentation](https://rstudio.github.io/renv/articles/renv.html) for details.

After adding a development dependency, run `renv::snapshot()` and commit the updated `renv.lock` so collaborators can restore it.

## License

This project is licensed under the [MIT License](LICENSE).
