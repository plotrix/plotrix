\name{gap.barplot}
\alias{gap.barplot}
\title{
 Display a barplot with a gap (missing range) on one axis
}
\description{
 Displays a barplot with a missing range.
}
\usage{
 gap.barplot(y,gap,xaxlab,xtics,yaxlab,ytics,xlim=NA,ylim=NA,xlab=NULL,
  ylab=NULL,horiz=FALSE,col,...)
}
\arguments{
 \item{y}{a vector of data values}
 \item{gap}{the range of values to be left out}
 \item{xaxlab}{labels for the x axis ticks}
 \item{xtics}{position of the x axis ticks}
 \item{yaxlab}{labels for the y axis ticks}
 \item{ytics}{position of the y axis ticks}
 \item{xlim}{Optional x limits for the plot}
 \item{ylim}{optional y limits for the plot}
 \item{xlab}{label for the x axis}
 \item{ylab}{label for the y axis}
 \item{horiz}{whether to have vertical or horizontal bars}
 \item{col}{color(s) in which to plot the values}
 \item{...}{arguments passed to \samp{barplot}.}
}
\value{
 The center positions of the bars.
}
\details{
 Displays a barplot omitting a range of values on the X or Y axis. Typically 
 used when there is a relatively large gap in the range of values 
 represented as bar heights. See \link{axis.break} for a brief 
 discussion of plotting on discontinuous coordinates.
 
 If the user does not ask for specific y limits, the function will calculate
 limits based on the range of the data values. If passing specific limits, 
 remember to subtract the gap from the upper limit.
}
\author{Jim Lemon}
\seealso{\link{gap.barplot}}
\examples{
 twogrp<-c(rnorm(10)+4,rnorm(10)+20)
 gap.barplot(twogrp,gap=c(8,16),xlab="Index",ytics=c(3,6,17,20),
  ylab="Group values",main="Barplot with gap")
 gap.barplot(twogrp,gap=c(8,16),xlab="Index",ytics=c(3,6,17,20),
  ylab="Group values",horiz=TRUE,main="Horizontal barplot with gap")
}
\keyword{misc}
