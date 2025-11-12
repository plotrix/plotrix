# Triangle plot frame

Display a three axis frame with optional grid.

## Usage

``` r
triax.frame(at=seq(0.1,0.9,by=0.1),axis.labels=NULL,
 tick.labels=NULL,col.axis="black",cex.axis=1,cex.ticks=1,
 align.labels=TRUE,show.grid=FALSE,col.grid="gray",lty.grid=par("lty"),
 cc.axes=FALSE)
```

## Arguments

- at:

  The tick positions on the three axes.

- axis.labels:

  Labels for the three axes in the order bottom, right left. Defaults to
  the column names.

- tick.labels:

  The tick labels for the axes. Defaults to argument `at` (proportions).

- col.axis:

  Color of the triangular axes, ticks and labels.

- cex.axis:

  Character expansion for axis labels.

- cex.ticks:

  Character expansion for the tick labels.

- align.labels:

  Logical - whether to align axis and tick labels with the axes.

- show.grid:

  Whether to display grid lines at the ticks.

- col.grid:

  Color of the grid lines. Defaults to gray.

- lty.grid:

  Type of line for the grid.

- cc.axes:

  Whether to align the axes clockwise or counterclockwise.

## Details

`triax.frame` displays a triangular plot area on which proportions or
percentages may be displayed. An optional grid may also be displayed. If
`cc.axes` is TRUE, both the axes and axis ticks will be in reverse
order.

## Value

nil

## Author

Jim Lemon

## See also

[triax.points](triax.points.md),[triax.abline](triax.abline.md),[triax.fill](triax.fill.md)

## Examples

``` r
 triax.plot(main="DEFAULT")

 triax.plot(main="Clockwise axes",cc.axes=TRUE)
```
