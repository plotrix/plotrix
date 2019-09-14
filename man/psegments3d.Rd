\name{psegments3d}
\alias{psegments3d}
\title{ Draw segments on a 3D plot }
\description{
 Draw segments on a 3D plot defined by a list of coordinates
}
\usage{
 psegments3d(x,y=NULL,z=NULL,pmat,...)
}
\arguments{
  \item{x,y,z}{ x, y and z coordinates to plot. \samp{x} may be a list with
   three components.}
 \item{pmat}{ matrix to transform coordinates. }
  \item{...}{ Other arguments passed to \samp{segments}. }
}
\details{
 Draws segments on a perspective plot.
}
\value{nil}
\author{Ben Bolker}
\keyword{misc}
