\name{drawSectorAnnulus}
\alias{drawSectorAnnulus}
\title{Display a radial pie sector}
\description{
 Displays a radial pie sector with optional annuli.
}
\usage{
 drawSectorAnnulus(angle1,angle2,radius1,radius2,col,angleinc=0.03)
}
\arguments{
 \item{angle1,angle2}{Start and end angle for the sector.}
 \item{radius1,radius2}{Start and end of the radial extent of the annulus.}
 \item{col}{Color of the sector.}
 \item{angleinc}{The angular increment to use in drawing the arcs.}
}
\value{nil}
\details{
 \samp{drawSectorAnnulus} displays a single radial pie sector. It is probably
 only useful when called from \link{radial.pie}.
}
\author{Jim Lemon}
\seealso{\link{radial.pie}}
\keyword{misc}
