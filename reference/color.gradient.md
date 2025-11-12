# Calculate an arbitrary sequence of colors

`color.gradient` is now just a call to `color.scale` with a vector of
equally spaced integers (1:nslices). The function is kept for backward
compatibility.

## Usage

``` r
color.gradient(reds,greens,blues,nslices=50)
```

## Arguments

- reds,greens,blues:

  vectors of the values of the color components as 0 to 1.

- nslices:

  The number of color "slices".

## Note

The function is mainly useful for defining a set of colors to represent
a known number of gradations. Such a set can be used to assign a grade
to a small number of values (e.g. points on a scatterplot - but see
`color.scale` for large numbers) and display a color bar using
`gradient.rect` as a legend.

## Value

A vector of hexadecimal color values as used by `col`.

## Author

Jim Lemon

## See also

[rescale](rescale.md),[approx](https://rdrr.io/r/stats/approxfun.html),[color.scale](color.scale.md)

## Examples

``` r
 # try it with red and blue endpoints and green midpoints.
 color.gradient(c(0,1),c(1,0.6,0.4,0.3,0),c(0.1,0.6))
#>  [1] "#00FF1AFF" "#05F71CFF" "#0AEE1FFF" "#10E621FF" "#15DD24FF" "#1AD527FF"
#>  [7] "#1FCC29FF" "#24C32CFF" "#2ABB2EFF" "#2FB331FF" "#34AA34FF" "#39A236FF"
#> [13] "#3E9939FF" "#44993BFF" "#49943EFF" "#4E9041FF" "#538B43FF" "#588646FF"
#> [19] "#5E8248FF" "#637D4BFF" "#68794EFF" "#6D7450FF" "#726F53FF" "#786B55FF"
#> [25] "#7D6658FF" "#82665BFF" "#87645DFF" "#8D6160FF" "#925F62FF" "#975D65FF"
#> [31] "#9C5A68FF" "#A1586AFF" "#A7566DFF" "#AC536FFF" "#B15172FF" "#B64F75FF"
#> [37] "#BB4D77FF" "#C14D7AFF" "#C6467CFF" "#CB407FFF" "#D03982FF" "#D53384FF"
#> [43] "#DB2D87FF" "#E02689FF" "#E5208CFF" "#EA1A8FFF" "#EF1391FF" "#F50D94FF"
#> [49] "#FA0696FF" "#FF0099FF"
```
