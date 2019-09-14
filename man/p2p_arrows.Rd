\name{p2p_arrows}
\alias{p2p_arrows}
\title{Draw arrows between points}
\description{Displays arrows on an existing plot between specified
 points.}
\usage{
 p2p_arrows(x1,y1,x2,y2,space=0.05,col=par("fg"),...)
}
\arguments{
 \item{x1}{Starting x positions for the labels.}
 \item{y1}{Starting y positions for the labels.}
 \item{x2}{Ending x positions for the labels.}
 \item{y2}{Ending y positions for the labels.}
 \item{space}{The proportion of the distance between the points to
  leave as space before and after the arrow.}
 \item{col}{Color(s) for the arrows.}
 \item{...}{Extra arguments passed to \samp{arrows}.}
}
\details{
 \samp{p2p_arrows} displays arrows on a plot between one or more pairs
 of specified points.
}
\value{nil}
\author{Jim Lemon}
\seealso{\link{arrows}}
\keyword{misc}
