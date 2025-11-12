# Display an axis with values having a multiplier

An axis is displayed on an existing plot where the tick values are
divided by a multiplier and the multiplier is displayed next to the
axis.

## Usage

``` r
axis.mult(side=1,at=NULL,labels,mult=1,mult.label,mult.line,
  mult.labelpos=NULL,...)
```

## Arguments

- side:

  which side to display

- at:

  where to place the tick marks - defaults to `axTicks()`

- labels:

  tick labels - defaults to at/mult

- mult:

  the multiplier factor

- mult.label:

  the label to show the multiplier - defaults to "x mult"

- mult.line:

  the margin line upon which to show the multiplier

- mult.labelpos:

  where to place `mult.label` - defaults to centered and outside the
  axis tick labels

- ...:

  additional arguments passed to `axis`.

## Value

nil

## Details

`axis.mult` automates the process of displaying an axis with a
multiplier applied to the tick values. By default it will divide the
default axis tick labels by `mult` and place `mult.label` where `xlab`
or `ylab` would normally appear. Thus the plot call should set the
relevant label to an empty string in such cases. It is simplest to call
`plot` with `axes=FALSE` and then display the box and any standard axes
before calling `axis.mult`.

## Note

While `axis.mult` will try to display an axis on any side, the top and
right margins will require adjustment using `par` for `axis.mult` to
display properly.

## Author

Jim Lemon

## See also

[axis](https://rdrr.io/r/graphics/axis.html),
[mtext](https://rdrr.io/r/graphics/mtext.html)

## Examples

``` r
 plot(1:10 * 0.001, 1:10 * 100,axes = FALSE, xlab = "", ylab = "",
  main = "Axis multipliers")
 box()
 axis.mult(1, mult = 0.001)
 axis.mult(2, mult = 100)
```
