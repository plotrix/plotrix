\name{plotH}
\alias{plotH}
\alias{plotH.formula}
\alias{plotH.default}
\title{Scatterplot with histogram-like bars.}
\description{
 Scatterplot with histogram-like bars; a modification of
 \samp{plot(...,type="h")}.
}
\usage{
 plotH(x,...)

 \method{plotH}{formula}(x,data=NULL,xlab=names(mf)[2],ylab=names(mf)[1],...)

 \method{plotH}{default}(x,y,xlab=paste(deparse(substitute(x))),
  ylab=paste(deparse(substitute(y))),width=0.6,ylim=NULL,col="gray",...)
}
\arguments{
 \item{x}{Vector of x-coordinates or a formula of the form y~x
  (see below for y).}
 \item{y}{Vector of y-coordinates.}
 \item{xlab}{A string for labeling the x-axis.}
 \item{ylab}{A string for labeling the y-axis.}
 \item{data}{The data frame from which the formula should be evaluated.}
 \item{width}{A numeric that indicates the width of the bars.}
 \item{ylim}{A vector of length two that indicates the limits over which to
  plot the y-axis. See details.}
 \item{col}{A string that indicates the fill color for the bars.}
 \item{...}{Additional arguments sent to the \samp{plot} or \samp{barplot}
  functions.}
}
\details{
 \samp{plotH} is meant to be a modification of the type="h" version of
 \samp{plot} such that the "bars" appears as actual rectangles rather than
 vertical lines. It defaults so that the lower bound of the y-axis is 0;
 change to \samp{ylim=NULL} to over-ride this default (and return to the
 default used in \samp{plot}.
 
 A pass-through to \samp{barplot} is used if the \samp{x} (or "RHS") variable
 is categorical.
}
\value{None, but a plot is produced.}
\note{This function is currently experimental.}
\author{Derek Ogle}
\seealso{\link{plot}, \link{barplot}}
\examples{
  d<-data.frame(x=c(1,5,10:20),y=runif(13)+1,
                yn1=runif(13)-0.5,yn2=runif(13)-2,
                g=factor(sample(c("A","B","C"),13,replace=TRUE)))
  # new plotH function with formula notation
  plotH(y~x,data=d)
  # old plot() function with formula notation -- for comparison's purpose
  plot(y~x,data=d,type="h")
  # new function over-riding default ylim, increasing bar width,
  # and changing bar color
  plotH(y~x,data=d,ylim=range(d$y),width=0.9,col="red")
  # handling some negative values
  plotH(yn1~x,data=d) # not so good, because of default ylim
  plotH(yn1~x,data=d,ylim=c(0,max(d$yn1)))  # old look
  # handling all negative values
  plotH(yn2~x,data=d)
  plotH(yn2~x,data=d,ylim=range(d$yn2))  # old look
  # example of pass-through to barplot
  smry<-by(d$y,d$g,mean)
  plotH(levels(d$g),smry,ylab="Mean of Random Variable",xlab="Group")
  # example of non-formula usage
  x1 <- d$x
  y1 <- d$y
  plotH(x1,y1,col="blue")
}
\keyword{misc}
