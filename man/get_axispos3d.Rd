\name{get_axispos3d}
\alias{get_axispos3d}
\title{ Get axis positions on a 3D plot }
\description{
 Calculate the axis positions on a 3D plot.
}
\usage{
 get_axispos3d(edge,pmat,at,pos=NULL, dist=0)
}
\arguments{
 \item{edge}{ which axis to calculate.}
 \item{pmat}{ matrix to transform coordinates. }
 \item{at}{ position on the axis. }
 \item{pos}{ position of the axis relative to the other axes. }
 \item{dist}{ Offset of the axis. }
}
\value{A position in 2D coordinates}
\author{Ben Bolker}
\keyword{misc}
