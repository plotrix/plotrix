\name{multhist}
\alias{multhist}
\title{Plot a multiple histogram, as a barplot}
\description{
 Given a list, plots a side-by-side barplot containing the histograms
 of the elements
}
\usage{
 multhist(x,beside=TRUE,freq=NULL,probability=!freq,plot.it=TRUE,...)
}
\arguments{
 \item{x}{a list of numeric vectors}
 \item{beside}{plot histogram bars for groups side-by-side?}
 \item{freq}{logical; if 'TRUE', the histogram graphic is a representation
             of frequencies, the 'counts' component of the result; if
             'FALSE', probability densities, component 'density', are
             plotted (so that the histogram has a total area of one).
             Defaults to 'TRUE' if 'probability' is not specified
             (does not consider equidistant breaks as in \link{hist})}
 \item{probability}{an alias for '!freq', for S compatibility}
 \item{plot.it}{Whether or not to display the histogram.}
 \item{...}{additional arguments to \link{hist} or \link{barplot}}
}
\value{
 A list including the return value for the first call to \samp{hist} (itself a list)
 and the values for the bar heights.
}
\author{Ben Bolker}
\seealso{\link{hist},\link{barplot}}
\note{
 The 'inside' argument to \link{barplot} (which is not currently
  implemented in barplot anyway) is deleted from the argument list. The
  default value of NULL for \samp{freq} is for consistency with \samp{hist}
  but is equivalent to TRUE.
}
\examples{
 set.seed(1234)
 l <- list(runif(10)*10,1:10,c(1,1,1,1,4,8))
 multhist(l)
}
\keyword{hplot}
