\name{rescale}
\title{Scale numbers into a new range}
\description{Scale a vector or matrix of numbers into a new range.}
\usage{
 rescale(x,newrange)
}
\alias{rescale}
\arguments{
 \item{x}{A numeric vector, matrix or data frame.}
 \item{newrange}{The minimum and maximum value of the range into which
  \samp{x} will be scaled.}
}
\details{
 \samp{rescale} performs a simple linear conversion of \samp{x} into the
  range specified by \samp{newrange}. Only numeric vectors, matrices or data
  frames with some variation will be accepted. NAs are now preserved - 
  formerly the function would fail.
}
\value{On success, the rescaled object, otherwise the original object.}
\author{Jim Lemon}
\examples{
 # scale one vector into the range of another
 normal.counts<-rnorm(100)
 normal.tab<-tabulate(cut(normal.counts,breaks=seq(-3,3,by=1)))
 normal.density<-rescale(dnorm(seq(-3,3,length=100)),range(normal.tab))
 # now plot them
 plot(c(-2.5,-1.5,-0.5,0.5,1.5,2.5),normal.tab,xlab="X values",
  type="h",col="green")
 lines(seq(-3,3,length=100),normal.density,col="blue")
}
\keyword{misc}
