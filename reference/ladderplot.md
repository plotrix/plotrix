# Ladder Plot

Makes a ladder plot, similar to
[parcoord](https://rdrr.io/pkg/MASS/man/parcoord.html) but with more
flexibility and graphical options.

## Usage

``` r
ladderplot(x, ...)
# Default S3 method
ladderplot(x, scale=FALSE, col=1, pch=19, lty=1, 
xlim=c(0.5, ncol(x) + 0.5), ylim=range(x), vertical = TRUE, ordered=FALSE,...)
```

## Arguments

- x:

  A matrix or data frame with at least 2 columns.

- scale:

  Logical, if the original data columns should be scaled to the unit
  (0-1) interval.

- col:

  Color values to use for rows of `x`. If longer than 1, its value is
  recycled.

- pch:

  Point type to use. If longer than 1, its value is recycled.

- lty:

  Line type to use. If longer than 1, its value is recycled.

- xlim, ylim:

  Limits for axes.

- vertical:

  Logical, if the orientation of the ladderplot should be vertical or
  horizontal.

- ordered:

  Logical, if the columns in `x` should be ordered.

- ...:

  Other arguments passed to the function
  [stripchart](https://rdrr.io/r/graphics/stripchart.html).

## Details

The function uses
[stripchart](https://rdrr.io/r/graphics/stripchart.html) to plot 1-D
scatter plots for each column in `x`. Then points are joined by lines
for each rows of `x`.

## Value

Makes a plot as a side effect. Returns `NULL` invisibly.

## Author

Peter Solymos \<solymos@ualberta.ca\>

## See also

[lines](https://rdrr.io/r/graphics/lines.html),
[points](https://rdrr.io/r/graphics/points.html),
[stripchart](https://rdrr.io/r/graphics/stripchart.html)

Almost identical function:
[parcoord](https://rdrr.io/pkg/MASS/man/parcoord.html)

## Examples

``` r
x<-data.frame(A=c(1:10), B=c(2:11)+rnorm(10))
y<-data.frame(x, C=c(1:10)+rnorm(10))
opar <- par(mfrow=c(1,3))
ladderplot(x)
ladderplot(x, col=1:10, vertical=FALSE)
ladderplot(y, col=1:10)

par(opar)

## examples from parcoord
if (FALSE) { # \dontrun{
if (require(MASS)) {
opar <- par(mfrow=c(2,3))
z1 <- state.x77[, c(7, 4, 6, 2, 5, 3)]
parcoord(z1, main="parcoord state.x77")
ladderplot(z1, pch=NA, scale=TRUE, main="ladderplot state.x77 original")
ladderplot(z1, main="ladderplot state.x77 original")
ir <- rbind(iris3[,,1], iris3[,,2], iris3[,,3])
z2 <- log(ir)[, c(3, 4, 2, 1)]
parcoord(z2, col = 1 + (0:149))
ladderplot(z2, scale=TRUE, col = 1 + (0:149),
    main="ladderplot iris original")
ladderplot(z2, col = 1 + (0:149))
par(opar)
}
} # }
```
