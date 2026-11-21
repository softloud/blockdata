# Run from the repository root with: Rscript data-raw/extract.R

source_file <- file.path("data-raw", "Doug's Nether Perimeter(Sheet1).csv")

sheet <- read.csv(
  source_file,
  header = FALSE,
  colClasses = "character",
  check.names = FALSE,
  fill = TRUE,
  blank.lines.skip = FALSE,
  na.strings = character(),
  fileEncoding = "UTF-8-BOM"
)

# Keep cell values as character data and retain the source cell coordinates in
# each dataset's name.
a1_j51 <- sheet[2:51, 1:10, drop = FALSE]
names(a1_j51) <- unlist(sheet[1, 1:10], use.names = FALSE)

a52_l189 <- sheet[52:189, 1:12, drop = FALSE]
names(a52_l189) <- unlist(sheet[1, 1:12], use.names = FALSE)

n1_q189 <- sheet[2:189, 14:17, drop = FALSE]
names(n1_q189) <- unlist(sheet[1, 14:17], use.names = FALSE)

r27_w189 <- sheet[28:189, 18:23, drop = FALSE]
names(r27_w189) <- unlist(sheet[27, 18:23], use.names = FALSE)

dir.create("R", showWarnings = FALSE)
save(a1_j51, a52_l189, n1_q189, r27_w189, file = file.path("R", "sysdata.rda"), version = 3)
