---
title: "Rekishi"
author: "Ravina"
date: "October 29, 2017"
output: html_document
---
### Rekishi

I developed this package during my own research in Japanese history. It includes functions for working with Japanese text and databases

License: MIT

For more information please contact histmr@emory.edu

## Installation

To install from GitHub use the devtools package

```{r eval=FALSE}
devtools::install_github("histmr/Rekishi")
```
## Usage

The function normalize_kanji() converts old 旧漢字 and variant 異体字 characters into their modern counterparts for purposes of text comparison. The function supports both literal strings and characters vectors

```{r}
normalize_kanji(c("東京の國は寒いよ。","亞細亞は寒いよ。"))
[1] "東京の国は寒いよ。" "亜細亜は寒いよ。" 
```

