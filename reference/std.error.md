# Calculate standard error of the mean

Calculates the standard error of the mean.

## Usage

``` r
std.error(x,na.rm)
```

## Arguments

- x:

  A vector of numerical observations.

- na.rm:

  Dummy argument to match other functions.

## Details

`std.error` will accept a numeric vector.

## Value

The conventional standard error of the mean = sd(x)/sqrt(sum(!is.na(x)))

## Author

Jim Lemon

## See also

[sd](https://rdrr.io/r/stats/sd.html)
