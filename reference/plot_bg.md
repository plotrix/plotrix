# Add a background color to a plot

Displays a colored rectangle over the entire area of a plot

## Usage

``` r
plot_bg(col="lightgray")
```

## Arguments

- col:

  The color of the background

## Details

`plot_bg` is probably only useful when part of the `do.first` argument
in another plot function to add a background color to the plot.

## Value

nil

## Author

Jim Lemon

## Examples

``` r
 barp(1:5,do.first="plot_bg()",col=1:5)
```
