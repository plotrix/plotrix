\name{getYmult}
\alias{getYmult}
\title{Correct for aspect and coordinate ratio}
\description{Calculate a multiplication factor for the Y dimension to correct
 for unequal plot aspect and coordinate ratios on the current graphics device.}
\usage{
 getYmult()
}
\details{  
 \samp{getYmult} retrieves the plot aspect ratio and the coordinate ratio for
 the current graphics device, calculates a multiplicative factor to equalize
 the X and Y dimensions of a plotted graphic object.
}
\value{The correction factor for the Y dimension.}
\author{Jim Lemon}
\seealso{\link{draw.circle}}
\keyword{misc}
