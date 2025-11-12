# Draw boxes filled with symbols

Draw boxes on the current figure filled with symbols representing
individual counts.

## Usage

``` r
multsymbolbox(x1,y1,x2,y2,tot,relw=0.8,fg=par("fg"),bg=par("bg"),
  box=TRUE,debug=FALSE,...)
```

## Arguments

- x1:

  numeric vector: left sides of boxes

- y1:

  numeric vector: bottom sides of boxes

- x2:

  numeric vector: right sides of boxes

- y2:

  numeric vector: top sides of boxes

- tot:

  numeric vector: total numbers of symbols to put in each box

- relw:

  relative width (relative to height) of symbols

n

- fg:

  foreground color(s)

- bg:

  background color(s)

- box:

  (logical) draw box borders?

- debug:

  debug output?

- ...:

  additional arguments to polygon() for drawing boxes

## Value

none

## Author

Ben Bolker

## Examples

``` r
 plot(1:10,1:10,type="n")
 multsymbolbox(c(2,4),5,c(4,5),8,tot=c(10,8))
```
