# Display a 3D pie sector

Displays a 3D pie sector.

## Usage

``` r
draw.tilted.sector(x=0,y=0,edges=NA,radius=1,height=0.1,theta=pi/6,
  start=0,end=pi*2,border=par("fg"),col=par("bg"),explode=0,shade=0.8)
```

## Arguments

- x,y:

  Position of the center of the pie sector in user units

- edges:

  Number of edges to draw a complete ellipse

- radius:

  the radius of the pie in user units

- height:

  the height of the pie in user units

- theta:

  The angle of viewing in radians

- start:

  Starting angle of the sector

- end:

  Ending angle of the sector

- border:

  The color of the sector border lines

- col:

  Color of the sector

- explode:

  How far to "explode" the sectors in user units

- shade:

  If \> 0 and \< 1, the proportion to reduce the brightness of the
  sector color to get a better 3D effect.

## Value

The bisector of the pie sector in radians.

## Details

`draw.tilted.sector` displays a single 3D pie sector. It is probably
only useful when called from [pie3D](pie3D.md). The `shade` argument
proportionately reduces the brightness of the RGB color of the sector to
produce a top lighted effect.

If `explode` is zero, only the top and outer side of each sector will be
displayed. This will sometimes fix the problem of a pie with one huge
sector greater than 3\*pi/2 that cannot otherwise be drawn.

## Author

Jim Lemon

## See also

[pie3D](pie3D.md)
