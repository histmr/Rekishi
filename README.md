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

The function normalize_kanji() converts old 旧漢字 and variant 異体字 characters into their modern counterparts for purposes of text comparison. The function supports both literal strings and characters vectors. The conversion table was adapted from # http://wwwap.hi.u-tokyo.ac.jp/ships/itaiji_list.jsp 確認日：2017年10月29日

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

The function NDL_counter scrapes data from the National Diet Library's digital collection. It takes three arguments: the search string, the start year (as a four digit number) and the end year. For years with no hits, the function replaces NA with zero for a complete time series

```{r}
NDL_counter("犬", 1868, 1925)

Read 12361 items
   Year Count
1  1868     0
2  1869     0
3  1870     0
4  1871     0
5  1872     0
6  1873     0
7  1874     0
8  1875     1
9  1876     0
10 1877     0
11 1878     1
12 1879     0
13 1880     0
14 1881     0
15 1882     0
16 1883     4
17 1884     1
18 1885     4
19 1886     1
20 1887     3
21 1888     8
22 1889     1
23 1890     4
24 1891     2
25 1892     0
26 1893     3
27 1894     3
28 1895     0
29 1896     0
30 1897     3
31 1898     1
32 1899     1
33 1900     2
34 1901     4
35 1902     1
36 1903     0
37 1904     2
38 1905     2
39 1906     3
40 1907     3
41 1908     3
42 1909     6
43 1910     7
44 1911    13
45 1912    12
46 1913     5
47 1914     7
48 1915     3
49 1916    12
50 1917     8
51 1918     6
52 1919     7
53 1920    10
54 1921     5
55 1922     9
56 1923     8
57 1924     8
58 1925     6
```
