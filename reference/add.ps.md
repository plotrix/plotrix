# add p-values from t-tests

Adds p-values comparing the different cells at each x-axis position with
a reference cell. Uses a syntax similar to `raw.means.plot2`.

## Usage

``` r
add.ps(data, col.id, col.offset, col.x, col.value, fun.aggregate = "mean",
 ref.offset = 1, prefixes,alternative = c("two.sided", "less", "greater"),
 mu = 0, paired = FALSE, var.equal = FALSE, lty = 0, ...)
```

## Arguments

- data:

  A `data.frame`

- col.id:

  `character` vector specifying the id column.

- col.offset:

  `character` vector specifying the offset column.

- col.x:

  `character` vector specifying the x-axis column.

- col.value:

  `character` vector specifying the data column.

- fun.aggregate:

  Function or function name used for aggregating the results. Default is
  `"mean"`.

- ref.offset:

  Scalar `numeric` indicating the reference level to be tested against.
  The default is 1 corresponding to `levels(factor(d[,col.offset]))[1]`.

- prefixes:

  `character` vector of the indices for the p-values. If missing
  corresponds to `levels(factor(d.new[,col.offset]))[-ref.offset]`.

- alternative:

  same as in [t.test](https://rdrr.io/r/stats/t.test.html)

- mu:

  same as in [t.test](https://rdrr.io/r/stats/t.test.html)

- paired:

  same as in [t.test](https://rdrr.io/r/stats/t.test.html)

- var.equal:

  same as in [t.test](https://rdrr.io/r/stats/t.test.html)

- lty:

  line type of axis, Default is 0 (i.e., no line).

- ...:

  further arguments passed to axis.

## Details

This function computes t-tests comparing the values at each x-axis
position for each condition against the reference condition at and adds
the p-values to the axis.

This functions uses the same syntax as
[raw.means.plot2](raw.means.plot.md) and should be used in addition to
it. Note that values are ordered according to the `col.id` so
`paired = TRUE` should be fine.

## Value

axis is plotted.

## Author

Henrik Singmann

## See also

[raw.means.plot](raw.means.plot.md) as the accompanying main functions.

## Examples

``` r
if (FALSE) { # \dontrun{
#The examples uses the OBrienKaiser dataset from car and needs reshape.
# This extends the examples from raw.means.plot
require(reshape)
require(car)
data(OBrienKaiser)
OBKnew <- cbind(factor(1:nrow(OBrienKaiser)), OBrienKaiser)
colnames(OBKnew)[1] <- "id"
OBK.long <- melt(OBKnew)
OBK.long[, c("measurement", "time")] <-
 t(vapply(strsplit(as.character(OBK.long$variable), "\\."),  "[", c("", "")))

# For this example the position at each x-axis are within-subject comparisons!
raw.means.plot2(OBK.long, "id", "measurement", "gender", "value")
 add.ps(OBK.long, "id", "measurement", "gender", "value", paired = TRUE)
 #reference is "fup"

raw.means.plot2(OBK.long, "id", "measurement", "gender", "value")
add.ps(OBK.long, "id", "measurement", "gender", "value", ref.offset = 2,
 paired = TRUE) #reference is "post"

# Use R's standard (i.e., Welch test)
raw.means.plot2(OBK.long, "id", "treatment", "gender", "value")
add.ps(OBK.long, "id", "treatment", "gender", "value",
 prefixes = c("p(control vs. A)", "p(control vs. B)"))

# Use standard t-test
raw.means.plot2(OBK.long, "id", "treatment", "gender", "value")
add.ps(OBK.long, "id", "treatment", "gender", "value", var.equal = TRUE,
 prefixes = c("p(control vs. A)", "p(control vs. B)"))

} # }
```
