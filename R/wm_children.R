#' Get children for an AphiaID
#'
#' @export
#' @param id (numeric/integer) an AphiaID. For `wm_children` it's
#' required and must be `length(id) == 1`, for `wm_children_` it's
#' optional and can be `length(id) >= 1`
#' @param marine_only (logical) marine only or not. default: `TRUE`
#' @param offset (integer) record to start at. default: 1
#' @param name (character) one or more taxonomic names. optional
#' @template curl
#' @template plural
#' @return A tibble/data.frame. when using underscore method, outputs from
#' each input are binded together, but can be split by `id` column
#' @examples \dontrun{
#' wm_children(343613)
#' wm_children(id = 105706)
#' wm_children(id = 105706, FALSE)
#' wm_children(id = 105706, offset = 5)
#'
#' # plural version, via id or name
#' wm_children_(id = c(105706, 343613))
#' wm_children_(name = c('Mesodesma', 'Leucophaeus'))
#' }
wm_children <- function(id, marine_only = TRUE, offset = 1, ...) {
  assert(id, c("numeric", "integer"))
  assert(marine_only, "logical")
  assert(offset, c("numeric", "integer"))
  assert_len(id, 1)
  wm_GET(file.path(wm_base(), "AphiaChildrenByAphiaID", id),
         query = cc(list(marine_only = as_log(marine_only),
                         offset = offset)), ...)
}

#' @export
#' @rdname wm_children
wm_children_ <- function(id = NULL, name = NULL, marine_only = TRUE,
                         offset = 1, ...) {
  id <- id_name(id, name)
  run_bind(id, wm_children, marine_only = marine_only, offset = offset, 
    on_error = warning, ...)
}
