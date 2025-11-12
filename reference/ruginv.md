# Add an Inverse Rug to a Plot

Adds a *rug* representation (1D plot) of the data to the plot, but with
the coloring inverted.

## Usage

``` r
ruginv(x,ticksize=0.03,side=1,lwd=0.5,col=par("fg"),col.ticks="white",
 quiet=getOption("warn") < 0,...)
```

## Arguments

- x:

  A numeric vector.

- ticksize:

  The length of the ticks making up the 'rug'. Positive lengths produce
  inward ticks.

- side:

  On which side of the plot box the rug will appear. Usually 1 (bottom)
  or 3 (top).

- lwd:

  The line width of the ticks.

- col:

  Color of the background of the ticks.

- col.ticks:

  The color of the ticks.

- quiet:

  Logical indicating if there should be a warning about clipped values.

- ...:

  Further arguments passed to
  [polygon](https://rdrr.io/r/graphics/polygon.html) when plotting the
  background for the ticks.

## Author

Peter Solymos

## See also

[rug](https://rdrr.io/r/graphics/rug.html)

## Examples

``` r
 require(stats)
 plot(density(faithful$eruptions,bw=0.15))
 ruginv(faithful$eruptions,ticksize=-0.05)
 ruginv(jitter(faithful$eruptions,amount=0.01),side=3,col="lightblue")
```
