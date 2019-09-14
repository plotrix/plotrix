\name{color.scale.lines}
\alias{color.scale.lines}
\title{Line segments with scaled colors}
\description{Display line segments with colors scaled to numeric values.}
\usage{
 color.scale.lines(x,y,reds,greens,blues,col=NA,colvar=NA,...)
}
\arguments{
 \item{x,y}{Numeric vectors or a list with at least two components,
  the first two of which must be named x and y.}
 \item{reds,greens,blues}{Color ranges into which to scale the
  numeric values.}
 \item{col}{One or more colors to use for the resultant lines. Will
  be recycled if necessary.}
 \item{colvar}{A numeric vector from which to scale the colors.}
 \item{...}{Additional arguments passed to \samp{segments}.}
}
\details{
 \samp{color.scale.lines} displays line segments that can be individually
  colored according to a variety of methods. In order of precedence, if
  \samp{col} is not NA, the color values passed will be used. If
  \samp{colvar} is not NA, the function will call \samp{color.scale} with
  the three color range arguments to determine the line colors. If
  \samp{colvar} is the same length as \samp{length(x)-1}, exactly enough 
  colors for the number of lines displayed will be calculated. If shorter,
  some colors will be recycled and if longer, some colors will not be used.
  Finally, the values in \samp{y} will be color-scaled if both of the above
  arguments are NA. Thus the user can pass predetermined colors, use colors
  scaled from an arbitrary vector of numerical values or use the \samp{y}
  values. See \samp{color.scale} for an explanation of specifying color
  ranges.
}
\note{
 The function is useful for highlighting a numeric dimension or adding
 an extra "dimension" to a plot.
}
\value{nil}
\author{Jim Lemon}
\seealso{\link{color.scale}}
\examples{
 # color a random walk "hot" (red) to "cold" (blue) on its distance
 # from the starting point
 x<-c(0,cumsum(rnorm(99)))
 y<-c(0,cumsum(rnorm(99)))
 xydist<-sqrt(x*x+y*y)
 plot(x,y,main="Random walk plot",xlab="X",ylab="Y",type="n")
 color.scale.lines(x,y,c(1,1,0),0,c(0,1,1),colvar=xydist,lwd=2)
 boxed.labels(x,y,labels=1:100,border=FALSE,cex=0.5)
 # now color the lines to show whether each step went away from
 # or toward the starting position
 color.scale.lines(x,y,col=2+(diff(xydist)>0))
 boxed.labels(x,y,labels=1:100,border=FALSE,cex=0.5)
}
\keyword{misc}
