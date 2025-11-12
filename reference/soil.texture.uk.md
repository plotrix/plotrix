# Soil texture triangle plot using UK conventions

Display a UK style soil texture triangle with optional grid, labels and
soil texture points.

## Usage

``` r
soil.texture.uk(soiltexture = NULL, main = "",at = seq(0.1, 0.9, by = 0.1),
  axis.labels = c("percent sand", "percent silt", "percent clay"),
  tick.labels = list(l = seq(10, 90, by = 10), r = seq(10, 90, by = 10),
  b = seq(10, 90, by = 10)), show.names = TRUE,
  show.lines = TRUE, col.names = "gray", bg.names = par("bg"),
  show.grid = FALSE, col.axis = "black", col.lines = "gray",
  col.grid = "gray", lty.grid = 3, show.legend = FALSE, label.points = FALSE,
  point.labels = NULL, col.symbols = "black", pch = par("pch"),
  h1 = NA, h3 = NA, t1 = NA, t3 = NA, lwduk = 2, xpos = NA, ypos = NA,
  snames = NA, cexuk = 1.1, ...)
```

## Arguments

- soiltexture:

  Matrix of soil textures where each row is a soil sample and three
  columns containing the percentages of the components sand, silt and
  clay in the range 0 to 100.

- main:

  The title of the soil texture plot. Defaults to nothing.

- at:

  Positions on the three axes where ticks will be drawn.

- axis.labels:

  Labels for the axes.

- tick.labels:

  The tick labels for the three axes.

- show.names:

  Logical - whether to show the names of different soil types within the
  soil triangle.

- show.lines:

  Logical - whether to show the boundaries of the different soil types
  within the soil triangle.

- col.names:

  Color of the soil names. Defaults to gray.

- bg.names:

  Color to use when drawing a blank patch for the names of soil types.

- show.grid:

  Logical - whether to show grid lines at each 10 level of each soil
  component.

- col.axis:

  Color of the triangular axes, ticks and labels.

- col.lines:

  Color of the boundary lines. Defaults to gray.

- col.grid:

  Color of the grid lines. Defaults to gray.

- lty.grid:

  Type of line for the grid. Defaults to dashed.

- show.legend:

  Logical - whether to display a legend.

- label.points:

  Logical - whether to call [thigmophobe.labels](thigmophobe.labels.md)
  to label the points.

- point.labels:

  Optional labels for the points or legend.

- col.symbols:

  Color of the symbols representing each value.

- pch:

  Symbols to use in plotting values.

- h1,h3,t1,t3:

  Points used in drawing boundaries for soil types.

- lwduk:

  Line width for the boundaries

- xpos,ypos:

  Positions for the soil type labels.

- snames:

  Soil type labels.

- cexuk:

  Character expansion for the soil type labels.

- ...:

  Additional arguments passed to [triax.points](triax.points.md) and
  then `points`.

## Details

`soil.texture.uk` displays a triangular plot area on which soil textures
defined as proportions of sand, silt and clay can be plotted. It is
similar to the `soil.texture` function but uses the UK display
conventions.

## Value

If `soiltexture` was included, a list of the `x,y` positions of the soil
types plotted. If not, nil.

## Author

Julian Stander

## See also

[triax.plot](triax.plot.md)

## Examples

``` r
 soils.sw.percent<-data.frame(
  Sand=c(67,67,66,67,36,25,24,59,27,9,8,8,20,
  45,50,56,34,29,39,41,94,98,97,93,96,99),
  Silt=c(17,16,9,8,39,48,54,27,46,70,68,68,66,
  34,30,24,48,53,46,48,2,2,2,4,1,1),
  Clay=c(16,17,25,25,25,27,22,14,27,21,24,24,
  14,21,20,20,18,18,15,11,4,0,1,3,3,0))
 soils.sw.cols <- c(1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3,
  3, 3, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6)
 soils.sw.names <- c("Ardington","Astrop","Atrim",
  "Banbury","Beacon","Beckfoot")
 soil.texture.uk(soils.sw.percent,
  main = "Ternary Diagram for Some Soils from South West England",
  col.lines = "black", col.names = "black", show.grid = TRUE,
  col.grid = "blue", lty.grid = 2,  pch = 16, cex = 1.0,
  col.symbols = soils.sw.cols, h1 = NA, h3 = NA, t1 = NA,
  t3 = NA , lwduk = 2, xpos = NA, ypos = NA,
  snames = NA, cexuk = 1.1)
 legend("topleft", legend = soils.sw.names, col = 1:max(soils.sw.cols),
  pch = 16, cex = 1.1, title = "Location", bty = "n")
```
