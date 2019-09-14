\name{mtext3d}
\alias{mtext3d}
\title{ Display text in the margins of a 3D plot }
\description{
 Display text in the margins of a 3D plot.
}
\usage{
 mtext3d(edge,pmat,labels=TRUE,at=NULL,dist=0.3,xpd=NA,...)
}
\arguments{
 \item{edge}{ which axis to calculate.}
 \item{pmat}{ matrix to transform coordinates. }
 \item{labels}{ labels to display in the margin. }
 \item{at}{ position on the axis. }
 \item{dist}{ Offset of the axis. }
 \item{xpd}{ set clipping for display. }
 \item{...}{ additional arguments passed to ptext3d. }
}
\value{nil}
\author{Ben Bolker}
\keyword{misc}
