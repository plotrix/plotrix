\name{soil.texture.uk}
\alias{soil.texture.uk}
\title{Soil texture triangle plot using UK conventions}
\description{
  Display a UK style soil texture triangle with optional grid, labels and
  soil texture points.
}
\usage{
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
}
\arguments{
 \item{soiltexture}{Matrix of soil textures where each row is a
  soil sample and three columns containing the percentages of the
  components sand, silt and clay in the range 0 to 100.}
 \item{main}{The title of the soil texture plot. Defaults to nothing.}
 \item{at}{Positions on the three axes where ticks will be drawn.}
 \item{axis.labels}{Labels for the axes.}
 \item{tick.labels}{The tick labels for the three axes.}
 \item{show.names}{Logical - whether to show the names of different
  soil types within the soil triangle.}
 \item{show.lines}{Logical - whether to show the boundaries of the
  different soil types within the soil triangle.}
 \item{col.names}{Color of the soil names. Defaults to gray.}
 \item{bg.names}{Color to use when drawing a blank patch for the names
  of soil types.}
 \item{show.grid}{Logical - whether to show grid lines at each 10%
  level of each soil component.}
 \item{col.axis}{Color of the triangular axes, ticks and labels.}
 \item{col.lines}{Color of the boundary lines. Defaults to gray.}
 \item{col.grid}{Color of the grid lines. Defaults to gray.}
 \item{lty.grid}{Type of line for the grid. Defaults to dashed.}
 \item{show.legend}{Logical - whether to display a legend.}
 \item{label.points}{Logical - whether to call
  \link{thigmophobe.labels} to label the points.}
 \item{point.labels}{Optional labels for the points or legend.}
 \item{col.symbols}{Color of the symbols representing each value.}
 \item{pch}{Symbols to use in plotting values.}
 \item{h1,h3,t1,t3}{Points used in drawing boundaries for soil types.}
 \item{lwduk}{Line width for the boundaries}
 \item{xpos,ypos}{Positions for the soil type labels.}
 \item{snames}{Soil type labels.}
 \item{cexuk}{Character expansion for the soil type labels.}
 \item{...}{Additional arguments passed to \link{triax.points}
  and then \samp{points}.}
}
\details{
 \samp{soil.texture.uk} displays a triangular plot area on which soil
 textures defined as proportions of sand, silt and clay can be plotted.
 It is similar to the \samp{soil.texture} function but uses the UK
 display conventions.
}
\value{If \samp{soiltexture} was included, a list of the \samp{x,y}
 positions of the soil types plotted. If not, nil.
}
\author{Julian Stander}
\seealso{\link{triax.plot}}
\examples{
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
}
\keyword{misc}
