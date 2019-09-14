\name{pie3D.labels}
\alias{pie3D.labels}
\title{Display labels on a 3D pie chart}
\description{
 Displays labels on a 3D pie chart.
}
\usage{
 pie3D.labels(radialpos,radius=1,height=0.1,theta=pi/6,
  labels,labelcol=par("fg"),labelcex=1.5,labelrad=1.25,minsep=0.3)
}
\arguments{
 \item{radialpos}{Position of the label in radians}
 \item{radius}{the radius of the pie in user units}
 \item{height}{the height of the pie in user units}
 \item{theta}{The angle of viewing in radians}
 \item{labels}{The label to display}
 \item{labelcol}{The color of the labels}
 \item{labelcex}{The character expansion factor for the labels}
 \item{labelrad}{The expansion for the labels around the pie.}
 \item{minsep}{The minimum angular separation between label positions.}
}
\value{
 nil
}
\details{
 \samp{pie3D.label} displays labels on a 3D pie chart. The positions
 of the labels are given as angles in radians (usually the bisector of the
 pie sectors). As the labels can be passed directly to \link{pie3D},
 this function would probably not be called by the user.
 
 \samp{pie3D.labels} tries to separate labels that are placed closer than
 \samp{minsep} radians. This simple system will handle minor crowding of
 labels. If labels are very crowded, capturing the return value of 
 \samp{pie3D} and editing the label positions may allow the user to avoid
 manually placing labels.
}
\author{Jim Lemon}
\seealso{\link{pie3D}, \link{draw.tilted.sector}}
\examples{
 pieval<-c(2,4,6,8)
 bisectors<-pie3D(pieval,explode=0.1,main="3D PIE OPINIONS")
 pielabels<-
  c("We hate\n pies","We oppose\n  pies","We don't\n  care","We just love pies")
 pie3D.labels(bisectors,labels=pielabels)
}
\keyword{misc}
