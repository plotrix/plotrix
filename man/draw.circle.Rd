\name{draw.circle}
\alias{draw.circle}
\title{Draw a circle}
\description{Draws a circle on an existing plot.}
\usage{
 draw.circle(x,y,radius,nv=100,border=NULL,col=NA,lty=1,density=NULL,
  angle=45,lwd=1)
}
\arguments{
 \item{x,y}{Coordinates of the center of the circle.}
 \item{radius}{Radius (or radii) of the circle(s) in user units.}
 \item{nv}{Number of vertices to draw the circle.}
 \item{border}{Color to use for drawing the circumference.}
 \item{col}{Color to use for filling the circle.}
 \item{lty}{Line type for the circumference.}
 \item{density}{Density for patterned fill. See \samp{polygon}.}
 \item{angle}{Angle of patterned fill. See \samp{polygon}.}
 \item{lwd}{Line width for the circumference.}
}
\value{
 A list with the x and y coordinates of the points on the circumference
 of the last circle displayed.
}
\details{
 \samp{draw.circle} uses the dimensions of the plot and the \samp{x} and
 \samp{y} coordinates to draw a circle rather than an ellipse.
}
\author{Jim Lemon, thanks to David Winsemius for the density and angle args}
\seealso{\link{polygon}}
\examples{
 plot(1:5,seq(1,10,length=5),type="n",xlab="",ylab="",main="Test draw.circle")
 draw.circle(2,4,c(1,0.66,0.33),border="purple",
  col=c("#ff00ff","#ff77ff","#ffccff"),lty=1,lwd=1)
 draw.circle(2.5,8,0.6,border="red",lty=3,lwd=3)
 draw.circle(4,3,0.7,border="green",col="yellow",lty=1,
  density=5,angle=30,lwd=10)
 draw.circle(3.5,8,0.8,border="blue",lty=2,lwd=2)
}
\keyword{misc}
