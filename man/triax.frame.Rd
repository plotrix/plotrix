\name{triax.frame}
\alias{triax.frame}
\title{Triangle plot frame}
\description{
 Display a three axis frame with optional grid.
}
\usage{
 triax.frame(at=seq(0.1,0.9,by=0.1),axis.labels=NULL,
 tick.labels=NULL,col.axis="black",cex.axis=1,cex.ticks=1,
 align.labels=TRUE,show.grid=FALSE,col.grid="gray",lty.grid=par("lty"),
 cc.axes=FALSE)
}
\arguments{
 \item{at}{The tick positions on the three axes.}
 \item{axis.labels}{Labels for the three axes in the order bottom, right
  left. Defaults to the column names.}
 \item{tick.labels}{The tick labels for the axes.
  Defaults to argument \samp{at} (proportions).}
 \item{col.axis}{Color of the triangular axes, ticks and labels.}
 \item{cex.axis}{Character expansion for axis labels.}
 \item{cex.ticks}{Character expansion for the tick labels.}
 \item{align.labels}{Logical - whether to align axis and tick labels with
  the axes.}
 \item{show.grid}{Whether to display grid lines at the ticks.}
 \item{col.grid}{Color of the grid lines. Defaults to gray.}
 \item{lty.grid}{Type of line for the grid.}
 \item{cc.axes}{Whether to align the axes clockwise or counterclockwise.}
}
\details{
 \samp{triax.frame} displays a triangular plot area on which proportions
  or percentages may be displayed. An optional grid may also be displayed.
  If \samp{cc.axes} is TRUE, both the axes and axis ticks will be in
  reverse order.
}
\value{nil}
\author{Jim Lemon}
\seealso{\link{triax.points},\link{triax.abline},\link{triax.fill}}
\examples{
 triax.plot(main="DEFAULT")
 triax.plot(main="Clockwise axes",cc.axes=TRUE)
}
\keyword{misc}
