# Display text on a 3D plot

Display text on a 3D plot defined by a list of coordinates

## Usage

``` r
ptext3d(x,y=NULL,z=NULL,texts,pmat,...)
```

## Arguments

- x,y,z:

  x, y and z coordinates to plot. `x` may be a list with three
  components.

- pmat:

  matrix to transform coordinates.

- texts:

  text to display.

- ...:

  Other arguments passed to `segments`.

## Details

Draws text on a perspective plot.

## Value

nil

## Author

Ben Bolker
