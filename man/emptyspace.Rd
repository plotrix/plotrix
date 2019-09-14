\name{emptyspace}
\alias{emptyspace}
\title{ Find an empty space on a plot }
\description{
 Try to find the largest empty rectangle on a plot.
}
\usage{
 emptyspace(x,y=NULL)
}
\arguments{
 \item{x,y}{x and y positions of the points on the plot.}
}
\details{
 \samp{emptyspace} searches the pairs of points on the plot to find
 the largest rectangular space within which none of the points lie.
 It does not guarantee that the space will be large enough to fit a
 legend or text.
 
 Two alternatives are the \samp{largest.empty} function in the 
 \pkg{Hmisc} package and the \samp{maxEmptyRect} function. While
 \samp{maxEmptyRect} will generally outperform \samp{emptyspace},
 \samp{emptyspace} will sometimes find a slightly smaller, but
 "squarer" rectangle.
}
\value{
 The \samp{x} and \samp{y} coordinates of the center of the rectangle
 found.
}
\author{Ray Brownrigg}
\examples{
 x<-rnorm(100)
 y<-rnorm(100)
 plot(x,y,main="Find the empty space",xlab="X",ylab="Y")
 es<-emptyspace(x,y)
 # use a transparent background so that any overplotted points are shown
 boxed.labels(es,labels="Here is the\nempty space",bg="transparent")
}
\keyword{misc}
