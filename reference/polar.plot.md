# Plot values on a circular grid of 0 to 360 degrees

`polar.plot` displays a plot of radial lines, symbols or a polygon
centered at the midpoint of the plot frame on a 0:360 circle. Positions
are interpreted as beginning at the right and moving counterclockwise
unless `start` specifies another starting point or `clockwise` is TRUE.

If `add=TRUE` is passed as one of the additional arguments, the values
will be added to the current plot. If a `radial.lim` argument was passed
on the initial plot, it must be passed again to add values or the values
will be displayed incorrectly.

## Usage

``` r
polar.plot(lengths,polar.pos=NULL,labels,label.pos=NULL,
  start=0,clockwise=FALSE,rp.type="r",loglen=FALSE,explab=FALSE,...)
```

## Arguments

- lengths:

  numeric data vector. Magnitudes will be represented as the radial
  positions of symbols, line ends or polygon vertices.

- polar.pos:

  numeric vector of positions on a 0:360 degree circle. These will be
  converted to radians when passed to `radial.plot`.

- labels:

  text labels to place on the periphery of the circle. This defaults to
  labels every 20 degrees. For no labels, pass an empty string.

- label.pos:

  positions of the peripheral labels in degrees

- start:

  The position for zero degrees on the plot in degrees.

- clockwise:

  Whether to increase angles clockwise rather than the default
  counterclockwise.

- rp.type:

  Whether to plot radial lines, symbols or a polygon.

- loglen:

  Whether to log transform the `length` values. Only base 10 logs are
  available.

- explab:

  Whether to use the default fixed (FALSE) or exponential (TRUE)
  notation for the radial labels.

- ...:

  additional arguments passed to `radial.plot` and then to `plot`.

## Value

A list of the parameters altered by [radial.plot](radial.plot.md).

## Author

Jim Lemon

## See also

[radial.plot](radial.plot.md)

## Examples

``` r
 testlen<-c(rnorm(36)*2+5)
 testpos<-seq(0,350,by=10)
 polar.plot(testlen,testpos,main="Test Polar Plot",lwd=3,line.col=4)

 oldpar<-polar.plot(testlen,testpos,main="Test Clockwise Polar Plot",
  radial.lim=c(0,15),start=90,clockwise=TRUE,lwd=3,line.col=4)

 # reset everything
 par(oldpar)
```
