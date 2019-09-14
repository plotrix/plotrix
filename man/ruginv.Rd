\name{ruginv}
\alias{ruginv}
\title{Add an Inverse Rug to a Plot}
\description{Adds a \emph{rug} representation (1D plot) of the data to the plot,
 but with the coloring inverted.}
\usage{
 ruginv(x,ticksize=0.03,side=1,lwd=0.5,col=par("fg"),col.ticks="white",
 quiet=getOption("warn") < 0,...)
}
\arguments{
 \item{x}{A numeric vector.}
 \item{ticksize}{The length of the ticks making up the 'rug'. Positive lengths
  produce inward ticks.}
 \item{side}{On which side of the plot box the rug will appear. Usually 1
  (bottom) or 3 (top).}
 \item{lwd}{The line width of the ticks.}
 \item{col}{Color of the background of the ticks.}
 \item{col.ticks}{The color of the ticks.}
 \item{quiet}{Logical indicating if there should be a warning about clipped
  values.}
 \item{...}{Further arguments passed to \link{polygon} when plotting the
  background for the ticks.}
}
\author{Peter Solymos}
\seealso{\link{rug}}
\examples{
 require(stats)
 plot(density(faithful$eruptions,bw=0.15))
 ruginv(faithful$eruptions,ticksize=-0.05)
 ruginv(jitter(faithful$eruptions,amount=0.01),side=3,col="lightblue")
}
\keyword{misc}
