# Display a radial grid

`radial.grid` displays a radial grid for the `radial.plot` and
`radial.pie` functions.

## Usage

``` r
radial.grid(labels=NA,label.pos=NULL,radlab=FALSE,radial.lim=NULL,
  start=0,clockwise=FALSE,label.prop=1.1,grid.pos=seq(0.25,1,0.25),
  rad.col="gray",grid.col="gray",grid.bg="transparent",show.radial.grid=TRUE,
  start.plot=FALSE)
```

## Arguments

- labels:

  The labels to display around the circumference of the grid.

- label.pos:

  Radial positions for the labels.

- radlab:

  Whether to rotate the labels to a radial orientation.

- radial.lim:

  Optional radial limits for the circular plot. If specified, these must
  be the same as the radial limits of the original plot.

- start:

  The zero position on the plot in the units of `label.pos`.

- clockwise:

  Whether to increase angles clockwise rather than the default
  counterclockwise.

- label.prop:

  Proportion of `radial.lim` to place the labels.

- grid.pos:

  Radial positions for the circular grid lines.

- rad.col:

  Color for the radial grid lines.

- grid.col:

  Color for the circumferential grid lines.

- grid.bg:

  Background color for the radial grid.

- show.radial.grid:

  Whether to display the radial lines on the grid.

- start.plot:

  If TRUE, sets up a blank radial grid.

## Value

nil

## Author

Jim Lemon
