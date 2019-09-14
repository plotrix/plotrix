\name{triax.plot}
\alias{triax.plot}
\title{Triangle plot}
\description{
 Display a triangle plot with optional grid.
}
\usage{
 triax.plot(x=NULL,main="",at=seq(0.1,0.9,by=0.1),
 axis.labels=NULL,tick.labels=NULL,col.axis="black",cex.axis=1,
 cex.ticks=1,
 align.labels=TRUE,show.grid=FALSE,col.grid="gray",lty.grid=par("lty"),
 cc.axes=FALSE,show.legend=FALSE,label.points=FALSE,point.labels=NULL,
 col.symbols="black",pch=par("pch"),mar=c(5,2,4,2),no.add=TRUE,...)
}
\arguments{
 \item{x}{Matrix where each row is three proportions or percentages
  that must sum to 1 or 100 respectively.}
 \item{main}{The title of the triangle plot. Defaults to nothing.}
 \item{at}{The tick positions on the three axes.}
 \item{axis.labels}{Labels for the three axes in the order left, right,
  bottom. Defaults to the column names.}
 \item{tick.labels}{The tick labels for the three axes as a list with
  three components l, r and b (left, right and bottom).
  Defaults to argument \samp{at} (proportions).}
 \item{col.axis}{Color of the triangular axes, ticks and labels.}
 \item{cex.axis}{Character expansion for axis labels.}
 \item{cex.ticks}{Character expansion for the tick labels.}
 \item{align.labels}{Logical - whether to align axis and tick labels with
  the axes.}
 \item{show.grid}{Whether to display grid lines at the ticks.}
 \item{col.grid}{Color of the grid lines. Defaults to gray.}
 \item{lty.grid}{Type of line for the grid.}
 \item{cc.axes}{Whether axes and axis ticks should be clockwise or
  counterclockwise.}
 \item{show.legend}{Logical - whether to display a legend.}
 \item{label.points}{Logical - whether to call \samp{thigmophobe.labels} to
  label the points.}
 \item{point.labels}{Optional labels for the points and/or legend.}
 \item{col.symbols}{Color of the symbols representing each value.}
 \item{pch}{Symbols to use in plotting values.}
 \item{mar}{Margins for the triangle plot.}
 \item{no.add}{Whether to restore the previous plotting parameters
  (\samp{TRUE}) or leave them, allowing more points to be added.}
 \item{...}{Additional arguments passed to \samp{points}.}
}
\details{
 \samp{triax.plot} displays a triangular plot area on which proportions
  or percentages are displayed. A grid or legend may also be displayed.
}
\note{
 A three axis plot can only properly display one or more
 sets of three proportions that each sum to 1 (or percentages that sum
 to 100). Other values may be scaled to proportions (or percentages), 
 but unless each set of three sums to 1 (or 100), they will not plot
 properly and \samp{triax.points} will complain appropriately. Note also
 that \samp{triax.plot} will only display properly in a square plot,
 which is forced by \samp{par(pty="s")}.
 
 In case the user does want to plot values with different sums, the
 axis tick labels can be set to different ranges to accomodate this.
 \samp{triax.points} will still complain, but it will plot the values.
 
 If planning to add points with \samp{triax.points} call \samp{triax.plot}
 with \samp{no.add=FALSE} and restore plotting parameters after the
 points are added.
}
\value{
 A list containing \samp{xypos} (the \samp{x,y} positions plotted)
 and \samp{oldpar} (the plotting parameters at the time \samp{triax.plot}
 was called).
}
\author{
 Jim Lemon - thanks to Ben Daughtry for the info on counterclockwise axes.
}
\seealso{
 \link{triax.points}, \link{triax.abline}, \link{thigmophobe.labels}
}
\examples{
 data(soils)
 triax.plot(soils[1:10,],main="DEFAULT")
 triax.plot(soils[1:10,],main="PERCENTAGES (Counterclockwise axes)",
  tick.labels=list(l=seq(10,90,by=10),r=seq(10,90,by=10),b=seq(10,90,by=10)),
  pch=3,cc.axes=TRUE)
 triax.return<-triax.plot(soils[1:6,],main="GRID AND LEGEND",
  show.grid=TRUE,show.legend=TRUE,col.symbols=1:6,pch=4)
 # triax.plot changes a few parameters
 par(triax.return$oldpar)
}
\keyword{misc}
