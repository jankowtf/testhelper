context("withCorrectWorkingDir")

test_that("withCorrectWorkingDir", {
  expect_true("test-withCorrectWorkingDir.R" %in%
    withCorrectWorkingDir(list.files()))
})

