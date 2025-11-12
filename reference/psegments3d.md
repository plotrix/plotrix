# Draw segments on a 3D plot

Draw segments on a 3D plot defined by a list of coordinates

## Usage

``` r
psegments3d(x,y=NULL,z=NULL,pmat,...)
```

## Arguments

- x,y,z:

  x, y and z coordinates to plot. `x` may be a list with three
  components.

- pmat:

  matrix to transform coordinates.

- ...:

  Other arguments passed to `segments`.

## Details

Draws segments on a perspective plot.

## Value

nil

## Author

Ben Bolker
