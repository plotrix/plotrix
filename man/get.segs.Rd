\name{get.segs}
\alias{get.segs}
\title{Calculate the midpoints and limits for a centipede plot}
\description{
 Calculates midpoints and limits for a list or data frame for use with
  centipede.plot.
}
\usage{
 get.segs(x,mct="mean",lower.limit="std.error",upper.limit=lower.limit)
}
\arguments{
  \item{x}{a list or data frame.}
  \item{mct}{The name of the function to calculate midpoints.}
  \item{lower.limit,upper.limit}{The names of the function(s) to calculate 
   lower and upper limits.}
}
\details{
 \samp{get.segs} calls the functions whose names are passed to calculate
  midpoints and limits for each list element or data frame column. The
  user can define special functions for the central and dispersion measures
  if desired.
}
\value{A matrix with four rows and as many columns as were in the object
 \samp{x}. The first row contains the midpoint values, the second and third
 the lower and upper limit values respectively and the fourth row the number
 of valid observations in the columns.}
\author{Jim Lemon}
\seealso{\link{centipede.plot}}
\keyword{misc}
