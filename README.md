testhelper
======

[![Travis-CI Build Status](https://travis-ci.org/rappster/testhelper.svg?branch=master)](https://travis-ci.org/rappster/testhelper)
[![Coverage Status](https://img.shields.io/codecov/c/github/rappster/testhelper/master.svg)](https://codecov.io/github/rappster/testhelper?branch=master)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/testhelper)](http://cran.r-project.org/package=testhelper)

Tools for relative unit testing

## Purpose 

Some functions to determine the correct working directory when executing unit tests line-by-line.

## Installation 

```
require("devtools")
devtools::install_github("rappster/testhelper")
require("testhelper")
```

## Examples

```
# Preparation:
old <- setwd(tempdir())
dir.create("tests/testthat/test_dir", recursive = TRUE)

# Assumes that the following file exists: ~/tests/testthat/test_dir
# Failing test when executed in a "stand-alone" manner:
testthat::expect_false(file.exists("test_dir"))

# This is tolerant with respect to the working directory pointing to the 
# package project:
withCorrectWorkingDir(
  expect_true(file.exists("test_dir"))
)
```
