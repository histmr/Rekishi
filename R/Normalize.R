#' Kanji normalizing function
#'
#' This function converts old and variant Japanese characters to their modern equivalents.
#'
#' @param doc A string literal or object
#' @keywords Japanese, kanji
#' @importFrom stringi stri_replace_all_fixed
#' @export
#' @examples
#' normalize_kanji("x")

normalize_kanji <- function(doc) {
    kanji_conversion_table <- get("kanji_conversion_table")
    stri_replace_all_fixed(doc, kanji_conversion_table$old, kanji_conversion_table$new, vectorize_all = FALSE)
}

