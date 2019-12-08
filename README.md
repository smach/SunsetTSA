# SunsetTSA
## Get Sunrise and Sunset Times for US Airport Locations

This package gets sunrise and sunset times for any US airport location by 3-letter airport code. The `sunrise_sunset()` function takes one mandatory argument, the airport code; and one optional argument, the date in yyyy-mm-dd format (without a date, results default to today's date.) Results are a list with sunrise time, sunset time, airport code, and date requested. Data come from a TSA API.

The package also has several convenience functions to look up airport codes by city, city and state, state, or partial name of the airport. Results are a data frame with airport code, city, state, and airport name. Data come from the US Bureau of Transportation Statistics.

This package is not yet on CRAN. To install it, you can use any number of packages and functions, including `remotes::install_github("smach/SunsetTSA")` or `githubinstall::githubinstall("SunsetTSA")` (`githubinstall()` attempts to find a package on GitHub even if you don't know the repo owner's account, and then asks you if you want to install the version it finds.)

For more information, run `vignette("Introduction",  package = "SunsetTSA")` after installing the package or head to the package website at [https://smach.github.io/SunsetTSA/](https://smach.github.io/SunsetTSA/).

  
<!-- badges: start -->
[![Travis build status](https://travis-ci.org/smach/SunsetTSA.svg?branch=master)](https://travis-ci.org/smach/SunsetTSA)
<!-- badges: end -->


