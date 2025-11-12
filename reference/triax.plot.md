# Triangle plot

Display a triangle plot with optional grid.

## Usage

``` r
triax.plot(x=NULL,main="",at=seq(0.1,0.9,by=0.1),
 axis.labels=NULL,tick.labels=NULL,col.axis="black",cex.axis=1,
 cex.ticks=1,
 align.labels=TRUE,show.grid=FALSE,col.grid="gray",lty.grid=par("lty"),
 cc.axes=FALSE,show.legend=FALSE,label.points=FALSE,point.labels=NULL,
 col.symbols="black",pch=par("pch"),mar=c(5,2,4,2),no.add=TRUE,...)
```

## Arguments

- x:

  Matrix where each row is three proportions or percentages that must
  sum to 1 or 100 respectively.

- main:

  The title of the triangle plot. Defaults to nothing.

- at:

  The tick positions on the three axes.

- axis.labels:

  Labels for the three axes in the order left, right, bottom. Defaults
  to the column names.

- tick.labels:

  The tick labels for the three axes as a list with three components l,
  r and b (left, right and bottom). Defaults to argument `at`
  (proportions).

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

  Whether axes and axis ticks should be clockwise or counterclockwise.

- show.legend:

  Logical - whether to display a legend.

- label.points:

  Logical - whether to call `thigmophobe.labels` to label the points.

- point.labels:

  Optional labels for the points and/or legend.

- col.symbols:

  Color of the symbols representing each value.

- pch:

  Symbols to use in plotting values.

- mar:

  Margins for the triangle plot.

- no.add:

  Whether to restore the previous plotting parameters (`TRUE`) or leave
  them, allowing more points to be added.

- ...:

  Additional arguments passed to `points`.

## Details

`triax.plot` displays a triangular plot area on which proportions or
percentages are displayed. A grid or legend may also be displayed.

## Note

A three axis plot can only properly display one or more sets of three
proportions that each sum to 1 (or percentages that sum to 100). Other
values may be scaled to proportions (or percentages), but unless each
set of three sums to 1 (or 100), they will not plot properly and
`triax.points` will complain appropriately. Note also that `triax.plot`
will only display properly in a square plot, which is forced by
`par(pty="s")`.

In case the user does want to plot values with different sums, the axis
tick labels can be set to different ranges to accomodate this.
`triax.points` will still complain, but it will plot the values.

If planning to add points with `triax.points` call `triax.plot` with
`no.add=FALSE` and restore plotting parameters after the points are
added.

## Value

A list containing `xypos` (the `x,y` positions plotted) and `oldpar`
(the plotting parameters at the time `triax.plot` was called).

## Author

Jim Lemon - thanks to Ben Daughtry for the info on counterclockwise
axes.

## See also

[triax.points](triax.points.md), [triax.abline](triax.abline.md),
[thigmophobe.labels](thigmophobe.labels.md)

## Examples

``` r
 data(soils)
 triax.plot(soils[1:10,],main="DEFAULT")

 triax.plot(soils[1:10,],main="PERCENTAGES (Counterclockwise axes)",
  tick.labels=list(l=seq(10,90,by=10),r=seq(10,90,by=10),b=seq(10,90,by=10)),
  pch=3,cc.axes=TRUE)

 triax.return<-triax.plot(soils[1:6,],main="GRID AND LEGEND",
  show.grid=TRUE,show.legend=TRUE,col.symbols=1:6,pch=4)

 # triax.plot changes a few parameters
 par(triax.return$oldpar)
```
