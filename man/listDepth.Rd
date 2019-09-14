\name{listDepth}
\alias{listDepth}
\title{Find the maximum depth of a list}
\description{Descend a list and find the maximum number of levels.}
\usage{ listDepth(x) }
\arguments{
 \item{x}{A list.}
}
\details{
 A possibly nested list of lists is descended to determine the maximum number
 of levels. Currently used to set up the dimensions of a dendrite plot.
}
\value{The maximum number of levels in the list.}
\keyword{misc}
\author{Jim Lemon}
\seealso{\link{plot.dendrite}}
