\name{get.tablepos}
\alias{get.tablepos}
\title{Get the position for a legend or table}
\description{
 Gets the x and y positions and justification for a legend or table in
 user units from the string descriptors like "top".
}
\usage{
 get.tablepos(x)
}
\arguments{
  \item{x}{A valid position descriptor like "top".}
}
\details{
 \samp{get.tablepos} checks for one of the nine valid position descriptors:

 topleft, top, topright, left, center, right, bottomleft, bottom and bottomright.

 If none of these descriptors are found, it will return the center position
 and justification.
}
\value{
 A list containing:
 \item{x}{x position}
 \item{y}{y position}
 \item{xjust}{x (horizontal) justification}
 \item{yjust}{y (vertical) justification}
}
\author{Jim Lemon}
\seealso{\link{addtable2plot}, \link{legendg}}
\keyword{misc}
