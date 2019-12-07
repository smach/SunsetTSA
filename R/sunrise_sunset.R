#' Get sunrise and sunset data for one day at US airport location from TSA API
#'
#' @param the_airport_code string valid 3-letter US airport code. See http://bit.ly/USAirportCodes for full list.
#' @param the_date string or date object in yyyy-mm-dd format. Defaults to current date.
#'
#' @return list with Sunrise, Sunset, Date, Location
#' @examples
#' \dontrun{
#' sunrise_sunset("BOS")
#' sunrise_sunset("JFK", "2019-12-22")
#' }
#' @export
#'

sunrise_sunset <- function(the_airport_code, the_date = Sys.Date()) {

    # Set up query URL -----------
    baseurl <- "http://apps.tsa.dhs.gov/MyTSAWebService/GetEventInfo.ashx?eventtype=sunrise_sunset"
    the_query <- list(
      eventtype = "sunrise_sunset",
      airportcode = the_airport_code,
      output = "json",
      eventdate = the_date
    )

    the_data_json <- httr::GET(baseurl, query = the_query)

    # Pull data from API but ony if status code 200 ----------
    if(the_data_json$status_code == 200) {
      the_data <- httr::content(the_data_json)
      the_data$Date <- the_date
      the_data$Location <- the_airport_code
      if(the_data$Sunrise == "na") {
        warning(paste0("Sunrise and sunset data is not available for ", the_airport_code, ". Are you sure you used a valid TSA US airport code?") )
      }
      return(the_data)
    } else {
      warning('Data unavailable from the TSA API. There may be a problem with the API, or you may have entered an invalid date. Make sure your date is in yyyy-mm-dd format.')
    } # end if status code is OK





}
