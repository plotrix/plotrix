# Build a vector of color values

`smoothColors` calculates a sequence of colors. If two color names in
the arguments are separated by a number, that number of interpolated
colors will be inserted between the two color endpoints. Any number of
color names and integers may be passed, but the last argument must be a
color name. If more than one integer appears between two color names,
only the first will be used in the interpolation and the others will be
ignored.

## Usage

``` r
smoothColors(...,alpha=NA)
```

## Arguments

- ...:

  an arbitrary sequence of color names and integers beginning and ending
  with a color name.

- alpha:

  optional `alpha` (transparency) value.

## Value

A vector of hexadecimal color values as used by `col`.

## Note

For more R functions that transform numeric values into colors or
produce colors that can be used to represent values, see the
colourschemes package.

## Author

Barry Rowlingson

## See also

[color.gradient](color.gradient.md),[rgb](https://rdrr.io/r/grDevices/rgb.html)

## Examples

``` r
 plot(1:10,main="Test opaque colors",type="n",axes=FALSE)
 box()
 rect(1:7,1:7,3:9,3:9,col=smoothColors("red",2,"green",2,"blue"))
```
