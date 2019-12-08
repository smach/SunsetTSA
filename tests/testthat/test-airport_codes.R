context("Airport codes")
library(SunsetTSA)

test_that("airport_codes_by_city works", {
  expect_equal(airport_codes_by_city("Providence")$Code[1], "PVD")
  expect_equal(airport_codes_by_city("New York")$Code[2], "JFK")
})

test_that("airport_codes_by_city no results for bad city", {
  expect_equal(nrow(airport_codes_by_city("123")), 0 )
})

test_that("airport_codes_by_state works", {
  expect_equal(nrow(airport_codes_by_state("RI")), 7)
  expect_equal(airport_codes_by_state("RI")$Code[airport_codes_by_state("RI")$City == "Providence"], "PVD")
  expect_equal(nrow(airport_codes_by_state("DC")), 4)
  expect_equal(nrow(airport_codes_by_state("Washington")), 0)
})

test_that("airport_codes_by_name works", {
  expect_equal(airport_codes_by_name("Dulles")$Code, "IAD")
  expect_equal(airport_codes_by_name("Kennedy International")$Code, "JFK")
  expect_equal(nrow(airport_codes_by_name("Heathrow")), 0)
})

