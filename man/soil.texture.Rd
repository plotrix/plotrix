\name{soil.texture}
\alias{soil.texture}
\title{Soil texture triangle plot}
\description{
  Display a USDA soil texture triangle with optional grid, labels and
  soil texture points.
}
\usage{
soil.texture(soiltexture=NULL, main="", at=seq(0.1, 0.9, by=0.1),
             axis.labels=c("percent sand", "percent silt",
                           "percent clay"),
             tick.labels=list(l=seq(10, 90, by=10), r=seq(10, 90, by=10),
                              b=seq(10, 90, by=10)),
             show.names=TRUE, show.lines=TRUE, col.names="gray",
             bg.names=par("bg"), show.grid=FALSE, col.axis="black",
             col.lines="gray", col.grid="gray", lty.grid=3,
             show.legend=FALSE, label.points=FALSE, point.labels=NULL,
             col.symbols="black", pch=par("pch"), \dots)
}
\arguments{
 \item{soiltexture}{Matrix of soil textures where each row is a
  soil sample and three columns contain the proportions of the
  components sand, silt and clay in the range 0 to 1 or
  percentages in the range 0 to 100.}
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
 \item{\dots}{Additional arguments passed to \link{triax.points}
  and then \samp{points}.}
}
\details{
 \samp{soil.texture} displays a triangular plot area on which soil
 textures defined as proportions of sand, silt and clay can be plotted.
 Optional grid, vertex labels, soil type divisions and names may also
 be displayed. If a matrix of soil textures is present, these will be
 plotted.
}
\value{If \samp{soiltexture} was included, a list of the \samp{x,y}
 positions of the soil types plotted. If not, nil.
}
\note{This is now a special case of \samp{triax.plot}.}
\author{Sander Oom, Jim Lemon, and Michael Toews}
\references{
 U.S. Department of Agriculture, Natural Resources Conservation Service,
 2007. \emph{National Soil Survey Handbook}, title 430-VI.//
 \url{http://www.nrcs.usda.gov/wps/portal/nrcs/detail/soils/survey/class/taxonomy/?cid=nrcs142p2_053577}

 U.S. Department of Agriculture, Natural Resources Conservation Service,
 2007. \emph{Soil Texture Calculator}//
 \url{http://www.nrcs.usda.gov/wps/portal/nrcs/detail/soils/survey/class/taxonomy/?cid=nrcs142p2_053577}
}
\seealso{\link{get.soil.texture}, \link{triax.plot}}
\examples{
 data(soils)
 soil.texture(main="NO DATA")
 soil.texture(soils, main="DEFAULT", pch=2)
 soil.texture(soils, main="LINES AND NAMES", show.lines=TRUE,
  show.names=TRUE, pch=3)
 soiltex.return<-soil.texture(soils[1:6,], main="GRID AND LEGEND",
  show.grid=TRUE, pch=4, col.symbols=1:6, show.legend=TRUE)
 par(soiltex.return$oldpar)
}
\keyword{misc}
