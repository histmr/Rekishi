#' NDL scraper
#'
#' This function scrapes search results from the National Diet Library's digital collection, counts numbers of hits per years, and generates a full times series with 0 values for missing years.
#' The search url is http://dl.ndl.go.jp/
#'
#' @param pattern a string literal or object
#' @param start_date a number for the start year
#' @param end_date a number for year the end year
#' @keywords Japanese, NDL, search
#' @importFrom stringi stri_extract_all stri_replace_all_regex
#' @export
#' @examples
#' NDL_counter("x", 1920, 1922)

NDL_counter <- function(pattern, start_date, end_date)
{

complete_url <- paste("http://dl.ndl.go.jp/search/searchResult?issuedTo=",end_date,"&viewRestrictedList=0&issuedFm=",start_date,"&detailSearchTypeNo=A&reshowFlg=1&rows=10000&keyword=",pattern,"&materialTypeList=0%7C1%7C2%7C4%7C5%7C6%7C7%7C8%7C9%7C92%7C13%7C15%7CI", sep="")
ndl_stuff <- scan(file = complete_url, what="character",sep = "")
date_vector <- stri_extract_all(ndl_stuff, regex="^\\d{4}\\)$")
date_vector <- suppressWarnings(as.numeric(stri_replace_all_regex(date_vector, "\\)","")))
date_vector <- date_vector[!is.na(date_vector)]
output_by_year.df <- data.frame(table(date_vector))
colnames(output_by_year.df) <- c("Year","Count")
empty_seq <- seq(start_date, end_date,1)
empty.df <- data.frame("Year"=empty_seq, "Count"=0)
complete_seq.df <- merge.data.frame(empty.df, output_by_year.df, by = "Year", all.x = TRUE)
complete_seq.df$Count.y[is.na(complete_seq.df$Count.y)] <- 0
complete_seq.df$Count <- complete_seq.df$Count.x + complete_seq.df$Count.y
complete_seq.df <- complete_seq.df[,c(1,4)]
return(complete_seq.df)
}
