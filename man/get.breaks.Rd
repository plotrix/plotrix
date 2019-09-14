\name{get.breaks}
\alias{get.breaks}
\title{Get the breakpoints for a weighted histogram}
\description{
 Gets the breakpoints for a weighted histogram.
}
\usage{
 get.breaks(x,breaks)
}
\arguments{
  \item{x}{A numeric vector.}
  \item{breaks}{Either the name of the function to calculate breakpoints, the
  number of categories or a vector of breakpoints.}
}
\details{
 \samp{get.breaks} either calls the same functions as \samp{hist} to get
  breakpoints or calculates a given number or just returns \samp{breaks}
  if they are already specified.
}
\value{A vector of breakpoints.}
\author{Jim Lemon}
\seealso{\link{hist}}
\keyword{misc}
