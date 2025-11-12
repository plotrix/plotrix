# Plot with repeated symbols by size

Plots a set of (x,y) data with repeated points denoted by larger symbol
sizes

## Usage

``` r
sizeplot(x, y, scale=1, pow=0.5, powscale=TRUE, size=c(1,4), add=FALSE, ...)
```

## Arguments

- x:

  x coordinates of data

- y:

  y coordinates of data

- scale:

  scaling factor for size of symbols

- pow:

  power exponent for size of symbols

- powscale:

  (logical) use power scaling for symbol size?

- size:

  (numeric vector) min and max size for scaling, if powscale=FALSE

- add:

  (logical) add to an existing plot?

- ...:

  other arguments to `plot()` or `points()`

## Details

Most useful for plotting (e.g.) discrete data, where repeats are likely.
If all points are repeated equally, gives a warning. The size of a point
is given by \\scale\*n^pow\\, where n is the number of repeats, if
powscale is TRUE, or it is scaled between size\[1\] and size\[2\], if
powscale is FALSE.

## Value

A plot is produced on the current device, or points are added to the
current plot if `add=TRUE`.

## Author

Ben Bolker

## See also

[symbols](https://rdrr.io/r/graphics/symbols.html)

## Examples

``` r
 x <- c(0.1,0.1,0.1,0.1,0.1,0.2,0.2,0.2,0.2,0.3,0.3)
 y <- c( 1,  1,  1,  1,  2,  2,  2,  3,  3,  4,  5 )
 plot(x,y)

 sizeplot(x,y)

 sizeplot(x,y,pch=2)
```
