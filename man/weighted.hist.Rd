\name{weighted.hist}
\alias{weighted.hist}
\title{
 Display a weighted histogram
}
\description{
 Calculate the counts of the weighted values in specified bins and 
 optionally display either a frequency or density histogram.
}
\usage{
 weighted.hist(x,w,breaks="Sturges",col=NULL,plot=TRUE,
 freq=TRUE,ylim=NA,ylab=NULL,xaxis=TRUE,...)
}
\arguments{
 \item{x}{A vector of numeric values}
 \item{w}{A vector of weights at least as long as x.}
 \item{breaks}{The endpoints of the ranges into which to count the weighted
  values.}
 \item{col}{An optional vector of colors for the bars of the histogram.}
 \item{plot}{Whether to plot a histogram.}
 \item{freq}{Whether to plot counts or densities.}
 \item{ylim}{The limits of the plot ordinate.}
 \item{ylab}{Label for the ordinate.}
 \item{xaxis}{Whether to display an X axis.}
 \item{...}{additional arguments passed to \samp{barplot}.}
}
\details{
 \samp{weighted.hist} calculates the weighted counts of values falling 
 into the ranges specified by \samp{breaks}. Instead of counting each 
 value as 1, it counts the corresponding value in \samp{w} (the weight).
 
 \samp{breaks} may be specified by a monotonically increasing vector 
 of numbers that are interpreted as the endpoints of the ranges, a 
 single number representing the number of ranges desired or the name 
 of the function to calculate the ranges (see \link{hist}).
 If a vector of numbers is passed that does not include all values in 
 \samp{x}, the user is warned.
}
\value{A list containing:

breaks - The endpoints of the intervals

counts - The weighted counts

density - The weighted counts divided by their sum.

mids - The midpoints of the intervals and the bars displayed.

xname - the name of \samp{x}.
}
\author{Jim Lemon and Hadley Wickham - thanks to Ben Graf for asking for a
 custom x axis option and Martin Maechler for fixing the barplot problem}
\seealso{\link{hist}}
\examples{
 testx<-sample(1:10,300,TRUE)
 testw<-seq(1,4,by=0.01)
 weighted.hist(testx,testw,breaks=1:10,main="Test weighted histogram")
}
\keyword{misc}
