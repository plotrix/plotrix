\name{radial.plot}
\alias{radial.plot}
\title{
 Plot values on a circular grid of 0 to 2*pi radians
}
\description{
 Plot numeric values as distances from the center of a circular field in the
 directions defined by angles in radians.
}
\usage{
 radial.plot(lengths,radial.pos=NULL,labels=NA,label.pos=NULL,radlab=FALSE,
 start=0,clockwise=FALSE,rp.type="r",label.prop=1.1,main="",xlab="",ylab="",
 line.col=par("fg"),lty=par("lty"),lwd=par("lwd"),mar=c(2,2,3,2),
 show.grid=TRUE,show.grid.labels=4,show.radial.grid=TRUE,rad.col="gray",
 grid.col="gray",grid.bg="transparent",grid.left=FALSE,grid.unit=NULL,
 point.symbols=1,point.col=par("fg"),show.centroid=FALSE,radial.lim=NULL,
 radial.labels=NULL,boxed.radial=TRUE,poly.col=NA,add=FALSE,...)
}
\arguments{
 \item{lengths}{A numeric data vector or matrix. If \samp{lengths}
  is a matrix, the rows will be considered separate data vectors.}
 \item{radial.pos}{A numeric vector or matrix of positions in radians. 
  These are interpreted as beginning at the right (0 radians) and moving
  counterclockwise. If \samp{radial.pos} is a matrix, the rows must 
  correspond to rows of \samp{lengths}.}
 \item{labels}{Character strings to be placed at the outer ends of
  the lines. If set to NULL, will suppress printing of labels,
  but if missing, the radial positions will be used.}
 \item{label.pos}{The positions of the labels around the plot in radians.}
 \item{radlab}{Whether to rotate the outer labels to a radial orientation.}
 \item{start}{Where to place the starting (zero) point. Defaults to the
  3 o'clock position.}
 \item{clockwise}{Whether to interpret positive positions as clockwise from
  the starting point. The default is counterclockwise.}
 \item{rp.type}{Whether to draw (r)adial lines, a (p)olygon, (s)ymbols
  or some combination of these. If \samp{lengths} is a matrix and rp.type is
  a vector, each row of \samp{lengths} can be displayed differently.}
 \item{label.prop}{The label position radius as a proportion of the 
  maximum line length.}
 \item{main}{The title for the plot.}
 \item{xlab,ylab}{Normally x and y axis labels are suppressed.}
 \item{line.col}{The color of the radial lines or polygons drawn.}
 \item{lty}{The line type(s) to be used for polygons or radial lines.}
 \item{lwd}{The line width(s) to be used for polygons or radial lines.}
 \item{mar}{Margins for the plot. Allows the user to leave space for
  legends, long labels, etc.}
 \item{show.grid}{Logical - whether to draw a circular grid.}
 \item{show.grid.labels}{Whether and where to display labels for the grid
  - see Details.}
 \item{show.radial.grid}{Whether to draw radial lines to the plot labels.}
 \item{rad.col}{Color of the radial lines on the grid.}
 \item{grid.col}{Color of the circumferential lines on the grid.}
 \item{grid.bg}{Fill color of above.}
 \item{grid.left}{Whether to place the radial grid labels on the left side.}
 \item{grid.unit}{Optional unit description for the grid.}
 \item{point.symbols}{The symbols for plotting (as in pch).}
 \item{point.col}{Colors for the symbols.}
 \item{show.centroid}{Whether to display a centroid.}
 \item{radial.lim}{The range of the grid circle. Defaults to
  \samp{pretty(range(lengths))}, but if more than two values are passed, the
  exact values will be displayed.}
 \item{radial.labels}{Optional labels for the radial grid. The default is
  the values of radial.lim.}
 \item{boxed.radial}{Whether to use boxed.labels or text for radial labels.}
 \item{poly.col}{Fill color if polygons are drawn. Use NA for no fill.}
 \item{add}{Whether to add one or more series to an existing plot.}
 \item{...}{Additional arguments are passed to \samp{plot}.}
}
\value{
 The \samp{par} values that are changed in the function
 as they were at the time \samp{radial.plot} was called.
}
\details{
 \samp{radial.plot} displays a plot of radial lines, polygon(s),
 symbols or a combination of these centered at the midpoint of
 the plot frame, the lengths, vertices or positions corresponding
 to the numeric magnitudes of the data values. If \samp{show.centroid}
 is TRUE, an enlarged point at the centroid of values is displayed. The
 centroid is calculated as the average of x and y values unless 
 \samp{rp.type="p"}. In this case, the barycenter of the polygon is
 calculated. Make sure that these suit your purpose, otherwise calculate
 the centroid that you really want and add it with the \samp{points} function.
 Note that if the observations are not taken at equal intervals around the
 circle, the centroid may not mean much.
  
 If the user wants to plot several sets of lines, points or symbols by
 passing matrices or data frames of \samp{lengths} and \samp{radial.pos},
 remember that these will be grouped by row, so transpose if the data are
 grouped by columns.

 If more series are added to an existing plot,
 \samp{radial.plot} will try to maintain the current plot parameters.
 Resetting the parameters after doing the initial plot will almost certainly
 mess up any series that are added. Series that are added will be plotted
 "on top" of the existing plot, possibly overplotting other things. If the
 added series have a larger range than the initial series, set \samp{radial.lim}
 to account for this in the initial plot, and if \samp{radial.lim} is specified
 in the initial plot, remember to repeat it for added series as in the example.

 The size of the labels on the outside of the plot can be adjusted by 
 setting \samp{par(cex.axis=)} and that of the labels inside by setting
 \samp{par(cex.lab=)}. If \samp{radlab} is TRUE, the labels will be rotated
 to a radial alignment. This may help when there are many values and labels.
 If some labels are still crowded, try running \samp{label.pos} through the
 \samp{spreadout} function. If the \samp{show.grid.labels} argument is a number
 from 1 to 4, the labels will be placed along a horizontal or vertical radius.
 The numbers represent the same positions as in \samp{axis}, with the default
 (4) on the right.

 The radial.plot family of plots is useful for illustrating
 cyclic data such as wind direction or speed (but see \samp{oz.windrose}
 for both), activity at different times of the day, and so on. While 
 \samp{radial.plot} actually does the plotting, another function is usually 
 called for specific types of cyclic data.
}
\author{Jim Lemon - thanks to Jeremy Claisse and Antonio Hernandez Matias
 for the \samp{lty} and \samp{rp.type} suggestions respectively, Patrick
 Baker for the request that led to \samp{radlab}, Thomas Steiner for
 the request for the \samp{radial.lim} and \samp{radial.labels} modifications,
 Evan Daugharty for requesting the \samp{add} argument, James MacCarthy
 for requesting better radial labels, Steve Ellison for noticing that
 the return values of the functions had changed, Don Dennerline for
 requesting the rank clock, Mehdi Nellen for the different colors for
 the radial and circumferential lines for the grid and Mayeul Kauffmann for
 noticing the radial label bug when a separate radial.grid was included.}
\seealso{\link{polar.plot},\link{clock24.plot}}
\examples{
 testlen<-runif(10,0,10)
 testpos<-seq(0,18*pi/10,length=10)
 testlab<-letters[1:10]
 oldpar<-radial.plot(testlen,testpos,main="Test Radial Lines",line.col="red",
  lwd=3,rad.col="lightblue")
 testlen<-c(sin(seq(0,1.98*pi,length=100))+2+rnorm(100)/10)
 testpos<-seq(0,1.98*pi,length=100)
 radial.plot(testlen,testpos,rp.type="p",main="Test Polygon",line.col="blue",
  labels=LETTERS[1:8])
 # now do a 12 o'clock start with clockwise positive
 radial.plot(testlen,testpos,start=pi/2,clockwise=TRUE,show.grid.labels=2,
  rp.type="s",main="Test Symbols (clockwise)",radial.lim=c(0,3.5),
  point.symbols=16,point.col="green",show.centroid=TRUE,labels=LETTERS[1:6])
 # one without the circular grid and multiple polygons
 # see the "diamondplot" function for variation on this
 posmat<-matrix(sample(2:9,30,TRUE),nrow=3)
 radial.plot(posmat,labels=paste("X",1:10,sep=""),rp.type="p",
  main="Spiderweb plot",line.col=2:4,show.grid=FALSE,lwd=1:3,
  radial.lim=c(0,10))
 # dissolved ions in water
 ions<-c(3.2,5,1,3.1,2.1,4.5)
 ion.names<-c("Na","Ca","Mg","Cl","HCO3","SO4")
 radial.plot(ions,labels=ion.names,rp.type="p",main="Dissolved ions in water",
  grid.unit="meq/l",radial.lim=c(0,5),poly.col="yellow",show.grid.labels=1)
 # add points inside the polygon - radial.lim is supplied by plotrix_env
 radial.plot(ions-0.4,rp.type="s",point.symbols=4,point.col="red",add=TRUE)
 radmat<-matrix(c(sample(1:4,4),sample(1:4,4),sample(1:4,4),sample(1:4,4),
  sample(1:4,4),sample(1:4,4),sample(1:4,4),sample(1:4,4),
  sample(1:4,4),sample(1:4,4)),nrow=4)
 # finally a rank clock
 radial.plot(radmat,rp.type="l",radial.pos=seq(0,20*pi/11.1,length.out=10),
  label.pos=seq(0,20*pi/11.1,length.out=10),start=pi/2,clockwise=TRUE,
  labels=2001:2010,radial.lim=c(0.2,4),main="Rank clock")
 legend(-1.7,4,c("Black","Red","Green","Blue"),col=1:4,lty=1)
 par(xpd=oldpar$xpd,mar=oldpar$mar,pty=oldpar$pty)
 # reset the margins
 par(mar=c(5,4,4,2))
}
\keyword{misc}
