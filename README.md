# blockdata

`blockdata` is a data package for analyses in `blockhole`. It contains observations from a livestream documenting a Minecraft hole dug for the perimeter of a Nether farm. The raw spreadsheet is linked from [`raw-data/README.md`](raw-data/README.md); the livestream reference and fuller context still need to be documented.

## Repository layout

- `raw-data/` — source observations and other unprocessed data.
- `raw-data/README.md` — source spreadsheet link.
- `renv.lock` — pinned R package versions.
- `renv/` and `.Rprofile` — project-local R environment activation.
- `LICENSE` — MIT license.

## Website

> TODO: The data package is documented via `pkgdown`.

## Set up

Install [R 4.6.1](https://cran.r-project.org/) and clone this repository. From the repository root, start R; `.Rprofile` activates `renv` automatically. Restore the project library from the lockfile:

```r
renv::restore()
```

See the [`renv` documentation](https://rstudio.github.io/renv/articles/renv.html) for details.

## Managing packages

Install a dependency into the project library and record the updated environment in `renv.lock`:

```r
renv::install("package")
renv::snapshot()
```

After pulling a lockfile change, run `renv::restore()` to sync your local library.

## License

This project is licensed under the [MIT License](LICENSE).
