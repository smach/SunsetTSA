## Per Jenny Bryan here: https://github.com/STAT545-UBC/Discussion/issues/451#issuecomment-264598618
## quiets concerns of R CMD check re: the .'s that appear in pipelines
if(getRversion() >= "2.10")  utils::globalVariables(c("City", "State"))


#' Get airport codes by city
#'
#' @param the_city string, name of US city
#' @param the_state string, optional, two-letter code for US state
#'
#' @return data frame with Code, City, State, and Airport
#' @export
#'
#' @examples
#' airport_codes_by_city("New York")
#' airport_codes_by_city("Greenville", "NC")
airport_codes_by_city <- function(the_city, the_state = "") {
  if(the_state == "") {
    matching_codes <- airport_codes[tolower(airport_codes$City) == tolower(the_city),]
  } else {
    matching_codes <- airport_codes[tolower(airport_codes$City) == tolower(the_city) & tolower(airport_codes$State) == tolower(the_state),]
  }
  return(matching_codes)
}


#' Get all airport codes in a state
#'
#' @param the_state string, two-letter code for a US state
#'
#' @return data frame with Code, City, State, and Airport
#' @export
#'
#' @examples
#' airport_codes_by_state("RI")
airport_codes_by_state <- function(the_state) {
    matching_codes <- airport_codes[tolower(airport_codes$State) == tolower(the_state),]
  return(matching_codes)
}




#' Get airport code by airport name
#'
#' @param the_airport string, name or partial name of airport
#'
#' @return data frame with Code, City, State, and Airport
#' @export
#'
#' @examples
#' airport_codes_by_name("Kennedy")
#'
airport_codes_by_name <- function(the_airport) {
  matching_code <- airport_codes[grepl(tolower(the_airport), tolower(airport_codes$Airport)),]
  return(matching_code)

}

