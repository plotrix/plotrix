\name{zoomInPlot}
\alias{zoomInPlot}
\title{
 Display a plot with a rectangular section expanded in an adjacent plot
}
\description{
 Display one plot on the left half of a device and an expanded section of that
 plot on the right half of the device with connecting lines showing the expansion.
}
\usage{
 zoomInPlot(x,y=NULL,xlim=NULL,ylim=NULL,rxlim=xlim,rylim=ylim,xend=NA,
  zoomtitle=NULL,titlepos=NA,...)
}
\arguments{
 \item{x,y}{numeric data vectors. If \samp{y} is not specified, it is set equal
  to \samp{x} and \samp{x} is set to \samp{1:length(y)}.}
 \item{xlim,ylim}{Limits for the initial plot.}
 \item{rxlim,rylim}{Limits for the expanded plot. These must be within the above.}
 \item{xend}{Where to end the segments that indicate the expansion. Defaults to
  just left of the tick labels on the left ordinate.}
 \item{zoomtitle}{The title of the plot, display in the top center.}
 \item{titlepos}{The horizontal position of the title in user units of the
  zoomed plot.}
 \item{...}{additional arguments passed to \samp{plot}.}
}
\details{
 \samp{zoomInPlot} sets up a two column layout in the current device and calls
 \samp{plot} to display a plot in the left column. It then draws a rectangle
 corresponding to the \samp{rxlim} and \samp{rylim} arguments and displays a
 second plot of that rectangle in the right column. It is currently very simple
 and will probably become more flexible in future versions.

 It just has. If \samp{rxlim} is set to NA, \samp{locator} will be called and
 the user can define the zoomed rectangle by clicking on each corner. This is a
 shameless ripoff of a suggestion by Greg Snow on the help list. Thanks, Greg.
}
\value{nil}
\author{Jim Lemon}
\seealso{\link{plot}}
\examples{
 zoomInPlot(rnorm(100),rnorm(100),rxlim=c(-1,1),rylim=c(-1,1),
  zoomtitle="Zoom In Plot",titlepos=-1.5)
}
\keyword{misc}
