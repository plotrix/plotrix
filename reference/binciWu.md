# Upper binomial confidence limit

Returns the upper binomial confidence limit using the Wilson
approximation.

## Usage

``` r
binciWu(x,n,alpha=0.05,trueval=TRUE,na.rm=TRUE)
```

## Arguments

- x:

  The number of successes or failures for which the CI is to be
  calculated.

- n:

  The number of trials as above.

- alpha:

  The desired coverage - 0.05 produces 95 percent coverage

- trueval:

  The value representing the outcome of interest for the CI.

- na.rm:

  Argument needed to make this work

## Details

`binciWu` now calls `binciW` and returns the upper limit.

## Value

The upper binomial confidence interval

## Author

Jim Lemon

## See also

[binciWl](binciWl.md)

## Examples

``` r
 binciWl(c(rep(5,TRUE),rep(37,FALSE)))
#> [1] 0
```
