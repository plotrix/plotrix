# Correct for aspect and coordinate ratio

Calculate a multiplication factor for the Y dimension to correct for
unequal plot aspect and coordinate ratios on the current graphics
device.

## Usage

``` r
getYmult()
```

## Details

`getYmult` retrieves the plot aspect ratio and the coordinate ratio for
the current graphics device, calculates a multiplicative factor to
equalize the X and Y dimensions of a plotted graphic object.

## Value

The correction factor for the Y dimension.

## Author

Jim Lemon

## See also

[draw.circle](draw.circle.md)
