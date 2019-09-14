\name{maxEmptyRect}
\alias{maxEmptyRect}
\title{ Find an empty space on a plot }
\description{
 Try to find the largest empty rectangle on a plot.
}
\usage{
 maxEmptyRect(ax,ay,x,y)
}
\arguments{
 \item{ax,ay}{The rectangle within which all of the points are contained.
  Usually the limits of a plot.}
 \item{x,y}{x and y positions of the points.}
}
\details{
 \samp{maxEmptyRect} searches the pairs of points on the plot to find
 the largest rectangular space within which none of the points lie.
 It does not guarantee that the space will be large enough to fit a
 legend or text.
 
 Two alternatives are the \samp{largest.empty} function in the 
 \pkg{Hmisc} package and the \samp{emptyspace} function. \samp{maxEmptyRect}
 appears to outperform \samp{emptyspace}, particularly in running time.
 However, \samp{emptyspace} will sometimes find a "squarer" rectangle when 
 \samp{maxEmptyRect} finds a slightly larger narrow rectangle.
}
\value{
 A list containing the area of the rectangle and the coordinates of the
 lower left and upper right corners (as used in \samp{rect}) of the rectangle
 found.
}
\author{Hans Borchers}
\references{
 A. Naamad, D. T. Lee, and W.-L. Hsu (1984). On the Maximum Empty
 Rectangle Problem. Discrete Applied Mathematics, 8: 267-277.
}
\examples{
 x<-runif(100)
 y<-runif(100)
 plot(x,y,main="Find the maximum empty rectangle",xlab="X",ylab="Y")
 mer<-maxEmptyRect(c(0,1),c(0,1),x,y)
 rect(mer$rect[1],mer$rect[2],mer$rect[3],mer$rect[4],border="red")
}
\keyword{misc}
