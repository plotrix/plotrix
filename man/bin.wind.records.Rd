\name{bin.wind.records}
\alias{bin.wind.records}
\title{Classify wind direction and speed records}
\description{Classifies wind direction and speed records into a matrix of
 percentages of observations in speed and direction bins.}
\usage{
 bin.wind.records(winddir,windspeed,ndir=8,radians=FALSE,
  speed.breaks=c(0,10,20,30))
}
\arguments{
 \item{winddir}{A vector of wind directions.}
 \item{windspeed}{A vector of wind speeds corresponding to the above
  directions.}
 \item{ndir}{Number of direction bins in a compass circle.}
 \item{radians}{Whether wind directions are in radians.}
 \item{speed.breaks}{Minimum wind speed for each speed bin.}
}
\details{
 \samp{bin.wind.records} bins a number of wind direction and speed
  records into a matrix of percentages of observations that can be used to
  display a cumulative wind rose with \samp{oz.windrose} The defaults are those
  used by the Australian Bureau of Meteorology.
}
\value{
 A matrix of percentages in which the rows represent wind speed categories and 
 the columns represent wind direction categories.
}
\author{Jim Lemon}
\seealso{\link{oz.windrose}}
\examples{
 winddir<-sample(0:360,100,TRUE)
 windspeed<-sample(0:40,100,TRUE)
 bin.wind.records(winddir,windspeed)
}
\keyword{misc}
