#' Kanji and kana counter
#'
#' This function returns a dataframe with statistics for the types of characters in a string or character vector
#'
#' @param doc A string literal or object
#' @keywords Japanese, kanji, hiragana, katakana
#' @importFrom stringi stri_count
#' @export
#' @examples
#' kanji_counter("x")
kanji_counter <- function(doc){
  kanji <- unlist(lapply(doc, FUN = function(x) stri_count(x, regex = "[\\x{4e00}-\\x{9faf}]")))
  hiragana <- unlist(lapply(doc, FUN = function(x) stri_count(x, regex = "[\\x{3041}-\\x{3096}]")))
  katakana <- unlist(lapply(doc, FUN = function(x) stri_count(x, regex = "[\\x{30A1}-\\x{30FA}|\\x{30FC}-\\x{30FE}|\\x{FF66}-\\x{FF9e}]")))
  hentaigana <- unlist(lapply(doc, FUN = function(x) stri_count(x, regex = "[\\x{1B100}-\\x{1B11E}|\\x{1B001}-\\x{1B0FF}]")))
  roman_letters <- unlist(lapply(doc, FUN = function(x) stri_count(x, regex = "[\\x{FF21}-\\x{FF3a}|\\x{FF41}-\\x{FF5a}]|x{0041}-\\x{005A}]|x{0061}-\\x{007A}]")))

   count_results <- data.frame("kanji"=kanji, "hiragana"=hiragana, "katakana"=katakana, "hentaigana"=hentaigana, "roman_letters"=roman_letters)
  return(count_results)
}
