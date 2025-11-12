# Function to draw a multivari chart

A multivari chart of one quantitative response variable depending on two
to four categorical variables can be drawn.

## Usage

``` r
multivari(var, fac1, fac2, fac3 = NULL, fac4 = NULL, data, sort = FALSE,
 fun = mean, pch = list(15, 16, 17), col = list("black", "blue", "red"),
 col0 = "black", cex = 1, fac.cex = 2, xlab.depth = 3, legend = FALSE,
 main = paste("multivari chart of", var), add = FALSE, ...)
```

## Arguments

- var:

  variable name (character string) or column index of response variable,
  required

- fac1:

  variable name (character string) or column index of first level
  factor, required; precedes `fac2` and `fac3` (if present) in the
  hierarchy (see Details)

- fac2:

  variable name (character string) or column index of second level
  factor, required; follows `fac1` and precedes `fac3` (if present) in
  the hierarchy (see Details)

- fac3:

  variable name (character string) or column index of third level
  factor, optional; if present, `fac3` is the last factor in the
  hierarchy (see Details)

- fac4:

  variable name (character string) or column index of fourth level
  factor, optional; can only be specified if there is also a third level
  factor; if present, this factor is the first in the hierarchy (see
  Details), and separate multivari charts for the first three factors
  are drawn for each level of this factor

- data:

  a data frame, required

- sort:

  logical, specifying whether or not levels are sorted, when converting
  character vectors to factors (a single choice for all factors is
  needed); default: `FALSE`

- fun:

  a function to be used in aggregation; default: `mean`

- pch:

  a list of length 2 or 3, depending on whether or not `fac3` is
  specified; the ith list element can be an individual plotting symbol
  (like the usual `pch` entry) or a vector of plot symbols for each
  level of `fac_i`

- col:

  a list of length 2 or 3, depending on whether or not `fac3` is
  specified; the ith list element can be an individual color or a vector
  of colors for each level of `fac_i`; this color specification is used
  for the plot symbols of `fac_i` levels and for the lines connecting
  the symbols for the next level in the hierarchy

- col0:

  the color for the first line to be drawn

- cex:

  the size of axis annotation text (annotation of the fourth level
  header is 1.5 times this size)

- fac.cex:

  a multiplier for `cex`; plot symbol sizes are `fac.cex*cex`; default:
  2

- xlab.depth:

  labels for the horizontal axis are printed down to this level of the
  hierarchy (default: 3); if the depth is reduced, different plot
  symbols should be used, and a legend should be drawn

- legend:

  logical determining whether or not a legend should be drawn (default:
  FALSE); the function determines wether top right or bottom right
  yields a better position (it is not guaranteed that there is no
  overlab); if this does not work well, one can manually draw a legend
  in the outer margin

- main:

  title, as usual; a default is provided

- add:

  logical; add to an existing plot (which of course has to have suitable
  axis limits)?; default: FALSE; note that horizontal axis labeling will
  always be printed by function multivari, while vertical axis labeling
  will be omitted for `add=TRUE`

- ...:

  further arguments to functions `plot`, `lines`, `points`, `mtext`

## Details

The function is inspired by Minitabs behavior for multivari charts (see
also Bruno Scibilia's blog which is linked in the references). It does
not attempt to visualize individual observations.

A multivari chart mainly serves exploratory purposes. It works
particularly well with balanced data, but can also be used for messy
data. `multivari` can visualize the dependence of a single quantitative
variable on up to four factors (i.e., interactions of order up to four
can be visualized). The display is hierarchical: for factors later in
the hierarchy, conditional means given level combinations of factors
earlier in the hierarchy are displayed. Therefore, the order of the
factors can make a big difference in the display. If there is no natural
order, it may be worthwhile to inspect several orders.

For interactions with two factors only, it is often preferrable to use
function
[`interaction.plot`](https://rdrr.io/r/stats/interaction.plot.html) or
[`raw.means.plot`](raw.means.plot.md).

## Value

a list of (lists of) data frames with summary statistics to be plotted

## References

Scibilia, Bruno (2013). Using Multi-Vari Charts to Analyze Families of
Variations.
<https://blog.minitab.com/en/using-variability-charts-to-analyze-call-center-wait-times>.

## Author

Ulrike Groemping

## See also

See also
[`interaction.plot`](https://rdrr.io/r/stats/interaction.plot.html),
[`raw.means.plot`](raw.means.plot.md)

## Examples

``` r
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--  or do  help(data=index)  for the standard data sets.
if (FALSE) { # \dontrun{
require(car)
multivari("cycles", "len", "load", "amp", data=Wool, 
    col=list("black","red",c("grey70","grey45","grey20")),
    pch=list(15,17,8), legend=TRUE, xlab.depth = 2, lwd=2)
multivari("cycles", "load", "len", "amp", data=Wool, 
    col=list("black",c("red","blue","darkgreen"),
    c("grey70","grey45","grey20")),
    pch=list(15,17,8), legend=TRUE, xlab.depth = 2, lwd=2)
    
## create a fake fourth factor
fakedat <- rbind(cbind(newfac="blabla",Wool),cbind(newfac="albalb",Wool))
## make it character for demonstrating the effect of sort option
fakedat$newfac <- as.character(fakedat$newfac)

## default: sort order in the data is respected (order of unique is used)
multivari("cycles", "load", "len", "amp", "newfac", data=fakedat, 
    col=list("black",c("red","blue","darkgreen"),
    c("grey70","grey45","grey20")),
    pch=list(15,17,8), legend=TRUE, xlab.depth = 2, lwd=2, cex=0.8)
    
## sort=TRUE: levels are sorted (order of sort(unique))
multivari("cycles", "load", "len", "amp", "newfac", data=fakedat, 
    col=list("black",c("red","blue","darkgreen"),
    c("grey70","grey45","grey20")),
    pch=list(15,17,8), legend=TRUE, xlab.depth = 2, lwd=2, cex=0.8,
    sort=TRUE)
} # }
```
