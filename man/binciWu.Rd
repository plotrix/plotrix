\name{binciWu}
\alias{binciWu}
\title{Upper binomial confidence limit}
\description{
 Returns the upper binomial confidence limit using the Wilson approximation.
}
\usage{
 binciWu(x,n,alpha=0.05,trueval=TRUE,na.rm=TRUE)
}
\arguments{
 \item{x}{The number of successes or failures for which the CI is to be calculated.}
 \item{n}{The number of trials as above.}
 \item{alpha}{The desired coverage - 0.05 produces 95 percent coverage}
 \item{trueval}{The value representing the outcome of interest for the CI.}
 \item{na.rm}{Argument needed to make this work}
}
\details{
 \samp{binciWu} now calls \samp{binciW} and returns the upper limit.
}
\value{The upper binomial confidence interval}
\author{Jim Lemon}
\seealso{\link{binciWl}}
\examples{
 binciWl(c(rep(5,TRUE),rep(37,FALSE)))
}
\keyword{misc}
