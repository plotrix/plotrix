\name{placeLabels}
\alias{placeLabels}
\title{ Place labels in boxes }
\description{
 Places labels in boxes on an existing plot
}
\usage{
 placeLabels(x,y=NA,labels,pointer=TRUE,cex=1,labelcol=par("fg"),
 labelbg="white",border=par("fg"),pointercol=par("fg"),
 pch=1,col=1,bg="white",flagcol="red")
}
\arguments{
 \item{x,y}{x and y position of the centers of the labels. \samp{x} can be an
  \link{xy.coords} list.}
 \item{labels}{Text strings}
 \item{pointer}{Whether to draw a line segment from the label to the 
  points labeled.}
 \item{cex}{Character expansion. See \samp{text}.}
 \item{labelcol}{The color(s) of the text in the labels.}
 \item{labelbg}{The background color(s) for the labels.}
 \item{border}{The color(s) for the borders around the rectangles.}
 \item{pointercol}{The color(s) of the pointer lines.}
 \item{pch}{The symbol(s) to use when redisplaying the original points 
  (see Details).}
 \item{col}{The color(s) of the original points.}
 \item{bg}{The background color(s) of the original points.}
 \item{flagcol}{The color to use for "flagging" each point.}
}
\details{
 \samp{placeLabels} steps through the points indexed by \samp{x} and
 \samp{y}, allowing the operator to manually place the labels for each 
 point. Each point is "flagged" by displaying a small colored circle (red
 by default). When the label for that point has been placed, the original
 symbol is displayed and the next point is flagged.
 
 Each point and label can have different colors and backgrounds.
}
\note{
 This function is handy for one-off plots with a moderate number of 
 points. It can be very useful for plots with clumps of points.
}
\value{nil - adds labels to an existing plot.}
\author{Jim Lemon - thanks to Marna Wagley for the idea.}
\seealso{\link{spread.labels}, \link{thigmophobe.labels}}
\examples{
 # won't check because of the call to locator
 \dontrun{
  x<-rnorm(10)
  y<-rnorm(10)
  plot(x,y)
  placeLabels(x,y,LETTERS[1:10],flagcol="purple")
 }
}
\keyword{misc}
