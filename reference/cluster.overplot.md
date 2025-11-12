# Shift overlying points into clusters

`cluster.overplot` checks for overlying points in the x and y
coordinates passed. Those points that are overlying are moved to form a
small cluster of up to nine points. For large numbers of overlying
points, see [count.overplot](count.overplot.md) or
[sizeplot](sizeplot.md). If you are unsure of the number of overplots in
your data, run `count.overplot` first to see if there are any potential
clusters larger than nine.

## Usage

``` r
cluster.overplot(x,y,away=NULL,tol=NULL,...)
```

## Arguments

- x,y:

  Numeric data vectors or the first two columns of a matrix or data
  frame. Typically the x/y coordinates of points to be plotted.

- away:

  How far to move overlying points in user units. Defaults to the width
  of a lower case "o" in the x direction and 5/8 of the height of a
  lower case "o" in the y direction. Must have both values.

- tol:

  The largest distance between points that will be considered to be
  overlying. Defaults to 1/2 of the width of a lower case "o" in the x
  direction and 1/2 of the height of a lower case "o" in the y
  direction.

- ...:

  additional arguments returned as they are passed.

## Value

A list with two components. For unique x-y pairs the elements will be
the same as in the original. For overlying points up to eight additional
points will be generated that will create a cluster of points instead of
one.

## Author

Jim Lemon - thanks to Markus Elze for the test for a current graphics
device

## See also

[count.overplot](count.overplot.md),[sizeplot](sizeplot.md)

## Examples

``` r
 xy.mat<-cbind(sample(1:10,200,TRUE),sample(1:10,200,TRUE))
 clusteredpoints<-
  cluster.overplot(xy.mat,col=rep(c("red","green"),each=100),
  away=rep(0.2,2))
#> Error in strwidth("o"): plot.new has not been called yet
 plot(clusteredpoints,col=clusteredpoints$col,
  main="Cluster overplot test")
#> Error: object 'clusteredpoints' not found
```
