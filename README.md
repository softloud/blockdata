# blockdata

`blockdata` is a data package for analyses in `blockhole`. It contains observations from a livestream documenting a Minecraft hole dug for the perimeter of a Nether farm. The source spreadsheet is linked from [`data-raw/README.md`](data-raw/README.md); the livestream reference and fuller context still need to be documented.

## Repository layout

- `DESCRIPTION`, `NAMESPACE`, and `R/` — R package metadata and internal datasets.
- `data-raw/` — source CSV, its spreadsheet reference, and the extraction script.
- `data-raw/extract.R` — rebuilds four internal source-range extracts.
- `data-architecture/` — lineage diagram and architecture notes.
- `renv.lock` — pinned R package versions.
- `renv/` and `.Rprofile` — project-local R environment activation.
- `LICENSE` — MIT license.

## Data architecture

See [data architecture](data-architecture/README.md) for the selected source ranges and the two planned analysis datasets.

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

Use `devtools::install()` when you want to install the package into the active library. The intended analysis datasets are `stream_obs` and `stream_estimate`; they are not implemented yet. See [data architecture](data-architecture/README.md) for their planned contents.

## Rebuild current extracts

Run this from the repository root after updating the source CSV in `data-raw/`:

```sh
Rscript data-raw/extract.R
```

The script uses base R and writes the four selected source-range objects to `R/sysdata.rda`. The analysis datasets shown in the architecture diagram are a later step.

To add an R package dependency, install it into the project library and record it in `renv.lock`:

```r
renv::install("package")
renv::snapshot()
```

After pulling a lockfile change, run `renv::restore()` to sync your local library.

See the [`renv` documentation](https://rstudio.github.io/renv/articles/renv.html) for details.

After installing a development dependency such as `devtools`, run `renv::snapshot()` and commit the updated `renv.lock` so collaborators can restore it.

## License

This project is licensed under the [MIT License](LICENSE).
