#' Get complete AphiaRecord for an AphiaID
#'
#' @export
#' @param id (numeric/integer) an AphiaID. For `wm_record` it's
#' required and must be `length(id) == 1`, for `wm_record_` it's
#' optional and can be `length(id) >= 1`
#' @param name (character) one or more taxonomic names. optional
#' @template curl
#' @template plural
#' @return A named list. When using underscore method, each output is named
#' by the input ID, and can be separated by the list names
#' @note `wm_record_` is defunct, `wm_record` can do plural requests now
#' @examples \dontrun{
#' wm_record(id = 105706)
#' wm_record(id = c(105706, 126436))
#' wm_record_(id = c(105706, 126436))
#' }
wm_record <- function(id, ...) {
  assert(id, c("numeric", "integer"))
  args <- stats::setNames(as.list(id), rep('aphiaids[]', length(id)))
  wm_GET(file.path(wm_base(), "AphiaRecordsByAphiaIDs"),
    query = args, ...)
}

#' @export
#' @rdname wm_record
wm_record_ <- function(id = NULL, name = NULL, ...) {
  .Deprecated(msg="wm_record_ is deprecated; wm_record now does >1 id")
  id <- id_name(id, name)
  run_c(id, wm_record, on_error = warning, ...)
}
