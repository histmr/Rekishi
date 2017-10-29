#' Kanji normalizing function
#'
#' This function converts old 旧漢字 and variant 異体字 Japanese characters to their modern equivalents.
#' The conversion table was adapted from # http://wwwap.hi.u-tokyo.ac.jp/ships/itaiji_list.jsp 確認日：2017年10月29日
#' @param doc A string literal or object
#' @keywords Japanese, kanji
#' @export
#' @examples
#' #' normalize(text_string)
#'
#'
normalize <- function(doc)
{
  kanji_conversion <- data.frame("old" =c("學","勲"
), "new" =c("学","勳"), stringsAsFactors = FALSE)
  for (i in 1:nrow(kanji_conversion))
  {doc <- gsub(kanji_conversion$old[i], kanji_conversion$new[i], doc)
  }
  return(doc)
}

