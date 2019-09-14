\name{seats}
\alias{seats}
\title{Arrange N seats in M semicircular rows}
\description{Compute seat positions in a semicircular parliament}
\usage{seats(N, M, r0 = 2.5)}
\arguments{
 \item{N}{Total number of seats.}
 \item{M}{Number of semicircular arcs on which to distribute the seats.}
 \item{r0}{Radius of the inner arc in user units.}
}
\value{
 A data frame including:
 \item{x}{The x positions of the seats to be plotted on semi-circular
  arcs.}
 \item{y}{The y positions of the seats to be plotted on semi-circular
  arcs.}
 \item{r}{The row numbers for each seat.}
 \item{theta}{The angle of each seat, going from pi to zero radians.}
}
\author{Duncan Murdoch and Barry Rowlingson}
\seealso{\link{election}}
\keyword{misc}
