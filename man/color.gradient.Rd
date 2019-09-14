\name{color.gradient}
\title{Calculate an arbitrary sequence of colors}
\usage{
 color.gradient(reds,greens,blues,nslices=50)
}
\alias{color.gradient}
\arguments{
 \item{reds,greens,blues}{vectors of the values of the color components
  as 0 to 1.}
 \item{nslices}{The number of color "slices".}
}
\description{
 \samp{color.gradient} is now just a call to \samp{color.scale} with a
  vector of equally spaced integers (1:nslices). The function is kept for
  backward compatibility.
}
\note{
 The function is mainly useful for defining a set of colors to represent
 a known number of gradations. Such a set can be used to assign a grade
 to a small number of values (e.g. points on a scatterplot - but see 
 \samp{color.scale} for large numbers) and display a color bar using
 \samp{gradient.rect} as a legend.
}
\value{A vector of hexadecimal color values as used by \samp{col}.}
\author{Jim Lemon}
\seealso{\link{rescale},\link{approx},\link{color.scale}}
\examples{
 # try it with red and blue endpoints and green midpoints.
 color.gradient(c(0,1),c(1,0.6,0.4,0.3,0),c(0.1,0.6))
}
\keyword{misc}
