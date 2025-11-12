# Fill a "corner" of a matrix with values

Fills one corner of a matrix with the supplied values, leaving the rest
filled with a default value.

## Usage

``` r
fill.corner(x,nrow,ncol,na.value=NA)
```

## Arguments

- x:

  A vector of values.

- nrow,ncol:

  The number of rows and columns in the matrix to be returned.

- na.value:

  The default value for unfilled cells.

## Details

`fill.corner` creates an nrow by ncol matrix and fills the lower left
corner with the values supplied in `x`. If there are more values in `x`
than cells in the matrix, only the first nrow\*ncol values will be
inserted.

## Value

An nrow by ncol matrix containing the values in `x`.

## Author

Jim Lemon
