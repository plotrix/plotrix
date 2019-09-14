\name{draw.tilted.sector}
\alias{draw.tilted.sector}
\title{Display a 3D pie sector}
\description{
 Displays a 3D pie sector.
}
\usage{
 draw.tilted.sector(x=0,y=0,edges=NA,radius=1,height=0.1,theta=pi/6,
  start=0,end=pi*2,border=par("fg"),col=par("bg"),explode=0,shade=0.8)
}
\arguments{
 \item{x,y}{Position of the center of the pie sector in user units}
 \item{edges}{Number of edges to draw a complete ellipse}
 \item{radius}{the radius of the pie in user units}
 \item{height}{the height of the pie in user units}
 \item{theta}{The angle of viewing in radians}
 \item{start}{Starting angle of the sector}
 \item{end}{Ending angle of the sector}
 \item{border}{The color of the sector border lines}
 \item{col}{Color of the sector}
 \item{explode}{How far to "explode" the sectors in user units}
 \item{shade}{If > 0 and < 1, the proportion to reduce the
  brightness of the sector color to get a better 3D effect.}
}
\value{
 The bisector of the pie sector in radians.
}
\details{
 \samp{draw.tilted.sector} displays a single 3D pie sector. It is probably
 only useful when called from \link{pie3D}. The \samp{shade}
 argument proportionately reduces the brightness of the RGB color of
 the sector to produce a top lighted effect.

 If \samp{explode} is zero, only the top and outer side of each
 sector will be displayed. This will sometimes fix the problem of a pie with
 one huge sector greater than 3*pi/2 that cannot otherwise be drawn.
}
\author{Jim Lemon}
\seealso{\link{pie3D}}
\keyword{misc}
