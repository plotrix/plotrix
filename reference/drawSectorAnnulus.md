# Display a radial pie sector

Displays a radial pie sector with optional annuli.

## Usage

``` r
drawSectorAnnulus(angle1,angle2,radius1,radius2,col,angleinc=0.03)
```

## Arguments

- angle1,angle2:

  Start and end angle for the sector.

- radius1,radius2:

  Start and end of the radial extent of the annulus.

- col:

  Color of the sector.

- angleinc:

  The angular increment to use in drawing the arcs.

## Value

nil

## Details

`drawSectorAnnulus` displays a single radial pie sector. It is probably
only useful when called from [radial.pie](radial.pie.md).

## Author

Jim Lemon

## See also

[radial.pie](radial.pie.md)
