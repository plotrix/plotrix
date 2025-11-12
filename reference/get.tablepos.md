# Get the position for a legend or table

Gets the x and y positions and justification for a legend or table in
user units from the string descriptors like "top".

## Usage

``` r
get.tablepos(x)
```

## Arguments

- x:

  A valid position descriptor like "top".

## Details

`get.tablepos` checks for one of the nine valid position descriptors:

topleft, top, topright, left, center, right, bottomleft, bottom and
bottomright.

If none of these descriptors are found, it will return the center
position and justification.

## Value

A list containing:

- x:

  x position

- y:

  y position

- xjust:

  x (horizontal) justification

- yjust:

  y (vertical) justification

## Author

Jim Lemon

## See also

[addtable2plot](addtable2plot.md), [legendg](legendg.md)
