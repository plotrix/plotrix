\name{thigmophobe}
\alias{thigmophobe}
\title{Find the direction away from the closest point}
\description{Find the direction away from the closest point}
\usage{
 thigmophobe(x,y=NULL,names=seq_along(z),xlog=par("xlog"),ylog=par("ylog"),
  usr=par("usr"),pin=par("pin"),eps=.Machine$double.eps,pi=base::pi)
}
\arguments{
 \item{x,y}{Numeric data vectors. Typically the x/y coordinates of
  plotted points. If arrays are passed, they will be silently coerced to
  numeric vectors.}
 \item{names}{Names for the vector of directions.}
 \item{xlog,ylog}{Flags for logarithmic axes. See Note.}
 \item{usr}{The extent of the plot in user units.}
 \item{pin}{Extent of the plot in inches.}
 \item{eps}{smallest number that can be represented on the system.}
 \item{pi}{value of pi.}
}
\details{
 \samp{thigmophobe} returns the direction (as 1|2|3|4 - see pos= in 
 \samp{text}) away from the nearest point to each of the points 
 described by \samp{x} and \samp{y}.
}
\note{
 \samp{thigmophobe} is typically used to get the offsets to automatically
  place labels on a scatterplot or similar using \samp{thigmophobe.labels}
 to avoid overlapping labels. The name means "one who fears being touched".
 
 The \samp{plot.span}, \samp{xlog} and \samp{ylog} arguments were added to
 allow \samp{thigmophobe} to be used outside of base graphics.
}
\value{
 A vector of directions away from the point nearest to each point.
}
\keyword{misc}
\author{Bill Venables}
\seealso{\link{thigmophobe.labels}}
\examples{
 x<-rnorm(10)
 y<-rnorm(10)
 thigmophobe(x,y)
}
