\name{densityGrid}
\alias{densityGrid}
\title{Display a matrix of cell values as symbols.}
\description{
 Displays a matrix of values as symbols on an existing image.
}
\usage{
 densityGrid(x,z=NULL,xrange=NA,zrange=NA,range.cex=c(1,10),
 xlim=c(-180,180),ylim=c(-90,90),red=c(0,1),green=c(0,1),blue=c(0,1),alpha=1,
 pch=".",geocoord=TRUE)
}
\arguments{
 \item{x}{Matrix of values representing counts in cells (usually locations).}
 \item{z}{Optional matrix of values attached to the cells in x.}
 \item{xrange,zrange}{Explicit ranges for the counts in x and z. Used to
  define a "pretty" set of values to label legends.}
 \item{range.cex}{The range of expansion for the symbols when this is used to
  indicate the number of counts in the cells.}
 \item{xlim}{The extreme coordinates in the horizontal direction (see Details).}
 \item{ylim}{The extreme coordinates in the vertical direction (see Details).}
 \item{red,green,blue}{Values in an RGB colorspace to use in transforming the
  cell values into colors.}
 \item{alpha}{Transparency of the colors.}
 \item{pch}{The symbol to use in displaying the observation density. Either
  "." or 15 seem to work well depending upon the resolution of the grid.}
 \item{geocoord}{Whether the size of the symbols that indicate density when
  there are intensity values should be corrected for a Mercator projection.}
}
\details{
 \samp{densityGrid} expects one matrix or a list of two matrices containing
 values that will be transformed into colors or sizes of the symbols displayed.
 The two matrices may be passed as a list. If only one matrix is present, the 
 color of the symbols is determined by the values (counts) in the matrix. If
 a second matrix is passed, The values in that matrix will be used to determine 
 the colors, and the size of the symbols will be proportional to the values in
 the first matrix. In the case of only one matrix, the user should set the 
 first value of \samp{range.cex} to the desired expansion of the symbols.
 
 Currently \samp{densityGrid} does not display anything in grid cells that have
 zero count values.
 
 \samp{densityGrid} was developed to allow very large numbers of coordinate 
 locations to be accumulated in a matrix for display on a geographic map. Thus
 the default limits refer to coordinates as latitude/longitude for the earth.
 Because some geographic data are so numerous that memory limits are exceeded,
 the underlying \samp{makeDensityMatrix} function can be run on small sections
 of the entire data set and the resulting matrices added as long as the initial
 coordinate limits are used throughout. Note that if the values for counts
 (with one matrix) or for intensity (with two matrices) cover a very large 
 range, it may be necessary to trim extreme values (noting this on any legends)
 and transform the data (usually log10) to get good color separation.
}
\value{
 nil. Displays a grid of symbols on an existing plot device.
}
\examples{
 \dontrun{
  data(l2010)
  # log10 transform both density and intensity
  l2010[[1]]<-log10(l2010[[1]])
  l2010[[2]]<-log10(l2010[[2]])
  library(maps)
  x11(width=10)
  par(mar=c(7,3,2,3))
  plot(0,xlim=c(-180,180),ylim=c(-90,90),type="n",axes=FALSE,xlab="",ylab="")
  densityGrid(l2010,pch=".",xrange=c(0,6),zrange=c(2,8),range.cex=c(2,8),
   red=c(0,0.5,1),green=c(0,1,0),blue=c(1,0,0),alpha=1)
  color.legend(-60,-107,60,-97,c("2","3","4","5","6","7","8"),
   rect.col=color.scale(1:7,cs1=c(0,0.5,1),cs2=c(0,1,0),cs3=c(1,0,0),alpha=1),
   cex=0.5)
  par(xpd=TRUE)
  text(0,95,"Lightning strikes 2010")
  text(0,-114,"Mean intensity kVA (10^n)",cex=0.5)
  points(x=seq(-60,60,20),y=rep(-125,7),pch=".",cex=1:7)
  text(x=seq(-60,60,20),y=rep(-132,7),c("<=1","2","3","4","5","6",">6"),cex=0.5)
  text(0,-142,"Cell frequency (10^n)",cex=0.5)
  par(xpd=FALSE)
  map("world",mar=c(7,3,2,3),add=TRUE)
  dev.off()
  # now only Australia
  par(mar=c(7,3,2,3))
  plot(0,xlim=c(112,154),ylim=c(-43.8,-11.1),type="n",axes=FALSE,xlab="",ylab="")
  densityGrid(l2010,pch=".",xrange=c(0,6),zrange=c(2,8),range.cex=c(2,8),
   xlim=c(112,154),ylim=c(-43.8,-11.1),red=c(0,0.5,1),green=c(0,1,0),
   blue=c(1,0,0),alpha=1)
  color.legend(120,-47,146,-45,c("2","3","4","5","6","7","8"),
   rect.col=color.scale(1:7,cs1=c(0,0.5,1),cs2=c(0,1,0),cs3=c(1,0,0),alpha=1),
   cex=0.5)
  par(xpd=TRUE)
  text(133,-9,"Lightning strikes 2010 (Australia)")
  text(133,-48.2,"Mean intensity kVA (10^n)",cex=0.5)
  points(x=seq(121,145,4),y=rep(-50,7),pch=".",cex=1:7)
  text(x=seq(121,145,4),y=rep(-51,7),c("<=1","2","3","4","5","6",">6"),cex=0.5)
  text(133,-52,"Cell frequency (10^n)",cex=0.5)
  par(xpd=FALSE)
  map("world",mar=c(7,3,2,3),xlim=c(112,154),ylim=c(-43.8,-11.1),add=TRUE)
 }
}
\author{Jim Lemon}
\seealso{\link{makeDensityMatrix},\link{color.scale}}
\keyword{misc}
