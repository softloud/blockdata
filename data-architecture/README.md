# Data architecture

The package will provide two analysis-ready datasets directly from selected ranges in the source sheet. There is no separate semantic-data stage. The diagram shows the planned flow:

![Selected spreadsheet ranges feeding the stream observations and estimates datasets](data-architecture.png)

## Selected source ranges

Source range names describe the spreadsheet cells they cover: `a1_j51` is `A1:J51`, `a52_l189` is `A52:L189`, `n1_q189` is `N1:Q189`, and `r27_w189` is `R27:W189`. These ranges capture the date-associated stream observations and estimates selected for analysis; they are not intended to reproduce every populated cell in the sheet.

The source ranges are packaged internally as character data and can be inspected during development with triple-colon access, for example `blockdata:::a1_j51`. The extraction uses row 1 for observation field names and row 27 for estimate headings, omitting those header rows from the data. `a52_l189` uses the observation field names from row 1 even though its range starts at row 52. Stream records use the date in column A; the date is not a complete calendar date because the source omits the year. Estimate values must be matched to the corresponding stream rows.

## Analysis datasets

- `stream_obs` — one row per observed stream, combining the selected observation fields from `a1_j51`, `a52_l189`, and `n1_q189`.
- `stream_estimate` — stream estimates from `r27_w189`, matched to the stream date.

These are the planned analysis datasets and public package interface. The current extraction script builds the four internal source-range objects; building these analysis datasets is a later step.

## Regenerate the diagram

The diagram source is [`data-lineage.dot`](data-lineage.dot). With [Graphviz](https://graphviz.org/download/) installed, run the converter from the repository root:

```sh
bash data-architecture/render-diagram.sh
```

This writes `data-architecture.png` beside the DOT source.
