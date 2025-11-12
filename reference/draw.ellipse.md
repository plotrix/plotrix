# Draw ellipse

Draws ellipses on an existing plot.

## Usage

``` r
draw.ellipse(x, y, a = 1, b = 1, angle = 0, segment = NULL, 
arc.only = TRUE, deg = TRUE, nv = 100, border = NULL, 
col = NA, lty = 1, lwd = 1, ...)
```

## Arguments

- x:

  A vector or a matrix (if `y` is missing).

- y:

  A vector, can be missing.

- a,b:

  Vectors, radii of the ellypses along the two axes in user units.

- angle:

  Angle of rotation in degrees (if `deg=TRUE`) or in radians (if
  `deg=FALSE`).

- segment:

  Start and endpoints of arc in degrees (if `deg=TRUE`) or in radians
  (if `deg=FALSE`).

- arc.only:

  Logical, if `segmen` the full ellipse is not drawn, radii from the
  ends of the arc are drawn to form a sector (see Examples).

- deg:

  Logical, if angles are given in degrees (`TRUE`) or radians.

- nv:

  Number of vertices to draw the ellipses.

- border:

  Color to use for drawing the circumference.

- col:

  Color to use for filling the circle.

- lty:

  Line type for the circumference.

- lwd:

  Line width for the circumference.

- ...:

  Additional arguments passed to
  [`polygon`](https://rdrr.io/r/graphics/polygon.html).

## Value

Draw ellipses as a side effect.

## Author

Peter Solymos \<solymos@ualberta.ca\>

## See also

[polygon](https://rdrr.io/r/graphics/polygon.html)

## Examples

``` r
plot(c(0,10), c(0,10), type="n", main="test draw.ellipse")
draw.ellipse(c(3,7), c(8,8), c(0.5,1), c(1,0.5), col=c(2,4),
 angle=c(45,0), segment=rbind(c(0,45),c(45,360)))
draw.ellipse(c(3,7), c(6,6), c(0.5,1), c(1,0.5), col=c(2,4),
 angle=c(45,0), segment=rbind(c(0,45),c(45,360)), arc.only=FALSE)
draw.ellipse(c(3,7), c(4,4), c(0.5,1), c(1,0.5), border=c(2,4),
 angle=c(45,0), segment=rbind(c(0,45),c(45,360)), arc.only=FALSE)
draw.ellipse(c(3,7), c(2,2), c(0.5,1), c(1,0.5), border=1,
 angle=c(45,0), lty=3)
draw.ellipse(c(3,7), c(2,2), c(0.5,1), c(1,0.5), border=c(5,3),
 angle=c(45,0), nv=c(3,4), lty=2, lwd=2)
```
