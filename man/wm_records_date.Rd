% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wm_records_date.R
\name{wm_records_date}
\alias{wm_records_date}
\title{Get records by date}
\usage{
wm_records_date(
  start_date,
  end_date = NULL,
  marine_only = TRUE,
  offset = 1,
  ...
)
}
\arguments{
\item{start_date}{(character) start date. required.}

\item{end_date}{(character) end date. optional}

\item{marine_only}{(logical) marine only or not. default: \code{TRUE}}

\item{offset}{(integer) record to start at. default: 1}

\item{...}{named curl options. see \code{curl::curl_options}}
}
\value{
A tibble/data.frame
}
\description{
Get records by date
}
\examples{
\dontrun{
a_date <- format(Sys.Date() - 1, "\%Y-\%m-\%dT\%H:\%M:\%S+00:00")
wm_records_date(a_date)
}
}
