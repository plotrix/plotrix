\name{sumDendrite}
\alias{sumDendrite}
\title{Sum the counts in the top level of a dendrite object}
\description{Find the sum of the counts that are the first elements of each
 list in the top level of a dendrite object.}
\usage{ sumDendrite(x) }
\arguments{
 \item{x}{A list with a numeric value as the first element in each of its
  toplevel elements.}
}
\details{
 A \samp{dendrite} object is a possibly nested list of lists that contain the
 counts and pointers to sublists in each list. Such an object describes the 
 attributes of objects that can take on mutually exclusive attributes (that is,
 belong to disjunct sets). \samp{sumDendrite} is a convenience function to get
 the total number of objects that are so classified.
}
\value{The sum of the counts in the top level of lists.}
\keyword{misc}
\author{Jim Lemon}
\seealso{\link{plot.dendrite}}
