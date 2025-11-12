# Binomial confidence limits

Calculates binomial confidence limits using the Wilson approximation.

## Usage

``` r
binciW(x,n,alpha=0.05,cc=FALSE)
```

## Arguments

- x:

  The number of successes or failures for which the CI is to be
  calculated.

- n:

  The number of trials as above.

- alpha:

  The desired coverage - 0.05 produces 95 percent coverage

- cc:

  Whether to apply a continuity correction

## Details

`binciW` calculates binomial confidence limits for the given number of
successes and trials. It is mainly to allow binomial confidence limits
to be calculated in the `brkdnNest` function, which is why the upper and
lower CIs are called separately.

## Value

The lower and upper binomial confidence limits

## Author

Jim Lemon

## See also

[binciWl](binciWl.md), [binciWu](binciWu.md)

## Examples

``` r
 binciW(5,42)
#> [1] 0.05193803 0.25000390
```
