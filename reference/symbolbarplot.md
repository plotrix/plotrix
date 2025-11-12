# barplot filled with symbols

Produces a barplot where each piece of the barplot is filled with the
number of symbols equal to the size of the bar

## Usage

``` r
symbolbarplot(height,width=1,space=NULL,names.arg=NULL,
  legend.text=NULL,beside=FALSE,horiz=FALSE,col=heat.colors(NR),
  border=par("fg"),main=NULL,sub=NULL,xlab=NULL,ylab=NULL,xlim=NULL,
  ylim=NULL,axes=TRUE,axisnames=TRUE,inside=TRUE,plot=TRUE,rel.width=0.8,
  symbol="circles",symbbox=TRUE,debug=FALSE,...)
```

## Arguments

- height:

  numeric vector or matrix of barplot heights

- width:

  width of bars

- space:

  space between bars

- names.arg:

  vector of names

- legend.text:

  vector of legend text

- beside:

  (logical) plot bars beside each other?

- horiz:

  (logical) horizontal barplot?

- col:

  vector of colors

- border:

  plot border?

- main:

  main title

- sub:

  subtitle

- xlab:

  x axis label

- ylab:

  y axis label

- xlim:

  x limits

- ylim:

  y limits

- axes:

  draw axes?

- axisnames:

  label horizontal axis?

- inside:

  draw lines dividing adjacent bars?

- plot:

  produce plot?

- rel.width:

  relative width of symbols

- symbol:

  which symbol to use

- symbbox:

  draw boxes for symbol boxes?

- debug:

  debug output?

- ...:

  further arguments to multsymbolbox

## Value

Nil

## Note

This is a mostly a hack of barplot()

## Author

Ben Bolker

## Examples

``` r
 set.seed(1001)
 bvals <- matrix(rpois(12,20),nrow=3)
 b <- symbolbarplot(bvals)
```
