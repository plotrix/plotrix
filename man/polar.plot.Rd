\name{polar.plot}
\title{Plot values on a circular grid of 0 to 360 degrees}
\usage{
 polar.plot(lengths,polar.pos=NULL,labels,label.pos=NULL,
  start=0,clockwise=FALSE,rp.type="r",...)
}
\alias{polar.plot}
\arguments{
 \item{lengths}{numeric data vector. Magnitudes will be represented as
  the radial positions of symbols, line ends or polygon vertices.}
 \item{polar.pos}{numeric vector of positions on a 0:360 degree circle.
  These will be converted to radians when passed to \samp{radial.plot}.}
 \item{labels}{text labels to place on the periphery of the circle. This 
  defaults to labels every 20 degrees. For no labels, pass an empty string.}
 \item{label.pos}{positions of the peripheral labels in degrees}
 \item{start}{The position for zero degrees on the plot in degrees.}
 \item{clockwise}{Whether to increase angles clockwise rather than the
  default counterclockwise.}
 \item{rp.type}{Whether to plot radial lines, symbols or a polygon.}
 \item{...}{additional arguments passed to \samp{radial.plot} and
  then to \samp{plot}.}
}
\description{
 \samp{polar.plot} displays a plot of radial lines, symbols or a polygon 
  centered at the midpoint of the plot frame on a 0:360 circle.
  Positions are interpreted as beginning at the right and moving
  counterclockwise unless \samp{start} specifies another starting point or
  \samp{clockwise} is TRUE.

 If \samp{add=TRUE} is passed as one of the additional arguments, the values
 will be added to the current plot. If a \samp{radial.lim} argument was
 passed on the initial plot, it must be passed again to add values or the
 values will be displayed incorrectly.
}
\value{A list of the parameters altered by \link{radial.plot}.}
\author{Jim Lemon}
\keyword{misc}
\seealso{\link{radial.plot}}
\examples{
 testlen<-c(rnorm(36)*2+5)
 testpos<-seq(0,350,by=10)
 polar.plot(testlen,testpos,main="Test Polar Plot",lwd=3,line.col=4)
 oldpar<-polar.plot(testlen,testpos,main="Test Clockwise Polar Plot",
  radial.lim=c(0,15),start=90,clockwise=TRUE,lwd=3,line.col=4)
 # reset everything
 par(oldpar)
}
