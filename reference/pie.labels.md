# Place labels on a pie chart

Places labels on a pie chart

## Usage

``` r
pie.labels(x=0,y=0,angles,labels,radius=1.05,bg="white",border=TRUE,
  minangle=NA,boxed=FALSE,explode=0,...)
```

## Arguments

- x,y:

  x and y position of the center of the pie chart

- angles:

  A numeric vector representing angles in radians. This is the return
  value of `floating.pie`.

- labels:

  Text strings to label each sector.

- radius:

  The radius at which to place the labels in user units. The default is
  1.05.

- bg:

  The color of the rectangles on which the labels are displayed.

- border:

  Whether to draw borders around the rectangles.

- minangle:

  Minimum angle between labels.

- boxed:

  Whether to use `text` or `boxed.labels` to display the labels.

- explode:

  How much the pie chart has been "exploded".

- ...:

  Arguments passed to `text` or `boxed.labels`.

## Value

nil

## Details

Labels may be placed within the pie (radius less than the pie radius),
on the edge or outside as in the examples below. If within the pie, it
is probably best to use `boxed=TRUE`.

If some labels overlap, passing a value in radians for `minangle` may be
used to spread them out.

## Note

Remember that `x` and `y` specify the center of the pie chart and that
the label positions are specified by angles and radii from that center.

## Author

Jim Lemon

## See also

[floating.pie](floating.pie.md), [boxed.labels](boxed.labels.md),
[spreadout](spreadout.md)

## Examples

``` r
 pieval<-c(2,1,3,94)
 plot(0,xlim=c(1.5,5),ylim=c(1,5),type="n",axes=FALSE,xlab="",ylab="")
 box()
 bisect.angles<-floating.pie(3,3,pieval,explode=c(0.1,0.2,0.3,0))
 pie.labels(3,3,bisect.angles,c("two","one","three","ninety\nfour"),
  minangle=0.2,,explode=c(0.1,0.2,0.3,0))
```
