# Display the title of a plot as a colored tab

Display the title of a plot as a colored tab.

## Usage

``` r
tab.title(label,text.col=par("fg"),tab.col=par("bg"),border=par("fg"),
  lwd=par("lwd"),cex=1.5,pad.mult=1.6,radius=0)
```

## Arguments

- label:

  The title for the plot.

- text.col:

  The color for the title text.

- tab.col:

  The color for the tab fill.

- border:

  The color for the tab border.

- lwd:

  The line width for the border.

- cex:

  Character expansion for the title.

- pad.mult:

  How much higher to make the tab relative to the label.

- radius:

  What proportion of the tab corners to round off.

## Value

nil

## Details

`tab.title` displays the plot title in a colored tab. The tab can be
rounded at the upper corners by specifying the proportion of the tab
height to be rounded as a number between 0 and 1. If the tab is too high
to fit on the figure region, a warning will be displayed and the tab
will still be shown.

## Author

Jim Lemon

## See also

[polygon](https://rdrr.io/r/graphics/polygon.html)

## Examples

``` r
 testx<-matrix(cumsum(rnorm(30)^2)+1,nrow=10)
 stackpoly(testx,main="",
  xaxlab=c("One","Two","Three","Four","Five",
  "Six","Seven","Eight","Nine","Ten"),staxx=TRUE)
 tab.title("Three Squiggly Lines",tab.col="yellow",radius=0.5)
```
