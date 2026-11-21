# Run from the repository root with: Rscript data-raw/extract.R

# Jamie: replace this after confirming the year in the source data.
FIRST_STREAM_YEAR <- 2016L

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
a1_i189 <- sheet[2:189, 1:9, drop = FALSE]
names(a1_i189) <- unlist(sheet[1, 1:9], use.names = FALSE)

n1_q189 <- sheet[2:189, 14:17, drop = FALSE]
names(n1_q189) <- unlist(sheet[1, 14:17], use.names = FALSE)

r27_w189 <- sheet[28:189, 18:23, drop = FALSE]
names(r27_w189) <- unlist(sheet[27, 18:23], use.names = FALSE)

dir.create("R", showWarnings = FALSE)
save(a1_i189, n1_q189, r27_w189, file = file.path("R", "sysdata.rda"), version = 3)

# Convert the source month-day labels to dates. The source is in chronological
# order and crosses from December to January once.
date_parts <- strsplit(trimws(a1_i189[[1]]), "-", fixed = TRUE)
date_day <- as.integer(vapply(date_parts, `[[`, character(1), 1L))
date_month <- match(vapply(date_parts, `[[`, character(1), 2L), month.abb)
date_year <- FIRST_STREAM_YEAR + c(0L, cumsum(diff(date_month) < 0L))
stream_date <- as.Date(sprintf("%04d-%02d-%02d", date_year, date_month, date_day))

observation_source <- a1_i189
names(observation_source)[1] <- "Date Label"
observation_source <- janitor::clean_names(observation_source)
totals_source <- janitor::clean_names(n1_q189)

stream_obs <- data.frame(
  date = stream_date,
  total_minutes = as.integer(observation_source$total_minutes),
  total_blocks_mined = as.numeric(totals_source$total_blocks_mined),
  method = totals_source$method,
  pick_start = as.numeric(observation_source$pick_start),
  pick_end = as.numeric(observation_source$pick_end),
  stringsAsFactors = FALSE
)

stream_obs$hours <- stream_obs$total_minutes %/% 60L
stream_obs$minutes <- stream_obs$total_minutes %% 60L
stream_obs$cumulative_total_minutes <- cumsum(stream_obs$total_minutes)
stream_obs$cumulative_hours <- stream_obs$cumulative_total_minutes / 60
stream_obs$blocks_per_hour <- stream_obs$total_blocks_mined * 60 / stream_obs$total_minutes
stream_obs$cumulative_blocks_mined <- cumsum(stream_obs$total_blocks_mined)
stream_obs$cumulative_blocks_per_hour <- stream_obs$cumulative_blocks_mined * 60 /
  stream_obs$cumulative_total_minutes

estimate_source <- r27_w189
names(estimate_source)[3] <- "Estimated Hours at Average Rate"
estimate_source <- janitor::clean_names(estimate_source)
names(estimate_source)[2] <- "average_blocks_per_hour"

estimate_source_rows <- 28:189
estimate_dates <- stream_obs$date[estimate_source_rows - 1L]

stream_estimate <- data.frame(
  date = estimate_dates,
  estimate_just_today = as.numeric(estimate_source$estimate_just_today),
  average_blocks_per_hour = as.numeric(estimate_source$average_blocks_per_hour),
  estimated_hours_at_average_rate = as.numeric(estimate_source$estimated_hours_at_average_rate),
  streams_left = as.integer(estimate_source$streams_left),
  weeks = as.numeric(estimate_source$weeks),
  months = as.numeric(estimate_source$months),
  stringsAsFactors = FALSE
)

dir.create("data", showWarnings = FALSE)
save(stream_obs, file = file.path("data", "stream_obs.rda"), version = 3)
save(stream_estimate, file = file.path("data", "stream_estimate.rda"), version = 3)
