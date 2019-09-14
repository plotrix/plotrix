\name{std.error}
\alias{std.error}
\title{Calculate standard error of the mean}
\description{
 Calculates the standard error of the mean.
}
\usage{
 std.error(x,na.rm)
}
\arguments{
  \item{x}{A vector of numerical observations.}
  \item{na.rm}{Dummy argument to match other functions.}
}
\details{
 \samp{std.error} will accept a numeric vector.
}
\value{
 The conventional standard error of the mean = sd(x)/sqrt(sum(!is.na(x)))
}
\author{Jim Lemon}
\seealso{\link{sd}}
\keyword{misc}
