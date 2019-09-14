\name{violin_plot}
\alias{violin_plot}
\title{Display a "violin" plot}
\description{Displays violin plots (rotated kernel density plots on each
 side of boxplots).}
\usage{
 violin_plot(X=rnorm(50),at,add=FALSE,na.rm=TRUE,bw,violin_width,
 violin_end_width=0.005,equal_width=TRUE,show_box=TRUE,box_width=0.01,
 box_col="black",show_outliers=TRUE,outlier_pch=NA,range=1.5,xlim,ylim,
 axes=TRUE,ann=TRUE,xlab="",ylab="",x_axis_labels,main="Violin Plot",
 col="red",median_col="white",show_mean=FALSE,mean_pch=19,
 mean_pch_col="yellow",...)
}
\arguments{
 \item{X}{A vector or matrix or data frame of numeric values.}
 \item{at}{Horizontal position(s) for the violin plot(s).}
 \item{add}{Whether this violin should be added to an existing plot.}
 \item{na.rm}{Remove NA values. Passed to functions such as
  \samp{boxplot} or \samp{density}.}
 \item{bw}{Vector or bandwidth values for \samp{density}. Will be
  recycled. If not provided then will be calculated using \samp{bw.nrd0}.}
 \item{violin_width}{Multiplier to scale the width of the \samp{violin}.}
 \item{violin_end_width}{Multiplier to scale the width of the ends of the
  violin.}
 \item{equal_width}{Should all violin widths be equal?}
 \item{show_box}{Whether to display the box.}
 \item{box_width}{Multiplier for the width of internal boxes.}
 \item{box_col}{Fill color for the internal rectangle.}
 \item{show_outliers}{Whther to display outliers as points.}
 \item{outlier_pch}{Symbol for displaying outliers.}
 \item{range}{Passed to \samp{boxplot}.}
 \item{xlim,ylim}{Explicitly set the plot limits.}
 \item{axes}{Logical value indicating whether both axes should be
  drawn on the plot.}
 \item{ann}{Annotate the plots with axis titles and overall titles.}
 \item{xlab,ylab}{Labels for the X and Y axes.}
 \item{x_axis_labels}{Labels for the violins.}
 \item{main}{Title for the violin plot.}
 \item{col}{Fill color for the violin(s). Will be recycled.}
 \item{median_col}{Fill color for the median mark.}
 \item{show_mean}{Whether to plot the mean as well as the median.}
 \item{mean_pch}{Symbol to use for the mean.}
 \item{mean_pch_col}{Fill color for the mean symbol.}
 \item{...}{Extra arguments passed to \samp{polygon} used for
  representing violin(s).}
}
\details{
 \samp{violin_plot} displays one or more violin plots by drawing 
 rotated kernel density curves on each side of box plots.
}
\value{nil}
\author{Darshan Baral}
\examples{
 # plotting a data frame
 violin_plot(mtcars)

 set.seed(42)
 normvar<-c(rnorm(49),-3)
 unifvar<-runif(50,-2,2)
 normvar2<-rnorm(45)

 # plotting a matrix
 violin_plot(matrix(c(normvar,unifvar),ncol=2),
  main="Default Plot",x_axis_labels=c("Normal","Uniform"))

 # plotting with different colors and with at specified
 violin_plot(matrix(c(normvar,unifvar),ncol=2),at=1:3,
  main="Different colors and extra space",
  x_axis_labels=c("Normal","Uniform","Normal"),
  show_outliers=TRUE,col=c("blue","red"),median_col="lightgray",
  pch=6)

 # adding a violin to existing plot
 violin_plot(normvar2,at=3,add=TRUE,col="green",violin_width=1)
}
\keyword{misc}
