\name{find_max_cell}
\alias{find_max_cell}
\title{Maximum (or minimum) value cell in a matrix.}
\description{
 Find the indices of the maximum value in a matrix.
}
\usage{ find_max_cell(x,max=TRUE) }
\arguments{
 \item{x}{a numeric matrix}
 \item{max}{The default is to return the indices of the maximum value(s).
  \samp{max=FALSE} returns those of the minimum.}
}
\value{
A list containing the column (x) and row (y) indices.
}
\note{
Intended to enable the user to mark cells in \samp{color2D.matplot}.
Remember to subtract 0.5 from both values to center the mark in the cell.
}
\author{Jim Lemon}
\keyword{misc}

