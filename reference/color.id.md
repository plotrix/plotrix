# Identify closest match to a color

Given a color specified as a hex string, find the closest match in the
table of known (named) colors

## Usage

``` r
color.id(col)
```

## Arguments

- col:

  a color specified as a hex string

## Details

finds the color with the minimum squared distance in RGB space

## Value

the name of the closest match

## Author

Ben Bolker

## See also

[col2rgb](https://rdrr.io/r/grDevices/col2rgb.html),[colors](https://rdrr.io/r/grDevices/colors.html)

## Examples

``` r
 color.id("#cc00cc")
#> [1] "magenta3"
```
