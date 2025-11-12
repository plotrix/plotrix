# Display labels on a 3D pie chart

Displays labels on a 3D pie chart.

## Usage

``` r
pie3D.labels(radialpos,radius=1,height=0.1,theta=pi/6,
  labels,labelcol=par("fg"),labelcex=1.5,labelrad=1.25,minsep=0.3)
```

## Arguments

- radialpos:

  Position of the label in radians

- radius:

  the radius of the pie in user units

- height:

  the height of the pie in user units

- theta:

  The angle of viewing in radians

- labels:

  The label to display

- labelcol:

  The color of the labels

- labelcex:

  The character expansion factor for the labels

- labelrad:

  The expansion for the labels around the pie.

- minsep:

  The minimum angular separation between label positions.

## Value

nil

## Details

`pie3D.label` displays labels on a 3D pie chart. The positions of the
labels are given as angles in radians (usually the bisector of the pie
sectors). As the labels can be passed directly to [pie3D](pie3D.md),
this function would probably not be called by the user.

`pie3D.labels` tries to separate labels that are placed closer than
`minsep` radians. This simple system will handle minor crowding of
labels. If labels are very crowded, capturing the return value of
`pie3D` and editing the label positions may allow the user to avoid
manually placing labels.

## Author

Jim Lemon

## See also

[pie3D](pie3D.md), [draw.tilted.sector](draw.tilted.sector.md)

## Examples

``` r
 pieval<-c(2,4,6,8)
 bisectors<-pie3D(pieval,explode=0.1,main="3D PIE OPINIONS")
 pielabels<-
  c("We hate\n pies","We oppose\n  pies","We don't\n  care","We just love pies")
 pie3D.labels(bisectors,labels=pielabels)
```
