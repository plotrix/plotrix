\name{sumbrk}
\alias{sumbrk}
\title{Count specified values in a vector}
\description{
 Counts the number of values in a vector that are equal to a specified value.
}
\usage{
 sumbrk(x,trueval=TRUE,na.rm=TRUE)
}
\arguments{
  \item{x}{a character, factor or numeric vector.}
  \item{trueval}{the value to be matched in \samp{x}.}
  \item{na.rm}{whether to remove NA values.}
}
\details{
 \samp{sumbrk} counts the values in \samp{x} matching a specified value.
 It is mainly to allow these sums to be calculated in the \samp{brkdnNest}
 function.
}
\value{nil}
\author{Jim Lemon}
\seealso{\link{brkdnNest}}
\examples{
 sumbrk(sample(LETTERS,100,TRUE),trueval="M")
}
\keyword{misc}
