# Draw arrows between points

Displays arrows on an existing plot between specified points.

## Usage

``` r
p2p_arrows(x1,y1,x2,y2,space=0.05,col=par("fg"),...)
```

## Arguments

- x1:

  Starting x positions for the labels.

- y1:

  Starting y positions for the labels.

- x2:

  Ending x positions for the labels.

- y2:

  Ending y positions for the labels.

- space:

  The proportion of the distance between the points to leave as space
  before and after the arrow.

- col:

  Color(s) for the arrows.

- ...:

  Extra arguments passed to `arrows`.

## Details

`p2p_arrows` displays arrows on a plot between one or more pairs of
specified points.

## Value

nil

## Author

Jim Lemon

## See also

[arrows](https://rdrr.io/r/graphics/arrows.html)
