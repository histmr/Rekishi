#' Kanji normalizing function
#'
#' This function converts old 旧漢字 and variant 異体字 Japanese characters to their modern equivalents.
#' The conversion table was adapted from # http://wwwap.hi.u-tokyo.ac.jp/ships/itaiji_list.jsp 確認日：2017年10月29日
#'
#' @param doc A string literal or object
#' @keywords Japanese, kanji
#' @importFrom stringi stri_replace_all_fixed
#' @export
#' @examples
#' normalize_kanji("亞啞惡蘆鰺壓菴桉")
normalize_kanji <- function(doc) {
  stri_replace_all_fixed(doc, kanji_conversion_table$old, kanji_conversion_table$new,
                         vectorize_all = FALSE)
}

