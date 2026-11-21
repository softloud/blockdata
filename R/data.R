#' Stream observations
#'
#' Date-indexed records of streams documenting excavation of a Minecraft hole
#' for a Nether farm. Jamie Gumbrell collected and recorded these observations.
#' The source records span November 2016 to August 2017 using a provisional
#' start year of 2016; update `FIRST_STREAM_YEAR` in `data-raw/extract.R` when
#' Jamie confirms the year.
#'
#' @format A data frame with 188 rows and 13 variables:
#' \describe{
#'   \item{date}{Stream date, using the provisional source year.}
#'   \item{total_minutes}{Recorded total duration in minutes.}
#'   \item{total_blocks_mined}{Recorded total blocks mined per stream.}
#'   \item{method}{Recorded digging method.}
#'   \item{pick_start, pick_end}{Source counter readings; their meaning is pending confirmation from Jamie.}
#'   \item{hours, minutes}{Duration split from `total_minutes`.}
#'   \item{cumulative_total_minutes}{Running total of `total_minutes` in source order.}
#'   \item{cumulative_hours}{`cumulative_total_minutes` divided by 60.}
#'   \item{blocks_per_hour}{`total_blocks_mined` divided by stream hours.}
#'   \item{cumulative_blocks_mined}{Running total of `total_blocks_mined` in source order.}
#'   \item{cumulative_blocks_per_hour}{Cumulative blocks divided by cumulative hours.}
#' }
#'
#' Complete observation rows run from 2016-11-05 to 2017-08-10 under the
#' provisional year assumption. The year is unverified. Calculated fields use
#' full precision; round values only for display.
#'
#' @source Doug's Nether Perimeter source spreadsheet:
#' \url{https://docs.google.com/spreadsheets/d/1jrO-xAbp_sMstrJlWC6fsNnBINRrmrwquY-oOr8zW5o/edit?gid=44479275}
"stream_obs"

#' Stream estimates
#'
#' Estimates recorded alongside the stream log, retained for later comparison
#' with analytical estimates. Values are taken from the source sheet; they are
#' not recalculated by this package.
#'
#' @format A data frame with 162 rows and 7 variables:
#' \describe{
#'   \item{date}{Stream date, matched to `stream_obs` using source row order.}
#'   \item{estimate_just_today}{Source estimate labeled “Estimate Just Today”; its units are inferred.}
#'   \item{average_blocks_per_hour}{Source values under “Estimate Average”; they appear to be a running average of blocks per hour. This interpretation is inferred.}
#'   \item{estimated_hours_at_average_rate}{Source column T has no header. Values appear to estimate hours remaining using the average rate; this interpretation and unit are inferred pending Jamie's confirmation.}
#'   \item{streams_left}{Source estimate of streams remaining.}
#'   \item{weeks, months}{Source estimates of time remaining.}
#' }
#'
#' Estimates are available from 2017-01-03 to 2017-08-10 under the provisional
#' year assumption. Keep the inferred meanings of the average-rate columns
#' clearly distinguished from the source headings until confirmed.
#'
#' @source Doug's Nether Perimeter source spreadsheet:
#' \url{https://docs.google.com/spreadsheets/d/1jrO-xAbp_sMstrJlWC6fsNnBINRrmrwquY-oOr8zW5o/edit?gid=44479275}
#' @seealso [stream_obs]
"stream_estimate"
