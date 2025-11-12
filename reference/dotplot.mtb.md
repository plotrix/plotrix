# Minitab style dotplots.

Create a dotplot of a data vector in the sense of "dotplot" as used in
the Minitab\\\mbox{\copyright}\\ package.

## Usage

``` r
dotplot.mtb(x, xlim = NULL, main = NULL, xlab = NULL, ylab = NULL,
            pch = 19, hist = FALSE, yaxis = FALSE, mtbstyle=TRUE)
```

## Arguments

- x:

  A numeric vector.

- xlim:

  The x limits of the plot.

- main:

  A title for the plot; defaults to blank.

- xlab:

  A label for the x axis; defaults to blank.

- ylab:

  A label for the y axis; defaults to blank.

- pch:

  The plotting symbol for the dots in the plot; defaults to a solid
  disc.

- hist:

  Logical scalar; should the plot be done "histogram" style, i.e. using
  vertical lines rather than stacks of dots?

- yaxis:

  Logical scalar; should a y-axis be produced?

- mtbstyle:

  Logical scalar; should the dotplot be done in the "Minitab" style?
  I.e. should the zero level be at the vertical midway point?

## Details

The result of `hist=TRUE` looks less ugly than stacks of dots for very
large data sets.

## Value

Nothing. A plot is produced as a side effect.

## Author

Barry Rowlingson <B.Rowlingson@lancaster.ac.uk> and Rolf Turner
<r.turner@auckland.ac.nz> <http://www.stat.auckland.ac.nz/~rolf>

## Warnings

This function does something toadally different from the `dotplot()`
(now [`dotchart()`](https://rdrr.io/r/graphics/dotchart.html)) function
in the graphics package.

The labelling of the `y`-axis is device dependent.

## Examples

``` r
if (FALSE) { # \dontrun{
set.seed(42)
x <- rpois(100,10)
dotplot.mtb(x,main="No y-axis.")
dotplot.mtb(x,yaxis=TRUE,main="With y-axis displayed.")
dotplot.mtb(x,hist=TRUE,main="An \"h\" style plot.")
dotplot.mtb(x,xlim=c(4,16),main="With the x-axis limited.")
dotplot.mtb(x,yaxis=TRUE,mtbstyle=FALSE,main="Non-Minitab style.")
dotplot.mtb(x,yaxis=TRUE,xlab="x",ylab="count",
            main="With x and y axis labels.")
} # }
```
