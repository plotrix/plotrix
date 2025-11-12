# Display a plot with a rectangular section expanded in an adjacent plot

Display one plot on the left half of a device and an expanded section of
that plot on the right half of the device with connecting lines showing
the expansion.

## Usage

``` r
zoomInPlot(x,y=NULL,xlim=NULL,ylim=NULL,rxlim=xlim,rylim=ylim,xend=NA,
  zoomtitle=NULL,titlepos=NA,...)
```

## Arguments

- x,y:

  numeric data vectors. If `y` is not specified, it is set equal to `x`
  and `x` is set to `1:length(y)`.

- xlim,ylim:

  Limits for the initial plot.

- rxlim,rylim:

  Limits for the expanded plot. These must be within the above.

- xend:

  Where to end the segments that indicate the expansion. Defaults to
  just left of the tick labels on the left ordinate.

- zoomtitle:

  The title of the plot, display in the top center.

- titlepos:

  The horizontal position of the title in user units of the zoomed plot.

- ...:

  additional arguments passed to `plot`.

## Details

`zoomInPlot` sets up a two column layout in the current device and calls
`plot` to display a plot in the left column. It then draws a rectangle
corresponding to the `rxlim` and `rylim` arguments and displays a second
plot of that rectangle in the right column. It is currently very simple
and will probably become more flexible in future versions.

It just has. If `rxlim` is set to NA, `locator` will be called and the
user can define the zoomed rectangle by clicking on each corner. This is
a shameless ripoff of a suggestion by Greg Snow on the help list.
Thanks, Greg.

## Value

nil

## Author

Jim Lemon

## See also

[plot](https://rdrr.io/r/graphics/plot.default.html)

## Examples

``` r
 zoomInPlot(rnorm(100),rnorm(100),rxlim=c(-1,1),rylim=c(-1,1),
  zoomtitle="Zoom In Plot",titlepos=-1.5)
```
