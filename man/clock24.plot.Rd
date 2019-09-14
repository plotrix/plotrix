\name{clock24.plot}
\title{Plot values on a 24 hour "clockface"}
\usage{
 clock24.plot(lengths,clock.pos,labels=0:23,minutes=FALSE,
  label.pos=NULL,rp.type="r",...)
}
\alias{clock24.plot}
\arguments{
 \item{lengths}{numeric data vector. Magnitudes will be represented as
  line lengths, or symbol or polygon vertex positions.}
 \item{clock.pos}{numeric vector of positions on the 'clockface'.
  These must be in decimal hours and will be rescaled to radians.}
 \item{labels}{Labels to place at the circumference.}
 \item{minutes}{Whether to add minutes (".00") to the labels.}
 \item{label.pos}{Radial positions of the labels.}
 \item{rp.type}{Whether to plot radial lines, symbols or a polygon.}
 \item{...}{additional arguments are passed to \samp{radial.plot} and
  then to \samp{plot}.}
}
\description{
 \samp{clock24.plot} displays a plot of radial lines, symbols or a polygon
  centered at the midpoint of the plot frame on a 24 hour 'clockface'. 
  In contrast to the default behavior of \samp{radial.plot}, the positions 
  are interpreted as beginning at vertical (000) and moving clockwise.

 If \samp{add=TRUE} is passed as one of the additional arguments, the values
 will be added to the current plot. If a \samp{radial.lim} argument was
 passed on the initial plot, it must be passed again to add values or the
 values will be displayed incorrectly.
}
\value{A list of the parameters altered by \link{radial.plot}.}
\keyword{misc}
\author{Jim Lemon}
\seealso{\link{polar.plot},\link{radial.plot}}
\examples{
 testlen<-rnorm(24)*2+5
 testpos<-0:23+rnorm(24)/4
 clock24.plot(testlen,testpos,main="Test Clock24 (lines)",show.grid=FALSE,
  line.col="green",lwd=3)
 if(dev.interactive()) par(ask=TRUE)
 # now do a 'daylight' plot
 oldpar<-clock24.plot(testlen[7:19],testpos[7:19],
  main="Test Clock24 daytime (symbols)",
  point.col="blue",rp.type="s",lwd=3)
 # reset everything
 par(oldpar)
}
