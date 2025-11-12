# Arrange N seats in M semicircular rows

Compute seat positions in a semicircular parliament

## Usage

``` r
seats(N, M, r0 = 2.5)
```

## Arguments

- N:

  Total number of seats.

- M:

  Number of semicircular arcs on which to distribute the seats.

- r0:

  Radius of the inner arc in user units.

## Value

A data frame including:

- x:

  The x positions of the seats to be plotted on semi-circular arcs.

- y:

  The y positions of the seats to be plotted on semi-circular arcs.

- r:

  The row numbers for each seat.

- theta:

  The angle of each seat, going from pi to zero radians.

## Author

Duncan Murdoch and Barry Rowlingson

## See also

[election](election.md)
