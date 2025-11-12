# Display an Australian wind rose

Displays a wind rose in the style used by the Australian Bureau of
Meteorology.

## Usage

``` r
oz.windrose(windagg,maxpct=20,wrmar=c(4,5,6,5),scale.factor=30,
  speed.col=c("#dab286","#fe9a66","#ce6733","#986434"),
  speed.width=NA,show.legend=TRUE,legend.pos=NA,...)
```

## Arguments

- windagg:

  A matrix of percentages with the rows representing speed ranges and
  the columns indicating wind directions.

- maxpct:

  The maximum percentage displayed on the radial grid.

- wrmar:

  Plot margins for the diagram.

- scale.factor:

  The scale factor for the diagram.

- speed.col:

  Colors representing speed ranges.

- speed.width:

  Half widths of the bars representing speed ranges.

- show.legend:

  Logical indicating whether to display a legend.

- legend.pos:

  The vertical position of the wind rose legend. The Australian Bureau
  of Meteorology displays the legend at the top of the plot

- ...:

  additional arguments passed to `plot`.

## Details

`oz.windrose` displays a wind rose in the style used by the Australian
Bureau of Meteorology. Each limb represents a bin of wind directions,
and there are conventionally eight bins. If `windagg` has more than
eight columns, more limbs will be displayed. The rows of `windagg`
represent the speed ranges used by the Australian Bureau of Meteorology
(0, 0-10, 10-20, 20-30 and over 30 in km/hour). The diameter of the
central circle is calculated as (percent calm observations)/(number of
direction bins). The remaining grid circles are spaced from the
circumference of the "Calm" circle.

## Note

If a title is desired, remember to move the legend to the bottom of the
plot. If the function is passed values that do not sum to 100, the
resulting plot will at best be misleading.

## Value

nil

## Author

Jim Lemon (thanks to Anna in the Sydney BoM office and Alejo for finding
the problem with heavily prevailing winds.)

## See also

[oz.windrose.legend](oz.windrose.legend.md),
[draw.circle](draw.circle.md), [bin.wind.records](bin.wind.records.md)

## Examples

``` r
 windagg<-matrix(c(8,0,0,0,0,0,0,0,4,6,2,1,6,3,0,4,2,8,5,3,5,2,1,1,
  5,5,2,4,1,4,1,2,1,2,4,0,3,1,3,1),nrow=5,byrow=TRUE)
 oz.windrose(windagg)

#> Warning: argument 1 does not name a graphical parameter
#> NULL
```
