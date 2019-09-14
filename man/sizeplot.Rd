\name{sizeplot}
\alias{sizeplot}
\title{Plot with repeated symbols by size}
\description{
 Plots a set of (x,y) data with repeated points denoted by larger
 symbol sizes
}
\usage{
 sizeplot(x, y, scale=1, pow=0.5, powscale=TRUE, size=c(1,4), add=FALSE, ...)
}
\arguments{
 \item{x}{x coordinates of data}
 \item{y}{y coordinates of data}
 \item{scale}{scaling factor for size of symbols}
 \item{pow}{power exponent for size of symbols}
 \item{powscale}{(logical) use power scaling for symbol size?}
 \item{size}{(numeric vector) min and max size for scaling, if powscale=FALSE}
 \item{add}{(logical) add to an existing plot?}
 \item{\dots}{other arguments to \samp{plot()} or \samp{points()}}
}
\details{
 Most useful for plotting (e.g.) discrete data, where repeats are
 likely.  If all points are repeated equally, gives a warning.  The
 size of a point is given by \eqn{scale*n^pow}, where n is the number of
 repeats, if powscale is TRUE, or it is scaled between size[1] and size[2],
 if powscale is FALSE.
}
\value{
 A plot is produced on the current device, or points are added to the
 current plot if \samp{add=TRUE}.
}
\author{Ben Bolker}
\seealso{\link{symbols}}
\examples{
 x <- c(0.1,0.1,0.1,0.1,0.1,0.2,0.2,0.2,0.2,0.3,0.3)
 y <- c( 1,  1,  1,  1,  2,  2,  2,  3,  3,  4,  5 )
 plot(x,y)
 sizeplot(x,y)
 sizeplot(x,y,pch=2)
}
\keyword{hplot}
