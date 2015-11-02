#' @title
#' Evaluate test code in appropriate working directory.
#'
#' @description
#' Wrapping test code with this function ensures that the appropriate working
#' directory is chosen regardless of how test code is executed (see details).
#' This is especially useful when test code itself is still at a development stage,
#' i.e. not completely fit for execution via \code{\link[testthat]{test}} or
#' similar testing routines yet.
#'
#' @details
#' In case test code is executed via "stand-alone" calls to either
#' \code{\link[testthat]{expect_that}} (or functions calling that function) or
#' \code{\link[testthat]{test_that}} instead of a "global" call to
#' \code{\link[testthat]{test}}, the working directory is \emph{temporarily}
#' set to \code{"~/tests/testthat"}.
#'
#' @section Assumptions:
#' The function assumes that your initial working directory points to a
#' directory containing a valid R package (project) as created via
#' functions like \code{\link[base]{package.skeleton}},
#' \code{\link[devtools]{create}} or the like.
#'
#' @param code test code containing expectations
#' @return Whatever the \code{code} returns.
#' @example inst/examples/example-withCorrectWorkingDir.R
#' @export
withCorrectWorkingDir <- function(
  code,
  pattern = "/tests/testthat$",
  target_wd = "tests/testthat"
) {
  wd <- getwd()
  if (!grepl(pattern, wd)) {
    if (!file.exists(target_wd)) {
      stop(sprintf("Directory does not exist: %s", target_wd))
    }
    setwd(target_wd)
  }
  on.exit(setwd(wd))
  force(code)
}

#' @title
#' Unit testing with appropriate working directory.
#'
#' @description
#' Wraps call to \code{\link[testthat]{test_that}} by
#' \code{\link[testhelper]{withDetectedWorkingDirectory}}.
#'
#' @param desc See \code{\link[testthat]{test_that}}
#' @param code See \code{\link[testthat]{test_that}}
#' @export
test_that2 <- function(desc, code) {
  withCorrectWorkingDir(
    testthat:::test_code(desc, substitute(code), env = parent.frame())
  )
  invisible()
}
