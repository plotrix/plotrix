\name{gap_barp}
\alias{gap_barp}
\title{
 Display a barplot with a gap (missing range) on one axis
}
\description{
 Displays a barplot with a missing range.
}
\usage{
 gap_barp(height,gap,width=0.4,names.arg=names(height),
 col=NULL,main="",xlab="",ylab="",xlim=NULL,ylim=NULL,x=NULL,
 height.at=pretty(height),height.lab=NULL,...)
}
\arguments{
 \item{height}{a vector of data values}
 \item{gap}{the range of values to be left out}
 \item{width}{the proportion of bar width to bar spacing divided by 2.
  width=1 means no spaces between the bars.}
 \item{names.arg}{labels for the bars.}
 \item{col}{color(s) in which to plot the values}
 \item{main}{title for the plot.}
 \item{xlab}{label for the x axis}
 \item{ylab}{label for the y axis}
 \item{xlim}{Optional x limits for the plot}
 \item{ylim}{optional y limits for the plot}
 \item{x}{optional x positions for the bars.}
 \item{height.at}{explicit positions for the y axis ticks}
 \item{height.lab}{explicit labels for the y axis ticks.}
 \item{...}{arguments passed to \samp{barp}.}
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
 remember to subtract the gap from the upper or lower limit.
}
\author{Jim Lemon}
\seealso{\link{barp}}
\examples{
 oneout<-c(rnorm(5,sd=5),20,rnorm(5,sd=5))
 gap_barp(oneout,gap=c(8,16),xlab="Index",height.at=c(-5,0,5,20),
  ylab="Group values",main="Barplot with gap above zero")
 oneout[6]<--20
 gap_barp(oneout,gap=c(-8,-16),xlab="Index",height.at=c(-20,-5,0,5),
  ylab="Group values",main="Barplot with gap below zero")
}
\keyword{misc}
