context("Sunrise and sunset times")
library(SunsetTSA)
x <- sunrise_sunset("GSP", "2019-12-20")

test_that("sunrise and sunset times with default date", {
     expect_equal(length(sunrise_sunset("LGA")), 4)
     expect_warning(sunrise_sunset("Boston, MA") )
})


test_that("sunrise and sunset times with date argument", {
  expect_equal(sunrise_sunset("ANC", "2020-06-20")$Sunset, "11:42:14 PM")
  expect_warning(sunrise_sunset("BOS", "2019-13-31"))
  expect_equal(x$Sunrise, "07:32:09 AM")
  expect_equal(x$Sunset, "05:20:41 PM")
  expect_equal(x$Date, "2019-12-20" )
  expect_equal(x$Location, "GSP")
})
