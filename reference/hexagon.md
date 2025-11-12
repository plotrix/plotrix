# Draw a hexagon

Draws a hexagon on the current graphic device

## Usage

``` r
hexagon(x,y,unitcell=1,col=NA,border="black")
```

## Arguments

- x,y:

  x and y position of the bottom left corner of the square that would
  pack into the same space as the hexagon.

- unitcell:

  The dimension of the side of the abovementioned square.

- col:

  The color to fill the hexagon - default is no fill.

- border:

  The color of the perimeter of the hexagon.

## Note

Draws a hexagon with the same center as a square that would pack into
the same dimensions as the hexagon. That is, given a grid of squares
with alternate rows shifted one half the length of the sides, the
hexagons drawn would be close packed. Its use in the plotrix package is
to provide an alternative unit cell for the `color2D.matplot` function.

## Value

nil

## Author

Jim Lemon

## See also

[color2D.matplot](color2D.matplot.md)
