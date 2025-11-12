# Lower binomial confidence limit

Returns the lower binomial confidence limit using the Wilson
approximation.

## Usage

``` r
binciWl(x,n,alpha=0.05,trueval=TRUE,na.rm=TRUE)
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

`binciWl` now calls `binciW` and returns the lower limit.

## Value

The lower binomial confidence limit

## Author

Jim Lemon

## See also

[binciWu](binciWu.md)

## Examples

``` r
 binciWl(c(rep(5,TRUE),rep(37,FALSE)))
#> [1] 0
```
