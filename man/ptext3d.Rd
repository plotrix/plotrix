\name{ptext3d}
\alias{ptext3d}
\title{ Display text on a 3D plot }
\description{
 Display text on a 3D plot defined by a list of coordinates
}
\usage{
 ptext3d(x,y=NULL,z=NULL,texts,pmat,...)
}
\arguments{
 \item{x,y,z}{ x, y and z coordinates to plot. \samp{x} may be a list with
   three components.}
 \item{pmat}{ matrix to transform coordinates. }
 \item{texts}{ text to display. }
 \item{...}{ Other arguments passed to \samp{segments}. }
}
\details{
 Draws text on a perspective plot.
}
\value{nil}
\author{Ben Bolker}
\keyword{misc}
