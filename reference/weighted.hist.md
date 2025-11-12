# Display a weighted histogram

Calculate the counts of the weighted values in specified bins and
optionally display either a frequency or density histogram.

## Usage

``` r
weighted.hist(x,w,breaks="Sturges",col=NULL,plot=TRUE,
 freq=TRUE,ylim=NA,ylab=NULL,xaxis=TRUE,...)
```

## Arguments

- x:

  A vector of numeric values

- w:

  A vector of weights at least as long as x.

- breaks:

  The endpoints of the ranges into which to count the weighted values.

- col:

  An optional vector of colors for the bars of the histogram.

- plot:

  Whether to plot a histogram.

- freq:

  Whether to plot counts or densities.

- ylim:

  The limits of the plot ordinate.

- ylab:

  Label for the ordinate.

- xaxis:

  Whether to display an X axis.

- ...:

  additional arguments passed to `barplot`.

## Details

`weighted.hist` calculates the weighted counts of values falling into
the ranges specified by `breaks`. Instead of counting each value as 1,
it counts the corresponding value in `w` (the weight).

`breaks` may be specified by a monotonically increasing vector of
numbers that are interpreted as the endpoints of the ranges, a single
number representing the number of ranges desired or the name of the
function to calculate the ranges (see
[hist](https://rdrr.io/r/graphics/hist.html)). If a vector of numbers is
passed that does not include all values in `x`, the user is warned.

## Value

A list containing:

breaks - The endpoints of the intervals

counts - The weighted counts

density - The weighted counts divided by their sum.

mids - The midpoints of the intervals and the bars displayed.

xname - the name of `x`.

## Author

Jim Lemon and Hadley Wickham - thanks to Ben Graf for asking for a
custom x axis option and Martin Maechler for fixing the barplot problem

## See also

[hist](https://rdrr.io/r/graphics/hist.html)

## Examples

``` r
 testx<-sample(1:10,300,TRUE)
 testw<-seq(1,4,by=0.01)
 weighted.hist(testx,testw,breaks=1:10,main="Test weighted histogram")
```
