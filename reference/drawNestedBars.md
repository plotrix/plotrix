# Display nested bars

Displays the nested bars for barNest.

## Usage

``` r
drawNestedBars(x,start,end,shrink=0.1,errbars=FALSE,intervals=TRUE,col=NA,
 labelcex=1,lineht=NULL,showall=TRUE,Nwidths=FALSE,barlabels=NULL,
 showlabels=TRUE,arrow.cap=NA)
```

## Arguments

- x:

  One level of the breakdown produced by `brkdnNest`.

- start,end:

  The left and right x coordinates for the bar or group of bars to be
  displayed.

- shrink:

  The proportion to shrink the width of the bars at each level.

- errbars:

  Whether to display error bars on the bars.

- intervals:

  Whether to use offsets or absolute values when displaying measures of
  dispersion.

- col:

  The colors to use to fill the bars. See Details.

- labelcex:

  Character size for the group labels.

- lineht:

  The height of a margin line in user units.

- showall:

  Whether to display the bars at any levels above the last.

- Nwidths:

  Whether to scale the widths of the bars to the number of observations.

- barlabels:

  Optional labels to display below the bars.

- showlabels:

  Whether to display the labels below the bars.

- arrow.cap:

  The width of the "cap" on error bars in user units, defaulting to 0.01
  of the width of the plot.

## Value

nil

## Details

`drawNestedBars` displays the bars for the nested breakdown performed by
`brkdnNest`. It starts at the top of the list and calls itself for each
level of the breakdown. It is unlikely to be useful for anything else.

The combination of `showlabels=TRUE` and `showall=FALSE` allows the
display of all of the labels below the plot with only the last set of
bars being displayed. To have a set of labels not displayed, pass
explicit `barlabels` and have zero length labels for the level that is
not to have labels.

## Author

Jim Lemon and Ofir Levy

## See also

[brkdnNest](brkdnNest.md), drawNestedBars
