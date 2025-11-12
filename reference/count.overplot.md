# Show overlying points as counts

`count.overplot` checks for overlying points defined as points separated
by a maximum of `tol`, a two element numeric vector of the x and y
tolerance. Defaults to 1/2 of the width of a lower case "o" in the x
direction and 1/2 of the height of a lower case "o" in the y direction.

## Usage

``` r
count.overplot(x,y,tol=NULL,col=par("fg"),pch="1",...)
```

## Arguments

- x,y:

  Two numeric data vectors or the first two columns of a matrix or data
  frame. Typically the x/y coordinates of points to be plotted.

- tol:

  The largest distance between points that will be considered to be
  overlying.

- col:

  Color(s) for the points (not the numbers).

- pch:

  Symbol(s) to display.

- ...:

  additional arguments passed to `plot`.

## Value

nil

## Author

Jim Lemon

## See also

[cluster.overplot](cluster.overplot.md),[sizeplot](sizeplot.md)

## Examples

``` r
 xy.mat<-cbind(sample(1:10,200,TRUE),sample(1:10,200,TRUE))
 count.overplot(xy.mat,main="count.overplot",
  xlab="X values",ylab="Y values")
#> Error in strwidth("o"): plot.new has not been called yet
```
