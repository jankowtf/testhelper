context("test_that2")

test_that("test_that2", {
  expect_identical(
    test_that2("test_that_2", "test-test_that2.R" %in% list.files()),
    NULL
  )
})

