# Plot with axis direction(s) reversed

Reverses the sense of either or both the `x` and `y` axes.

## Usage

``` r
revaxis(x, y, xrev=FALSE, yrev=TRUE, xside=if (yrev) 3 else 1,
       yside=if (xrev) 4 else 2, xlab=NULL, ylab=NULL, bty=NULL, ...)
```

## Arguments

- x:

  Vector of `x`-coordinates of the data to be plotted.

- y:

  Vector of `y`-coordinates of the data to be plotted.

- xrev:

  Logical scalar; should the sense of the `x`-axis be reversed?

- yrev:

  Logical scalar; should the sense of the `y`-axis be reversed?

- xside:

  The side of the plot on which the `x`-axis labels should go.

- yside:

  The side of the plot on which the `y`-axis labels should go.

- xlab:

  Character string for labelling the `x`-axis.

- ylab:

  Character string for labelling the `y`-axis.

- bty:

  Single letter indicating the type of box to be drawn around the plot.
  See [par](https://rdrr.io/r/graphics/par.html) for the possible
  letters and their meaning.

- ...:

  Other arguments to be passed to plot.

## Value

nil

## Author

Rolf Turner

## See also

[plot](https://rdrr.io/r/graphics/plot.default.html),
[box](https://rdrr.io/r/graphics/box.html),
[par](https://rdrr.io/r/graphics/par.html)

## Examples

``` r
x <- runif(20)
y <- runif(20)
revaxis(x,y,yside=4)
```
