# Place labels in boxes

Places labels in boxes on an existing plot

## Usage

``` r
placeLabels(x,y=NA,labels,pointer=TRUE,cex=1,labelcol=par("fg"),
 labelbg="white",border=par("fg"),pointercol=par("fg"),
 pch=1,col=1,bg="white",flagcol="red")
```

## Arguments

- x,y:

  x and y position of the centers of the labels. `x` can be an
  [xy.coords](https://rdrr.io/r/grDevices/xy.coords.html) list.

- labels:

  Text strings

- pointer:

  Whether to draw a line segment from the label to the points labeled.

- cex:

  Character expansion. See `text`.

- labelcol:

  The color(s) of the text in the labels.

- labelbg:

  The background color(s) for the labels.

- border:

  The color(s) for the borders around the rectangles.

- pointercol:

  The color(s) of the pointer lines.

- pch:

  The symbol(s) to use when redisplaying the original points (see
  Details).

- col:

  The color(s) of the original points.

- bg:

  The background color(s) of the original points.

- flagcol:

  The color to use for "flagging" each point.

## Details

`placeLabels` steps through the points indexed by `x` and `y`, allowing
the operator to manually place the labels for each point. Each point is
"flagged" by displaying a small colored circle (red by default). When
the label for that point has been placed, the original symbol is
displayed and the next point is flagged.

Each point and label can have different colors and backgrounds.

## Note

This function is handy for one-off plots with a moderate number of
points. It can be very useful for plots with clumps of points.

## Value

nil - adds labels to an existing plot.

## Author

Jim Lemon - thanks to Marna Wagley for the idea.

## See also

[spread.labels](spread.labels.md),
[thigmophobe.labels](thigmophobe.labels.md)

## Examples

``` r
 # won't check because of the call to locator
 if (FALSE) { # \dontrun{
  x<-rnorm(10)
  y<-rnorm(10)
  plot(x,y)
  placeLabels(x,y,LETTERS[1:10],flagcol="purple")
 } # }
```
