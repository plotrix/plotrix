\name{hexagon}
\alias{hexagon}
\title{Draw a hexagon}
\description{
 Draws a hexagon on the current graphic device
}
\usage{
 hexagon(x,y,unitcell=1,col=NA,border="black")
}
\arguments{
 \item{x,y}{x and y position of the bottom left corner of the square that
  would pack into the same space as the hexagon.}
 \item{unitcell}{The dimension of the side of the abovementioned square.}
 \item{col}{The color to fill the hexagon - default is no fill.}
 \item{border}{The color of the perimeter of the hexagon.}
}
\note{
 Draws a hexagon with the same center as a square that would pack into the
 same dimensions as the hexagon. That is, given a grid of squares with
 alternate rows shifted one half the length of the sides, the hexagons
 drawn would be close packed. Its use in the plotrix package is to provide
 an alternative unit cell for the \samp{color2D.matplot} function.
}
\value{nil}
\author{Jim Lemon}
\seealso{\link{color2D.matplot}}
\keyword{misc}
