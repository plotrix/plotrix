\name{get.soil.texture}
\alias{get.soil.texture}
\title{Enter soil texture data}
\usage{
 get.soil.texture(use.percentages=FALSE,cnames=c("sand","silt","clay"))
}
\arguments{
 \item{use.percentages}{Logical - whether to treat the entries as
  percentages and scale to proportions.}
 \item{cnames}{column names for the resulting three column matrix.}
}
\description{
 \samp{get.soil.texture} calls \samp{get.triprop} to allow the user to 
 enter soil textures as the proportions or percentages of three 
 components, sand, silt and clay.
}
\value{A matrix of the components of one or more soil samples.}
\author{Sander Oom and Jim Lemon}
\seealso{\link{soil.texture},\link{get.triprop}}
\examples{
 if(dev.interactive()) {
  newsp<-get.soil.texture()
  # show the soil triangle
  soil.texture()
  # now plot the observations
  show.soil.texture(newsp)
 }
}
\keyword{misc}
