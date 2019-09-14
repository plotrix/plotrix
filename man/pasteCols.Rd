\name{pasteCols}
\alias{pasteCols}
\title{Paste the columns of a matrix together}
\description{Paste the columns of a matrix together to form as
 many "words" as there are columns.}
\usage{
 pasteCols(x,sep="")
}
\arguments{
 \item{x}{A matrix.}
 \item{sep}{The separator to use in the \samp{paste} command.}
}
\details{
 \samp{pasteCols} pastes the columns of a matrix together to form a vector in
 which each element is the concatenation of the elements in each of the columns
 of the matrix. It is intended for producing identifiers from a matrix returned
 by the \samp{combn} function.
}
\value{A vector of character strings.}
\keyword{misc}
\author{Jim Lemon}
\seealso{\link{makeIntersectList}}
\examples{
 # create a matrix of the combinations of the first five letters of the
 # alphabet taken two at a time.
 alpha5<-combn(LETTERS[1:5],2,simplify=TRUE)
 pasteCols(alpha5,sep="+")
}
