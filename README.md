---
title: "Rekishi"
author: "Ravina"
date: "October 29, 2017"
output: html_document
---
## Rekishi

I developed this package during my own research in Japanese history. It includes functions for working with Japanese text and databases.

License: MIT

For more information please contact histmr@emory.edu

## Installation

To install from GitHub use the devtools package

```r eval=FALSE}
devtools::install_github("histmr/Rekishi")
```
## Usage

### normalize_kanji()

The function normalize_kanji() converts old 旧漢字 and variant 異体字 characters into their modern counterparts for purposes of text comparison. The function supports both literal strings and characters vectors.

```{r}
normalize_kanji(c("東京の國は寒いよ。","亞細亞は寒いよ。"))
[1] "東京の国は寒いよ。" "亜細亜は寒いよ。" 

example <- "國學"
normalize_kanji(example)
[1] "国学"
```
### kanji_count()

The function kanji_count() returns a dataframe with statistics for the types of characters in a string or characters vector using the following definitions.

 character type         | Unicode range(s)
--- | ---
 kanji                  | 4E00-9fAf
 hiragana               | 3041-3096
 katakana               | 30A1-30FA, 30FC-30FE, FF66-FF9
 hentaigana             | 1B100-1B11E, 1B001-1B0FF
 Roman letters          | FF21-FF3A, FF41-FF5A, 0041-005A, 0061-007A


These ranges are adapted from the standard tables at http://www.unicode.org/charts/ and exclude some punctuation glyphs commonly listed as katakana, while including half-width kana. The Roman letter ranges includes glyphs both in ASCII and the Unicode Japanese range 

```{r}
kanji_count(c("東京の國は寒いよ。","亞細亞は寒いよ。"))
 kanji hiragana katakana hentaigana roman_letters
1     4        4        0          0             0
2     4        3        0          0             0

example <- c("東京は寒いよ。","寒いよ。","𛄃カタカナＡＴＯＫapple","タッタ")
kanji_counter(example)

  kanji hiragana katakana hentaigana roman_letters
1     3        3        0          0             0
2     1        2        0          0             0
3     0        0        4          1             4
4     0        0        3          0             0
```

Note that while hentaigana exists in Unicode, many fonts/typefaces render that range as boxes or other glyphs.

### NDL_counter()

The function NDL_counter scrapes data from the National Diet Library's digital collection. It takes three arguments: the search string, the start year (as a foud digit number) and the end year. For years with no hits, the function replaces NA with zero for a complete time series

NDL_counter("犬", 1868, 1925)
