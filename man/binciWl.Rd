\name{binciWl}
\alias{binciWl}
\title{Lower binomial confidence limit}
\description{
 Returns the lower binomial confidence limit using the Wilson approximation.
}
\usage{
 binciWl(x,n,alpha=0.05,trueval=TRUE,na.rm=TRUE)
}
\arguments{
 \item{x}{The number of successes or failures for which the CI is to be calculated.}
 \item{n}{The number of trials as above.}
 \item{alpha}{The desired coverage - 0.05 produces 95 percent coverage}
 \item{trueval}{The value representing the outcome of interest for the CI.}
 \item{na.rm}{Argument needed to make this work}
}
\details{
 \samp{binciWl} now calls \samp{binciW} and returns the lower limit.
}
\value{The lower binomial confidence limit}
\author{Jim Lemon}
\seealso{\link{binciWu}}
\examples{
 binciWl(c(rep(5,TRUE),rep(37,FALSE)))
}
\keyword{misc}
