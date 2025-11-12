# Add a straight line to a plot

As `abline`, but has arguments `x1,x2,y1,y2` as in `clip`.

## Usage

``` r
ablineclip(a=NULL,b=NULL,h=NULL,v=NULL,reg=NULL,coef=NULL,untf=FALSE,
  x1=NULL,x2=NULL,y1=NULL,y2=NULL,...)
```

## Arguments

- a:

  Intercept.

- b:

  Slope.

- h:

  the y-value(s) for horizontal line(s).

- v:

  the x-value(s) for vertical line(s).

- reg:

  Fitted lm object.

- coef:

  Coefficients, typically intercept and slope.

- untf:

  How to plot on log coordinates, see `abline`.

- x1,x2,y1,y2:

  Clipping limits, see `clip`.

- ...:

  Further arguments passed to `abline`.

## Details

`ablineclip` sets a new clipping region and then calls `abline`. If any
of the four clipping limits is NULL, the values from `par("usr")` are
substituted. After the call to `abline`, the old clipping region is
restored. In order to make `clip` work, there is a call to `abline` that
draws a line off the plot.

Multiple lines of the same type can be drawn in a single call, but the
clipping region must be the same for each group of lines. Thanks to
Berry Boessenkool for pointing this out.

## Value

None. Adds to the current plot.

## Author

Remko Duursma

## See also

[abline](https://rdrr.io/r/graphics/abline.html),
[clip](https://rdrr.io/r/graphics/clip.html)

## Examples

``` r
 x <- rnorm(100)
 y <- x + rnorm(100)
 lmfit <- lm(y~x)
 plot(x, y, xlim=c(-3.5, 3.5))
 ablineclip(lmfit, x1 = -2, x2 = 2, lty = 2)
 ablineclip(h = 0, x1 = -2,x2 = 2,lty = 3, col = "red")
 ablineclip(v = 0, y1 = -2.5, y2 = 1.5, lty=4, col = "green")
```
