\name{joyPlot}
\alias{joyPlot}
\title{Display a series of density curves.}
\usage{
 joyPlot(x,mar=c(5,4,4,2),newrange=c(0,1),border=NA,fill=NULL,
 main="",xlab="",ylab="",xlim=NA,line_labels=names(x),xat=NULL,
 xaxlab=NULL)
}
\arguments{
 \item{x}{A list of density curves or other objects with x and y values.}
 \item{mar}{Margins for the plot.}
 \item{newrange}{Passed to \samp{rescale} to scale the values to fit the
  bands on the plot. See Details.}
 \item{border}{The border colors for the polygons.}
 \item{fill}{Optional fill colors for the polygons.}
 \item{main}{Text for the title for the plot.}
 \item{xlab,ylab}{The x and y axis labels.}
 \item{xlim}{Optional limit for the x axis as \samp{density} returns
  values outside the range of the values in \samp{x}.}
 \item{line_labels}{Labels for the lines/polygons dieplayed.}
 \item{xat}{Optional custom x tick positions.}
 \item{xaxlab}{Optional custom x tick labels.}
}
\description{
 \samp{joyPlot} displays a matrix of density curves or other two
 component lists whose names are \samp{x} and \samp{y}. The labels for 
 each line/polygon are displayed on the left axis of the plot. 
 The labels default to the names of the components of \samp{x} if these 
 are present.
}
\details{
 The density curves or other x/y lists will be scaled so that the largest
 will fit into the one user unit band allocated for each curve by default.
 If the second value of \samp{newrange} is changed, the heights of the 
 curves will change proportionately. See the third exampls.
}
\value{nil}
\author{Jim Lemon}
\seealso{\link{plot}, \link{stackpoly}}
\examples{
 x1<-c(sample(20:50,20),sample(40:80,30))
 x2<-c(sample(10:40,30),sample(50:90,30))
 x3<-sample(20:90,50)
 xdens1<-density(x1)
 xdens2<-density(x2)
 xdens3<-density(x3)
 joyPlot(list(xdens1,xdens2,xdens3),main="joyPlot with lines",
  xlab="Position",xlim=c(0,100))
 xlist<-list(first=xdens1,second=xdens2,third=xdens3)
 joyPlot(xlist,main="joyPlot with polygons",xlab="Position",
  fill=c("#ffcccc","#ccffcc","#ccccff"),xlim=c(0,100))
 joyPlot(xlist,main="joyPlot with overlapping polygons",
  fill=c("#ffcccc","#ccffcc","#ccccff"),xlim=c(0,100),
  newrange=c(0,1.5),xlab="Position")
}
\keyword{misc}
