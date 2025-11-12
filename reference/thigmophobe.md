# Find the direction away from the closest point

Find the direction away from the closest point

## Usage

``` r
thigmophobe(x,y=NULL,names=seq_along(z),xlog=par("xlog"),ylog=par("ylog"),
  usr=par("usr"),pin=par("pin"),eps=.Machine$double.eps,pi=base::pi)
```

## Arguments

- x,y:

  Numeric data vectors. Typically the x/y coordinates of plotted points.
  If arrays are passed, they will be silently coerced to numeric
  vectors.

- names:

  Names for the vector of directions.

- xlog,ylog:

  Flags for logarithmic axes. See Note.

- usr:

  The extent of the plot in user units.

- pin:

  Extent of the plot in inches.

- eps:

  smallest number that can be represented on the system.

- pi:

  value of pi.

## Details

`thigmophobe` returns the direction (as 1\|2\|3\|4 - see pos= in `text`)
away from the nearest point to each of the points described by `x` and
`y`.

## Note

`thigmophobe` is typically used to get the offsets to automatically
place labels on a scatterplot or similar using `thigmophobe.labels` to
avoid overlapping labels. The name means "one who fears being touched".

The `plot.span`, `xlog` and `ylog` arguments were added to allow
`thigmophobe` to be used outside of base graphics.

## Value

A vector of directions away from the point nearest to each point.

## Author

Bill Venables

## See also

[thigmophobe.labels](thigmophobe.labels.md)

## Examples

``` r
 x<-rnorm(10)
 y<-rnorm(10)
 thigmophobe(x,y)
#>  1  2  3  4  5  6  7  8  9 10 
#>  1  4  2  4  2  4  3  2  2  4 
```
