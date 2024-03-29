context("wm_records_names")

test_that("wm_records_names", {
  vcr::use_cassette("wm_records_names", {
    aa <- wm_records_names(name = 'Coryphaena immaculata')

    expect_is(aa, "list")
    expect_is(aa[[1]], "tbl_df")
    expect_is(aa[[1]], "data.frame")
    expect_true(all(grepl("Coryphaena immaculata", aa[[1]]$scientificname)))
    expect_equal(NROW(aa[[1]]), 1)
  })
})

test_that("wm_records_names fails well", {
  skip_on_cran()

  expect_error(wm_records_names(), "argument \"name\" is missing")
  expect_error(wm_records_names(55555), "name must be of class character")
  expect_error(wm_records_names("asdfs", marine_only = 5), "marine_only must be of class logical")
})

test_that("wm_records_names result length matches input", {
  skip_on_cran()

  suppressWarnings(expect_equal(length(wm_records_names("asdfs", on_error = warning)), 1))
  suppressWarnings(expect_equal(length(wm_records_names(c("asdfs", "qwerq"), on_error = warning)), 2))
})
