\name{getFigCtr}
\title{Get coordinates in the figure region in user units.}
\description{
 Calculates the coordinates of a proportional point of the figure
 region in user units.}
\usage{
 getFigCtr(pos=c(0.5,0.5))
}
\arguments{
 \item{pos}{The proportion of the figure region to find (see Details).}
}
\alias{getFigCtr}
\details{
 \samp{getFigCtr} reads parameters about the current plot and calculates the
 vertical and horizontal centers of the figure region by default. This is 
 typically useful for placing a centered title on plots where the left and
 right margins are very different.

 By changing \samp{pos}, any proportional points of the figure region can be
 returned. For example, \samp{pos=c(0,0)} will return the left and bottom
 coordinates of the figure region.
}
\value{A two element vector containing the coordinates of the center of the
 figure region in user units.}
\author{Jim Lemon (thanks to Karl Brand for the adjustable coordinates)}
\keyword{misc}
