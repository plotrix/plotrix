# Enter three proportion data - usually soil textures

`get.triprop` allows the user to enter triplets of proportions or
percentages of three components such as sand, silt and clay in soils.

## Usage

``` r
get.triprop(use.percentages=FALSE,cnames=c("1st","2nd","3rd"))
```

## Arguments

- use.percentages:

  Logical - whether to treat the entries as percentages and scale to
  proportions.

- cnames:

  column names for the resulting three column matrix.

## Details

The three proportions of each row must sum to 100 or 1 within 1% or the
function will warn the operator.

## Value

A matrix of the components of one or more observations.

## Author

Jim Lemon

## See also

[triax.plot](triax.plot.md), [soil.texture](soil.texture.md)

## Examples

``` r
 if(dev.interactive()) {
  # get some proportions
  newsp<-get.triprop()
  # show the triangle
  triax.frame(main="Test triax.plot")
  # now plot the observations
  triax.points(newsp)
 }
```
