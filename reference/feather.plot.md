# Display vectors along a horizontal reference line

Displays vectors along a line usually representing time or position.

## Usage

``` r
feather.plot(r,theta,xpos,yref=0,use.arrows=TRUE,
 col.refline="lightgray",fp.type="s",main="",xlab="",ylab="",
 xlabels=NULL,...)
```

## Arguments

- r:

  radii of vectors

- theta:

  direction of vectors in radians

- xpos:

  where to start each vector along the reference line

- yref:

  vertical position to place the reference line

- use.arrows:

  whether to put arrow heads on the ends of the vectors

- col.refline:

  the color of the reference line

- fp.type:

  whether to use "standard" coordinates (begin at the right and move
  counterclockwise) or "meteorological" coordinates (begin at the top
  and move clockwise) when interpreting the values of `theta`

- main:

  the title of the plot

- xlab:

  the label for the reference line

- ylab:

  the label for the vertical axis

- xlabels:

  optional labels for the reference line

- ...:

  additional arguments passed to `arrows` or `segments`

## Details

This function places vectors of length `r` and angle `theta` along a
reference line that may represent time or position or some other value.
The user is responsible for spacing the vectors so that they do not
overlap if this is desired.

Feather plots are typically wider than high. The user will probably want
to specify a graphics device that doesn't leave lots of blank space
above and below the plot.

## Value

nil

## Author

Jim Lemon, Eduardo Klein

## See also

[spread.labels](spread.labels.md)

## Examples

``` r
 dev.new(width=8,height=3)
 r<-0.6+rnorm(24)/5
 theta<-c(seq(15*pi/16,pi/16,length.out=12),
  seq(17*pi/16,31*pi/16,length.out=12))
 feather.plot(r,theta,xlabels=1:24,
  main="Standard Coordinates",xlab="Time",ylab="Value")
 # rearrange theta for meteorological coordinates
 feather.plot(r,c(theta[19:24],rev(theta[7:18]),theta[1:6]),xlabels=1:24,fp.type="m",
  main="Meteorological Coordinates",xlab="Time",ylab="Value")
 dev.off()
#> agg_record_1280622654 
#>                     2 
```
