\name{get.triprop}
\alias{get.triprop}
\title{Enter three proportion data - usually soil textures}
\usage{
 get.triprop(use.percentages=FALSE,cnames=c("1st","2nd","3rd"))
}
\arguments{
 \item{use.percentages}{Logical - whether to treat the entries as
  percentages and scale to proportions.}
 \item{cnames}{column names for the resulting three column matrix.}
}
\description{
 \samp{get.triprop} allows the user to enter triplets of proportions
 or percentages of three components such as sand, silt and clay in soils.
}
\details{
 The three proportions of each row must sum to 100 or 1 within 1\% or
 the function will warn the operator.}
\value{A matrix of the components of one or more observations.}
\author{Jim Lemon}
\seealso{\link{triax.plot}, \link{soil.texture}}
\examples{
 if(dev.interactive()) {
  # get some proportions
  newsp<-get.triprop()
  # show the triangle
  triax.frame(main="Test triax.plot")
  # now plot the observations
  triax.points(newsp)
 }
}
\keyword{misc}
