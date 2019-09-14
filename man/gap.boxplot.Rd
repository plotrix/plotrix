\name{gap.boxplot}
\alias{gap.boxplot}
\title{Display a boxplot with a gap (missing range)}
\description{
 Displays a boxplot with a missing range.
}
\usage{
 gap.boxplot(x,...,gap=list(top=c(NA,NA),bottom=c(NA,NA)),
 range=1.5,width=NULL,varwidth=FALSE,notch=FALSE,outline=TRUE,
 names,xlim=NA,ylim=NA,plot=TRUE,border=par("fg"),col=NULL,log="",
 axis.labels=NULL,axes=TRUE,pars=list(boxwex=0.8,staplewex=0.5,outwex=0.5),
 horizontal=FALSE,add=FALSE,at=NULL,main=NULL)
}
\arguments{
 \item{x}{numeric vector or a list of vectors}
 \item{...}{arguments passed to \link{boxplot}.}
 \item{gap}{the range(s) to be omitted - a list with two components,
  \samp{top} and \samp{bottom} each specifying a range to omit. The
  default range of \samp{c(NA,NA)} means no omitted range}
 \item{range}{how far to extend the whiskers, (see \link{boxplot})}
 \item{width}{the relative widths of the boxes}
 \item{varwidth}{if TRUE, box widths are proportional to the square roots
  of the number of observations}
 \item{notch}{whether to display the confidence intervals for the
  median as notches}
 \item{outline}{whether to display outliers}
 \item{names}{optional names to display beneath each boxplot}
 \item{xlim,ylim}{Optional x and y axis limits for the plot.}
 \item{boxwex}{scale factor for box widths}
 \item{staplewex}{staple width proportional to box width}
 \item{outwex}{outlier line width}
 \item{plot}{dummy argument for consistency with \samp{boxplot} - always
  plots}
 \item{border}{optional color(s) for the box lines}
 \item{col}{optional color(s) to fill the boxes}
 \item{log}{whether to use a log scale - currently does nothing}
 \item{axis.labels}{Optional axis labels.}
 \item{axes}{Whether to display axes.}
 \item{pars}{optional parameters for consistency with \samp{boxplot}}
 \item{horizontal}{whether to plot horizontal boxplots - currently
  does nothing}
 \item{add}{whether to add the boxplot(s) to a current plot - currently
  does nothing.}
 \item{at}{optional horizontal locations for the boxplots.}
 \item{main}{a title for the plot.}
}
\value{
 A list with the same structure as returned by \samp{boxplot}, except that
 the values of elements beyond the gap(s) have their true positions on the
 plot rather than the original values. For example, in the second example,
 the value returned for the upper staple of the right boxplot is 14 rather
 than 20, due to the 6 unit gap.
}
\details{
 Displays boxplot(s) omitting range(s) of values on the top and/or bottom
 of the plot. Typically used when there are outliers far from the boxes.
 See \link{boxplot} for more detailed descriptions of the
 arguments. If the gaps specified include any of the values in the \samp{stats}
 matrix returned from \samp{boxplot}, the function will exit with an
 error message. This prevents generation of NAs in indexing operations,
 which would fail anyway. A gap can include part of a box, but it is unlikely 
 that this would be intended by the user.
 
 See \link{axis.break} for a brief discussion 
 of plotting on discontinuous coordinates.
}
\author{Jim Lemon}
\seealso{\link{gap.barplot},\link{gap.plot}}
\examples{
 twovec<-list(vec1=c(rnorm(30),-6),vec2=c(sample(1:10,40,TRUE),20))
 gap.boxplot(twovec,gap=list(top=c(12,18),bottom=c(-5,-3)),
 main="Show outliers separately")
 if(dev.interactive()) par(ask=TRUE)
 gap.boxplot(twovec,gap=list(top=c(12,18),bottom=c(-5,-3)),range=0,
 main="Include outliers in whiskers")
 par(ask=FALSE)
}
\keyword{misc}
