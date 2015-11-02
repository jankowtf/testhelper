\dontrun{
# Prepare:
old <- setwd(tempdir())
dir.create("tests/testthat/test_dir", recursive = TRUE)

# Assumes that the following file exists: ~/tests/testthat/test_dir
# Failing test when executed in a "stand-alone" manner:
try(expect_true(file.exists("test_dir")))

# Ensuring the appropriate working directory:
withCorrectWorkingDir(
  expect_true(file.exists("test_dir"))
)

# Clean up:
if (grepl(basename(getwd()), old)) {
  unlink("tests", recursive = TRUE)
}
setwd(old)
}
