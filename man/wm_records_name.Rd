% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wm_records_name.R
\name{wm_records_name}
\alias{wm_records_name}
\title{Get records by single name, optional fuzzy matching}
\usage{
wm_records_name(name, fuzzy = TRUE, marine_only = TRUE, offset = 1, ...)
}
\arguments{
\item{name}{(character) a taxonomic name, required.}

\item{fuzzy}{(logical) fuzzy search. default: \code{TRUE}}

\item{marine_only}{(logical) marine only or not. default: \code{TRUE}}

\item{offset}{(integer) record to start at. default: 1}

\item{...}{named curl options. see \code{curl::curl_options}}
}
\value{
A tibble/data.frame
}
\description{
Get records by single name, optional fuzzy matching
}
\note{
there is no underscore method like other functions in this package
as there is already a plural version: \code{\link[=wm_records_names]{wm_records_names()}}
}
\examples{
\dontrun{
wm_records_name(name = 'Leucophaeus')
wm_records_name(name = 'Leucophaeus', fuzzy = FALSE)
wm_records_name(name = 'Leucophaeus', marine_only = FALSE)
wm_records_name(name = 'Platanista', marine_only = FALSE)
wm_records_name(name = 'Platanista', marine_only = FALSE, offset = 5)
}
}
