# Find an empty space on a plot

Try to find the largest empty rectangle on a plot.

## Usage

``` r
maxEmptyRect(ax,ay,x,y)
```

## Arguments

- ax,ay:

  The rectangle within which all of the points are contained. Usually
  the limits of a plot.

- x,y:

  x and y positions of the points.

## Details

`maxEmptyRect` searches the pairs of points on the plot to find the
largest rectangular space within which none of the points lie. It does
not guarantee that the space will be large enough to fit a legend or
text.

Two alternatives are the `largest.empty` function in the Hmisc package
and the `emptyspace` function. `maxEmptyRect` appears to outperform
`emptyspace`, particularly in running time. However, `emptyspace` will
sometimes find a "squarer" rectangle when `maxEmptyRect` finds a
slightly larger narrow rectangle.

## Value

A list containing the area of the rectangle and the coordinates of the
lower left and upper right corners (as used in `rect`) of the rectangle
found.

## Author

Hans Borchers

## References

A. Naamad, D. T. Lee, and W.-L. Hsu (1984). On the Maximum Empty
Rectangle Problem. Discrete Applied Mathematics, 8: 267-277.

## Examples

``` r
 x<-runif(100)
 y<-runif(100)
 plot(x,y,main="Find the maximum empty rectangle",xlab="X",ylab="Y")
 mer<-maxEmptyRect(c(0,1),c(0,1),x,y)
 rect(mer$rect[1],mer$rect[2],mer$rect[3],mer$rect[4],border="red")
```
