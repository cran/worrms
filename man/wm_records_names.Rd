% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wm_records_names.R
\name{wm_records_names}
\alias{wm_records_names}
\title{Get records for one or more taxonomic name(s)}
\usage{
wm_records_names(name, marine_only = TRUE, ...)
}
\arguments{
\item{name}{(character) start date. required.}

\item{marine_only}{(logical) marine only or not. default: \code{TRUE}}

\item{...}{named curl options. see \code{curl::curl_options}}
}
\value{
A list of tibble's/data.frame's, one for each of the input names
}
\description{
Get records for one or more taxonomic name(s)
}
\note{
there is no underscore method like other functions in this package
as this is the plural version for \code{\link[=wm_records_name]{wm_records_name()}}
}
\examples{
\dontrun{
wm_records_names(name = 'Leucophaeus scoresbii')
wm_records_names(name = c('Leucophaeus scoresbii', 'Coryphaena'))
}
}
