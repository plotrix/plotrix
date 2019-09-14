\name{staxlab}
\alias{staxlab}
\title{ Place staggered or angled labels on an axis }
\description{
 Places labels on an axis in a regular staggered order or at an angle
}
\usage{
 staxlab(side=1,at,labels,nlines=2,top.line=0.5,line.spacing=0.8,
  srt=NULL,ticklen=0.03,adj=1,...)
}
\arguments{
 \item{side}{axis on which to place the labels, as in \samp{axis}}
 \item{at}{where to place the labels in user units, as in \samp{axis}}
 \item{labels}{text strings}
 \item{nlines}{How many lines to use to stagger the labels.}
 \item{top.line}{Distance from the axis to place the first line of text.}
 \item{line.spacing}{Spacing between lines of text labels.} 
 \item{srt}{Text rotation.}
 \item{ticklen}{Proportion of plot height in user units to place text
  below the plot.}
 \item{adj}{horizontal adjustment of the labels.}
 \item{...}{Additional arguments to be passed to \samp{mtext} or \samp{text}.}
}
\note{
 This function is mainly useful when either long axis labels or a large
 number of labels are to be placed without overlapping. It staggers the 
 labels along the axis specified. The user may wish to increase the space
 beneath the plot using \samp{mar} before calling \samp{staxlab}. It is
 probably only useful on the bottom or left side of the plot.

 If \samp{srt} is not NULL, the labels will be rotated \samp{srt} degrees
 and placed below the plot. This method will only place labels at the
 bottom. Note that this option only works on the lower and left axes.
}
\value{nil}
\author{Jim Lemon (thanks to Tim Elwell-Sutton for the log axis fix)}
\seealso{\link{mtext}}
\examples{
 x<-rnorm(12)
 plot(x,axes=FALSE)
 box()
 months<-c("January","February","March","April","May","June",
  "July","August","September","October","November","December")
 staxlab(1,1:12,months)
 plot(x,axes=FALSE)
 box()
 staxlab(1,1:12,months,srt=45)
 ylabels<-round(seq(min(x),max(x),length.out=10),3)
 staxlab(2,ylabels,ylabels,srt=45)
}
\keyword{misc}
