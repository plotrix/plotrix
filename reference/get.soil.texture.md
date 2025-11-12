# Enter soil texture data

`get.soil.texture` calls `get.triprop` to allow the user to enter soil
textures as the proportions or percentages of three components, sand,
silt and clay.

## Usage

``` r
get.soil.texture(use.percentages=FALSE,cnames=c("sand","silt","clay"))
```

## Arguments

- use.percentages:

  Logical - whether to treat the entries as percentages and scale to
  proportions.

- cnames:

  column names for the resulting three column matrix.

## Value

A matrix of the components of one or more soil samples.

## Author

Sander Oom and Jim Lemon

## See also

[soil.texture](soil.texture.md),[get.triprop](get.triprop.md)

## Examples

``` r
 if(dev.interactive()) {
  newsp<-get.soil.texture()
  # show the soil triangle
  soil.texture()
  # now plot the observations
  show.soil.texture(newsp)
 }
```
