# Display distributions as dendrites

Display the distributions of one or more sets of points as branching
(dendritic) clusters.

## Usage

``` r
dendroPlot(x,breaks=list(10,10,10),pch=1,col=par("fg"),cex=1,nudge=NA,
  setlabels=NA,...)
```

## Arguments

- x:

  A list or data frame of numeric or factor or character columns.

- breaks:

  A list of cutpoints to transform numeric values into factors (see
  [cut](https://rdrr.io/r/base/cut.html)). Must be at least one number
  \>= 2.

- pch:

  Symbol(s) to use in plotting the values.

- col:

  Color(s) for the symbols.

- cex:

  Size of the symbol(s) to use in plotting.

- nudge:

  The amount to set each consecutive value in a category away from the
  center of the dendrite.

- setlabels:

  Labels to place along the abcissa to identify the sets.

- ...:

  Other arguments passed to plot.

## Details

`dendroPlot` displays the distributions of categorical values as stacks
of "branches". The lengths of the branches show the number of values in
each category, rather like the opposed bars in a pyramid plot, except
that there is no separation of groups. The distribution of numeric
values can also be displayed by passing a set of breakpoints to
categorize the values. The breakpoints will usually be equidistant, but
unevenly spaced breakpoints can be passed. If an element of `x` is
numeric, the values of the corresponding `x` element will be used to
place the points, but the branches will be defined as the categories
formed by applying the breaks to those numeric values.

Note that in the first example, the breakpoints for the first and third
elements are used to define the ten branches for each. The second
element of `x` is already categorical, so the breakpoints are ignored.
When comparing distributions with very different ranges it may be
necessary to adjust the breakpoints to get a satisfactory result.

Each successive point in a category is `nudge`d away from the center of
the dendrite. If `nudge` has more than one value, the points will be
nudged up and down for categorical variables to enable closer packing.
The second value of `nudge` is ignored for numeric variables. The aspect
ratio of the plot, the character expansion and the nudging will have to
be adjusted to give the best point spacing for most dendroPlots.

## Note

The `ehplot` function is a much more versatile instantiation of this
type of plot. `dendroPlot` has been retained as there are currently a
few differences that some users may find valuable. However, it is not
impossible that `dendroPlot` will disappear in the future. Another very
useful version of this type of plot is `beeswarm` in the beeswarm
package.

## Value

nil

## Author

Jim Lemon

## See also

[ehplot](ehplot.md)

## Examples

``` r
 x<-list(runif(90,1,3),factor(sample(LETTERS[1:10],100,TRUE)),rnorm(80,mean=5))
 dendroPlot(x,xlab="Groups",ylab="Value of x",main="Test dendroPlot I")

 # now apply a nudge factor and different breaks
 dendroPlot(x,breaks=list(8,10,10),nudge=c(0.05,0.1),
  xlab="Groups",ylab="Value of x",main="Test dendroPlot II")
```
