\name{print.brklist}
\alias{print.brklist}
\title{Display the output of brkdnNest}
\description{
 Displays the list of values produced by \samp{brkdnNest}.
}
\usage{
 \method{print}{brklist}(x,...)
}
\arguments{
  \item{x}{a list of summary values produced by \samp{\link{brkdnNest}}}
  \item{...}{additional arguments passed to \samp{print}.}
}
\details{
 \samp{print.brklist} displays frequency tables produced by \samp{brkdnNest}.
 It is mainly for convenience, but does make a nicer display than when passed
 directly to \samp{print}
}
\value{nil}
\author{Jim Lemon}
\seealso{\link{brkdnNest}}
\examples{
 printbrktest<-data.frame(A=c(sample(1:10,99,TRUE),NA),
  B=sample(c("Yes","No"),100,TRUE),
  C=sample(LETTERS[1:3],100,TRUE))
 pbt<-brkdnNest(A~B+C,printbrktest)
 print(pbt)
}
\keyword{misc}
