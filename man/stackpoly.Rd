\name{stackpoly}
\alias{stackpoly}
\title{
 Display the columns of a matrix or data frame as stacked polygons
}
\description{
 Plot one or more columns of numeric values as the top edges of polygons
 instead of lines.
}
\usage{
 stackpoly(x,y=NULL,main="",xlab="",ylab="",xat=NA,xaxlab=NA,
  xlim=NA,ylim=NA,lty=1,lwd=1,border=NA,col=NULL,staxx=FALSE,stack=FALSE,
  axis2=TRUE,axis4=TRUE,padj=0,...)
}
\arguments{
 \item{x}{A numeric data frame or matrix with the \samp{x} values. If
  \samp{y} is NULL, these will become the \samp{y} values and the \samp{x}
  positions will be the integers from 1 to dim(x)[1].}
 \item{y}{The \samp{y} values.}
 \item{main}{The title for the plot.}
 \item{xlab,ylab}{x and y axis labels for the plot.}
 \item{xat}{Where to put the optional xaxlabs.}
 \item{xaxlab}{Optional labels for the x positions.}
 \item{xlim}{Optional x limits.}
 \item{ylim}{Optional y limits.}
 \item{lty}{Line type for the polygon borders.}
 \item{lwd}{Line width for the polygon borders.}
 \item{border}{Color for the polygon borders.}
 \item{col}{Color to fill the polygons. If NULL, \samp{rainbow} will be
  called to generate the colors. If NA, the polygons will not be filled.}
 \item{staxx}{Whether to call \samp{staxlab} to stagger the x axis labels.}
 \item{stack}{Whether to stack the successive values on top of each other.}
 \item{axis2}{Whether to display the left ordinate on the plot.}
 \item{axis4}{Whether to display the right ordinate on the plot.}
 \item{padj}{Vertical justfication of the x axis labels, defaulting to "top".
  Can be a vector with an element for each label.}
 \item{...}{Additional arguments passed to \samp{plot}.}
}
\value{
 nil
}
\details{
 \samp{stackpoly} is similar to a line plot with the area under the
 lines filled with color(s). Ideally, each successive set of y values
 is greater than the values in the previous set so that the polygons 
 form a rising series of crests. If \samp{stack} is TRUE, this is not a
 problem unless some values of \samp{x} are negative.
 
 If \samp{x} or \samp{y} is a vector, not a matrix or list, the values will
 be displayed as a "waterfall plot".

 The options for \samp{axis2} and \samp{axis4} can be used to produce
 panel plots. See the last example.
}
\author{Jim Lemon and Thomas Petzoldt (waterfall plot option) - thanks to
 Phil Novack-Gottshall for the mismatched x and y fix}
\seealso{\link{polygon}}
\examples{
 testx<-matrix(abs(rnorm(100)),nrow=10)
 stackpoly(matrix(cumsum(testx),nrow=10),main="Test Stackpoly I",
  xaxlab=c("One","Two","Three","Four","Five",
  "Six","Seven","Eight","Nine","Ten"),border="black",staxx=TRUE)
 stackpoly(testx,main="Test Stackpoly II",
  xaxlab=c("One","Two","Three","Four","Five",
  "Six","Seven","Eight","Nine","Ten"),border="black",
  staxx=TRUE,stack=TRUE)
 layout(matrix(1:2,nrow=1))
 oldmar<-par(mar=c(5,4,4,0))
 stackpoly(rev(sort(testx-mean(testx))),
  main="Waterfall Plot (x-mean)",xat=seq(10,90,by=10),
  xlab="Index",ylab="Value",lwd=3,col="green",border="black",
  axis4=FALSE)
 ylim<-par("usr")[3:4]
 par(mar=c(5,0,4,4))
 stackpoly(rev(sort((testx-mean(testx))/sd(as.vector(testx)))),
  ylim=ylim,main="Waterfall Plot ((x-mean)/sd)",xat=seq(10,90,by=10),
  xlab="Index",lwd=3,col="lightblue",border="black",axis2=FALSE)
 par(oldmar)
}
\keyword{misc}
