\name{spreadout}
\alias{spreadout}
\title{Spread out a vector of numbers to a minimum interval}
\description{
 Spread out a vector of numbers so that there is a minimum interval
 between any two numbers when in ascending or descending order.
}
\usage{
 spreadout(x,mindist)
}
\arguments{
 \item{x}{A numeric vector which may contain NAs.}
 \item{mindist}{The minimum interval between any two values when in ascending
  or descending order.}
}
\details{
 \samp{spreadout} starts at or near the middle of the vector and increases the
 intervals between the ordered values. NAs are preserved. \samp{spreadout}
 first tries to spread groups of values with intervals less than \samp{mindist}
 out neatly away from the mean of the group. If this doesn't entirely succeed,
 a second pass that forces values away from the middle is performed.

 \samp{spreadout} is currently used to avoid overplotting of axis tick labels
 where they may be close together.
}
\value{
 On success, the spread out values. If there are less than two valid
 values, the original vector is returned.
}
\author{Jim Lemon}
\examples{
 spreadout(c(1,3,3,3,3,5),0.2)
 spreadout(c(1,2.5,2.5,3.5,3.5,5),0.2)
 spreadout(c(5,2.5,2.5,NA,3.5,1,3.5,NA),0.2)
 # this will almost always invoke the brute force second pass
 spreadout(rnorm(10),0.5)
}
\keyword{misc}
