\name{triax.abline}
\alias{triax.abline}
\title{Lines for triangle plot}
\description{
 Display lines on a triangle plot.
}
\usage{
 triax.abline(b=NULL,r=NULL,l=NULL,col=par("col"),lty=par("lty"),
  cc.axes=FALSE)
}
\arguments{
 \item{b}{Lines relating to the bottom axis.}
 \item{r}{Lines relating to the right axis.}
 \item{l}{Lines relating to the left axis.}
 \item{col}{Color(s) of the lines.}
 \item{lty}{Type(s) of the lines.}
 \item{cc.axes}{Clockwise/counterclockwise axes and ticks.}
}
\details{
 \samp{triax.abline} displays one or more lines on a triangle plot. Lines
  are oriented in the conventional way, horizontal for the left axis, 
  slanting up to the right for the right axis and up to the left for the 
  bottom axis. If \samp{cc.axes} is TRUE, the orientation is up-left for
  the left axis, horizontal for the right axis and up-right for the bottom
  axis.
  
  Remember to call \samp{triax.plot} with \samp{no.add=FALSE} and restore
  the graphics parameters as in the example or the lines will not be
  placed properly.
}
\value{nil}
\author{Jim Lemon}
\seealso{\link{triax.plot}}
\examples{
 triax.return<-triax.plot(data.frame(bottom=0.4,right=0.3,left=0.3),
  main="Triax ablines",no.add=FALSE)
 triax.abline(l=0.3,col="red")
 triax.abline(r=0.3,col="green")
 triax.abline(b=0.4,col="blue")
 par(triax.return$oldpar)
}
\keyword{misc}
