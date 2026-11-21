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

## Guides

- [Use the package in an analysis](vignettes/using-blockdata.Rmd).
- [Develop the package](vignettes/developing-blockdata.Rmd).

## Website

The [pkgdown site](https://softloud.github.io/blockdata/) presents the data overview and dataset documentation.

## Set up

Install [R 4.6.1](https://cran.r-project.org/), clone the repository, and restore its project library:

```sh
git clone https://github.com/softloud/blockdata.git
cd blockdata
Rscript -e 'renv::restore()'
```

See [Develop the package](vignettes/developing-blockdata.Rmd) for the local development workflow, data rebuild commands, and dependency updates. After pulling a lockfile change, run `renv::restore()` to sync your local library. See the [`renv` documentation](https://rstudio.github.io/renv/articles/renv.html) for details.

## License

This project is licensed under the [MIT License](LICENSE).
