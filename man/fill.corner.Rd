\name{fill.corner}
\alias{fill.corner}
\title{
 Fill a "corner" of a matrix with values
}
\description{
 Fills one corner of a matrix with the supplied values, leaving the rest
 filled with a default value.
}
\usage{
 fill.corner(x,nrow,ncol,na.value=NA)
}
\arguments{
 \item{x}{A vector of values.}
 \item{nrow,ncol}{The number of rows and columns in the matrix to be returned.}
 \item{na.value}{The default value for unfilled cells.}
}
\details{
 \samp{fill.corner} creates an nrow by ncol matrix and fills the lower left
 corner with the values supplied in \samp{x}. If there are more values in
 \samp{x} than cells in the matrix, only the first nrow*ncol values will be
 inserted.
}
\value{An nrow by ncol matrix containing the values in \samp{x}.}
\author{Jim Lemon}
\keyword{misc}
