# Get coordinates in the figure region in user units.

Calculates the coordinates of a proportional point of the figure region
in user units.

## Usage

``` r
getFigCtr(pos=c(0.5,0.5))
```

## Arguments

- pos:

  The proportion of the figure region to find (see Details).

## Details

`getFigCtr` reads parameters about the current plot and calculates the
vertical and horizontal centers of the figure region by default. This is
typically useful for placing a centered title on plots where the left
and right margins are very different.

By changing `pos`, any proportional points of the figure region can be
returned. For example, `pos=c(0,0)` will return the left and bottom
coordinates of the figure region.

## Value

A two element vector containing the coordinates of the center of the
figure region in user units.

## Author

Jim Lemon (thanks to Karl Brand for the adjustable coordinates)
