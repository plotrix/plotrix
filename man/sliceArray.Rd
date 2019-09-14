\name{sliceArray}
\alias{sliceArray}
\title{Slice an array}
\description{
 Slices one dimension from an array by taking one element from the first dimension.
}
\usage{
 sliceArray(x,slice)
}
\arguments{
 \item{x}{An array}
 \item{slice}{The index of the slice to take from the first dimension of the array.}
}
\details{
 \samp{sliceArray} builds an extractor string containing the value of \samp{slice}
 as the first element and as many commas as needed to match the dimensions of the
 array. It then applies the extractor function to \samp{x} and returns the result. 
 Note how the array "slice" swaps dimensions in the example.
}
\value{
 The desired slice of the array.
}
\author{Jim Lemon}
\seealso{\link{array}}
\examples{
 a1<-array(1:27,dim=c(3,3,3))
 a1
 sliceArray(a1,2)
}
\keyword{misc}
