\name{propbrk}
\alias{propbrk}
\title{Calculate the proportion of specified values in a vector}
\description{
 Calculates the proportion of values in a vector that are equal to a specified
 value.
}
\usage{
 propbrk(x,trueval=TRUE,na.rm=TRUE)
}
\arguments{
  \item{x}{a character, factor or numeric vector.}
  \item{trueval}{the value to be matched in \samp{x}.}
  \item{na.rm}{whether to remove NA values.}
}
\details{
 \samp{propbrk} calculates the proportion of values matching a specified value.
 It is mainly to allow proportions to be calculated in the \samp{brkdnNest}
 function. It always discards NAs in \samp{x} when summing the number equal to
 \samp{trueval}, but respects the \samp{na.rm} argument when calculating the
 total number of values in \samp{x}.
}
\value{nil}
\author{Jim Lemon}
\seealso{\link{brkdnNest}}
\examples{
 propbrk(sample(LETTERS,100,TRUE),trueval="M")
}
\keyword{misc}
