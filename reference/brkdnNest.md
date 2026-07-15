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
#> Overall 24.25112 
#>   F 23.90896 
#>       M 29.78023 
#>           FT 25.94351 
#>           NO 35.22493 
#>           PT 20.00521 
#>       S 21.62925 
#>           FT 25.00359 
#>           NO 24.04868 
#>           PT 16.31936 
#>       W 23.71482 
#>           FT 24.30869 
#>           NO 23.41807 
#>           PT 20.15084 
#>       X 22.49344 
#>           FT 20.48668 
#>           NO 22.41252 
#>           PT 23.38816 
#>   M 24.57986 
#>       M 24.3669 
#>           FT 26.58063 
#>           NO 26.13452 
#>           PT 21.63831 
#>       S 20.61853 
#>           FT 29.56594 
#>           NO 18.08277 
#>           PT 19.32657 
#>       W 26.54354 
#>           FT 17.88059 
#>           NO 29.67137 
#>           PT 27.36236 
#>       X 24.41076 
#>           FT 25.25213 
#>           NO 23.12897 
#>           PT 25.4855 
#> sd 
#> Overall 8.167198 
#>   F 8.690009 
#>       M 10.19225 
#>           FT 18.94811 
#>           NO 4.823336 
#>           PT 3.19363 
#>       S 8.64972 
#>           FT 5.491037 
#>           NO 11.69213 
#>           PT 7.426065 
#>       W 8.629313 
#>           FT 8.971377 
#>           NO 10.23565 
#>           PT NA 
#>       X 6.569949 
#>           FT 9.173023 
#>           NO 10.43973 
#>           PT 4.358928 
#>   M 7.704001 
#>       M 7.576893 
#>           FT 8.198281 
#>           NO 9.089872 
#>           PT 6.836291 
#>       S 7.693235 
#>           FT NA 
#>           NO 13.57762 
#>           PT 2.612838 
#>       W 9.370246 
#>           FT 9.059086 
#>           NO 8.23726 
#>           PT 9.499959 
#>       X 6.016778 
#>           FT 9.541324 
#>           NO 5.983397 
#>           PT 5.011772 
#> sd 
#> Overall 8.167198 
#>   F 8.690009 
#>       M 10.19225 
#>           FT 18.94811 
#>           NO 4.823336 
#>           PT 3.19363 
#>       S 8.64972 
#>           FT 5.491037 
#>           NO 11.69213 
#>           PT 7.426065 
#>       W 8.629313 
#>           FT 8.971377 
#>           NO 10.23565 
#>           PT NA 
#>       X 6.569949 
#>           FT 9.173023 
#>           NO 10.43973 
#>           PT 4.358928 
#>   M 7.704001 
#>       M 7.576893 
#>           FT 8.198281 
#>           NO 9.089872 
#>           PT 6.836291 
#>       S 7.693235 
#>           FT NA 
#>           NO 13.57762 
#>           PT 2.612838 
#>       W 9.370246 
#>           FT 9.059086 
#>           NO 8.23726 
#>           PT 9.499959 
#>       X 6.016778 
#>           FT 9.541324 
#>           NO 5.983397 
#>           PT 5.011772 
#> valid.n 
#> Overall 100 
#>   F 49 
#>       M 9 
#>           FT 2 
#>           NO 5 
#>           PT 2 
#>       S 14 
#>           FT 5 
#>           NO 4 
#>           PT 5 
#>       W 13 
#>           FT 8 
#>           NO 4 
#>           PT 1 
#>       X 13 
#>           FT 3 
#>           NO 3 
#>           PT 7 
#>   M 51 
#>       M 14 
#>           FT 5 
#>           NO 3 
#>           PT 6 
#>       S 6 
#>           FT 1 
#>           NO 2 
#>           PT 3 
#>       W 15 
#>           FT 3 
#>           NO 7 
#>           PT 5 
#>       X 16 
#>           FT 3 
#>           NO 7 
#>           PT 6 
 # show the proportion of unemployed with binomial confidence intervals
 brkdnNest(formula=Employ~Sex+Marital,data=brkdntest,
  FUN=c("propbrk","binciWu","binciWl"),trueval="NO")
#> propbrk 
#> Overall 0.35 
#>   F 0.3265306 
#>       M 0.5555556 
#>       S 0.2857143 
#>       W 0.3076923 
#>       X 0.2307692 
#>   M 0.372549 
#>       M 0.2142857 
#>       S 0.3333333 
#>       W 0.4666667 
#>       X 0.4375 
#> binciWu 
#> Overall 0.4474556 
#>   F 0.4662079 
#>       M 0.8112215 
#>       S 0.5464908 
#>       W 0.5763066 
#>       X 0.5025638 
#>   M 0.5097479 
#>       M 0.4758923 
#>       S 0.7000067 
#>       W 0.6988302 
#>       X 0.6682144 
#> binciWl 
#> Overall 0.2636425 
#>   F 0.212075 
#>       M 0.2666513 
#>       S 0.1172138 
#>       W 0.126807 
#>       X 0.08179529 
#>   M 0.2532052 
#>       M 0.07571387 
#>       S 0.09677141 
#>       W 0.2480954 
#>       X 0.2309865 
```
