\name{binciW}
\alias{binciW}
\title{Binomial confidence limits}
\description{
 Calculates binomial confidence limits using the Wilson approximation.
}
\usage{
 binciW(x,n,alpha=0.05,cc=FALSE)
}
\arguments{
 \item{x}{The number of successes or failures for which the CI is to be calculated.}
 \item{n}{The number of trials as above.}
 \item{alpha}{The desired coverage - 0.05 produces 95 percent coverage}
 \item{cc}{Whether to apply a continuity correction}
}
\details{
 \samp{binciW} calculates binomial confidence limits for the
 given number of successes and trials. It is mainly to allow binomial
 confidence limits to be calculated in the \samp{brkdnNest} function,
 which is why the upper and lower CIs are called separately.
}
\value{The lower and upper binomial confidence limits}
\author{Jim Lemon}
\seealso{\link{binciWl}, \link{binciWu}}
\examples{
 binciW(5,42)
}
\keyword{misc}
