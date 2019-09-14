\name{valid.n}
\alias{valid.n}
\title{
 Find the number of valid (not NA) values
}
\description{
 Finds the number of valid (not NA) or total values in an object.
}
\usage{
 valid.n(x,na.rm=TRUE)
}
\arguments{
 \item{x}{An object.}
 \item{na.rm}{Whether to count all values (FALSE) or only those not NA.}
}
\details{
 \samp{valid.n} finds the number of valid values of the object if \samp{na.rm=TRUE}.
}
\value{The number of valid values or the length of the object.}
\author{Jim Lemon}
\keyword{misc}
