# Perform a nested breakdown of numeric values

Breaks down a numeric or categorical element of a data frame by one or
more categorical elements.

## Usage

``` r
brkdnNest(formula,data,FUN=c("mean","sd","sd","valid.n"),label1="Overall",
  trueval=TRUE)
```

## Arguments

- formula:

  A formula with a numeric element of a data frame on the left and one
  or more categorical elements on the right.

- data:

  A data frame containing the elements in `formula`.

- FUN:

  The functions to be applied to successive breakdowns.

- label1:

  The label to use for the overall value of the first function.

- trueval:

  The value to use in calculating proportions or sums of a categorical
  response variable. See Details.

## Value

A list with as many elements as there are functions in `FUN`. It is
probably best to always specify four functions (summary measure, upper
dispersion measure, lower dispersion measure and number of valid
observations) even if this is redundant as in the default.

This function is similar to `brkdn` in the prettyR package, but is
structured to be used with the `barNest` function. It produces one or
more measures for the overall data, then the subsets of the data defined
by the first variable to the right of the tilde, then the subsets
defined by the first and second variable, and so on.

## Details

`brkdnNest` performs a nested breakdown of an element of a data frame by
one or more categorical elements. For each category and optional
subcategories, the variable on the left of the formula is summarized as
specified by the functions named in `FUN`.

If `trueval` is not NA, brkdnNest will calculate the proportion of
`trueval` values in the response variable out of the total valid
responses. If the function `valid.n` is the first function in `FUN`, the
counts of the groups and subgroups will be returned.

Two specialized summary functions are defined within `brkdnNest`.
`sumbrk` returns the count of values in a factor equal to `trueval`, and
`propbrk` returns the proportion of values equal to `trueval`. Be aware
that if a categorical variable is specified on the left of the formula,
functions which expect numeric data such as `mean` should not be
included in `FUN`.

The user should take care when specifying different summary functions.
`barNest` expects a summary measure as the first component of the list
and measures of dispersion as the second and third. If two different
measures of dispersion are passed, the first must calculate the upper
and the second the lower measure.

## Author

Jim Lemon

## See also

[by](https://rdrr.io/r/base/by.html)

## Examples

``` r
 brkdntest<-data.frame(Age=rnorm(100,25,10),
  Sex=factor(sample(c("M","F"),100,TRUE)),
  Marital=sample(c("M","X","S","W"),100,TRUE),
  Employ=sample(c("FT","PT","NO"),100,TRUE))
 brkdnNest(formula=Age~Sex+Marital+Employ,data=brkdntest)
#> mean 
#> Overall 24.35412 
#>   F 24.13515 
#>       M 25.31509 
#>           FT 31.67157 
#>           NO 22.29443 
#>           PT 25.10499 
#>       S 24.41918 
#>           FT 25.42455 
#>           NO 23.3728 
#>           PT 23.43842 
#>       W 22.42168 
#>           FT 21.64662 
#>           NO 22.58689 
#>           PT 22.72152 
#>       X 24.78159 
#>           FT 30.33997 
#>           NO 25.23715 
#>           PT 22.70102 
#>   M 24.5645 
#>       M 23.63738 
#>           FT 28.11792 
#>           NO 17.77709 
#>           PT 24.74118 
#>       S 23.93357 
#>           FT NA 
#>           NO 23.76369 
#>           PT 24.14591 
#>       W 25.56561 
#>           FT 23.34187 
#>           NO 26.68862 
#>           PT 29.63132 
#>       X 24.85928 
#>           FT 16.16233 
#>           NO 27.6349 
#>           PT 25.96954 
#> sd 
#> Overall 7.992469 
#>   F 8.211191 
#>       M 11.9396 
#>           FT 5.639837 
#>           NO 15.28303 
#>           PT 12.05139 
#>       S 7.808277 
#>           FT 7.408498 
#>           NO 6.406452 
#>           PT 10.39316 
#>       W 4.692401 
#>           FT 2.389779 
#>           NO 6.364952 
#>           PT 4.700077 
#>       X 9.276618 
#>           FT 15.87114 
#>           NO 7.312338 
#>           PT 9.092153 
#>   M 7.85256 
#>       M 10.41646 
#>           FT 8.794668 
#>           NO 8.27566 
#>           PT 12.65671 
#>       S 6.783078 
#>           FT NA 
#>           NO 6.817546 
#>           PT 7.785475 
#>       W 5.269618 
#>           FT 4.452918 
#>           NO 6.058298 
#>           PT 5.141074 
#>       X 8.369062 
#>           FT 7.185825 
#>           NO 8.561454 
#>           PT 6.62298 
#> sd 
#> Overall 7.992469 
#>   F 8.211191 
#>       M 11.9396 
#>           FT 5.639837 
#>           NO 15.28303 
#>           PT 12.05139 
#>       S 7.808277 
#>           FT 7.408498 
#>           NO 6.406452 
#>           PT 10.39316 
#>       W 4.692401 
#>           FT 2.389779 
#>           NO 6.364952 
#>           PT 4.700077 
#>       X 9.276618 
#>           FT 15.87114 
#>           NO 7.312338 
#>           PT 9.092153 
#>   M 7.85256 
#>       M 10.41646 
#>           FT 8.794668 
#>           NO 8.27566 
#>           PT 12.65671 
#>       S 6.783078 
#>           FT NA 
#>           NO 6.817546 
#>           PT 7.785475 
#>       W 5.269618 
#>           FT 4.452918 
#>           NO 6.058298 
#>           PT 5.141074 
#>       X 8.369062 
#>           FT 7.185825 
#>           NO 8.561454 
#>           PT 6.62298 
#> valid.n 
#> Overall 100 
#>   F 49 
#>       M 9 
#>           FT 2 
#>           NO 4 
#>           PT 3 
#>       S 16 
#>           FT 8 
#>           NO 3 
#>           PT 5 
#>       W 13 
#>           FT 3 
#>           NO 5 
#>           PT 5 
#>       X 11 
#>           FT 2 
#>           NO 3 
#>           PT 6 
#>   M 51 
#>       M 13 
#>           FT 4 
#>           NO 4 
#>           PT 5 
#>       S 9 
#>           FT 0 
#>           NO 5 
#>           PT 4 
#>       W 13 
#>           FT 7 
#>           NO 3 
#>           PT 3 
#>       X 16 
#>           FT 3 
#>           NO 7 
#>           PT 6 
 # show the proportion of unemployed with binomial confidence intervals
 brkdnNest(formula=Employ~Sex+Marital,data=brkdntest,
  FUN=c("propbrk","binciWu","binciWl"),trueval="NO")
#> propbrk 
#> Overall 0.34 
#>   F 0.3061224 
#>       M 0.4444444 
#>       S 0.1875 
#>       W 0.3846154 
#>       X 0.2727273 
#>   M 0.372549 
#>       M 0.3076923 
#>       S 0.5555556 
#>       W 0.2307692 
#>       X 0.4375 
#> binciWu 
#> Overall 0.4372227 
#>   F 0.4452789 
#>       M 0.7333487 
#>       S 0.4300888 
#>       W 0.6447711 
#>       X 0.5656453 
#>   M 0.5097479 
#>       M 0.5763066 
#>       S 0.8112215 
#>       W 0.5025638 
#>       X 0.6682144 
#> binciWl 
#> Overall 0.2546152 
#>   F 0.1951549 
#>       M 0.1887785 
#>       S 0.06591599 
#>       W 0.1770971 
#>       X 0.09746059 
#>   M 0.2532052 
#>       M 0.126807 
#>       S 0.2666513 
#>       W 0.08179529 
#>       X 0.2309865 
```
