# Get the breakpoints for a weighted histogram

Gets the breakpoints for a weighted histogram.

## Usage

``` r
get.breaks(x,breaks)
```

## Arguments

- x:

  A numeric vector.

- breaks:

  Either the name of the function to calculate breakpoints, the number
  of categories or a vector of breakpoints.

## Details

`get.breaks` either calls the same functions as `hist` to get
breakpoints or calculates a given number or just returns `breaks` if
they are already specified.

## Value

A vector of breakpoints.

## Author

Jim Lemon

## See also

[hist](https://rdrr.io/r/graphics/hist.html)
