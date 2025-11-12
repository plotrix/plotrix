# Maximum (or minimum) value cell in a matrix.

Find the indices of the maximum value in a matrix.

## Usage

``` r
find_max_cell(x,max=TRUE)
```

## Arguments

- x:

  a numeric matrix

- max:

  The default is to return the indices of the maximum value(s).
  `max=FALSE` returns those of the minimum.

## Value

A list containing the column (x) and row (y) indices.

## Note

Intended to enable the user to mark cells in `color2D.matplot`. Remember
to subtract 0.5 from both values to center the mark in the cell.

## Author

Jim Lemon
