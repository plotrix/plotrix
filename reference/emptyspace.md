# Find an empty space on a plot

Try to find the largest empty rectangle on a plot.

## Usage

``` r
emptyspace(x,y=NULL)
```

## Arguments

- x,y:

  x and y positions of the points on the plot.

## Details

`emptyspace` searches the pairs of points on the plot to find the
largest rectangular space within which none of the points lie. It does
not guarantee that the space will be large enough to fit a legend or
text.

Two alternatives are the `largest.empty` function in the Hmisc package
and the `maxEmptyRect` function. While `maxEmptyRect` will generally
outperform `emptyspace`, `emptyspace` will sometimes find a slightly
smaller, but "squarer" rectangle.

## Value

The `x` and `y` coordinates of the center of the rectangle found.

## Author

Ray Brownrigg

## Examples

``` r
 x<-rnorm(100)
 y<-rnorm(100)
 plot(x,y,main="Find the empty space",xlab="X",ylab="Y")
 es<-emptyspace(x,y)
 # use a transparent background so that any overplotted points are shown
 boxed.labels(es,labels="Here is the\nempty space",bg="transparent")
```
