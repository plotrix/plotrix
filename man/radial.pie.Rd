\name{radial.pie}
\alias{radial.pie}
\title{
 Plot sectors/annuli on a circular grid of 0 to 2*pi radians
}
\description{
 Plot numeric values as sectors with optional annuli on a circular field in the
 directions defined by angles in radians.
}
\usage{
 radial.pie(radial.extents,sector.edges=NULL,
 sector.colors=NULL,cs1=c(0,1),cs2=c(0,1),cs3=c(0,1),
 alpha=1,labels=NA,label.pos=NULL,radlab=FALSE,start=0,
 clockwise=FALSE,label.prop=1.1,radial.lim=NULL,main="",xlab="",ylab="",
 mar=c(2,2,3,2),show.grid=TRUE,show.grid.labels=4,show.radial.grid=TRUE,
 grid.col="gray",grid.bg="transparent",grid.unit=NULL,
 radial.labels=NULL,boxed.radial=TRUE,add=FALSE,...)
}
\arguments{
 \item{radial.extents}{A numeric data vector or list. If \samp{radial.extents}
  is a list, the elements of the list will be considered separate data vectors.}
 \item{sector.edges}{A numeric vector of positions in radians. 
  These are interpreted as beginning at the right (0 radians) and moving
  counterclockwise unless \samp{clockwise} is TRUE.}
 \item{sector.colors}{Optional colors for the sectors and annuli. Defaults to
  \samp{rainbow(nsectors)} with fading outward if annuli are specified.}
 \item{cs1, cs2, cs3, alpha}{Color scaling arguments - see \link{color.scale}.}
 \item{labels}{Character strings to be placed at the outer ends of
  the lines. If set to NA, will suppress printing of labels,
  but if missing, the radial positions will be used.}
 \item{label.pos}{The positions of the labels around the plot in radians.}
 \item{radlab}{Whether to rotate the outer labels to a radial orientation.}
 \item{start}{Where to place the starting (zero) point. Defaults to the
  3 o'clock position.}
 \item{clockwise}{Whether to interpret positive positions as clockwise from
  the starting point. The default is counterclockwise.}
 \item{label.prop}{The label position radius as a proportion of the 
  maximum line length.}
 \item{radial.lim}{The inner and outer radial limits for the plot. Defaults
  to the range of radial.extents, although zero to \samp{max(radial.extents)}
  is often what is wanted.}
 \item{main}{The title for the plot.}
 \item{xlab,ylab}{Normally x and y axis labels are suppressed.}
 \item{mar}{Margins for the plot. Allows the user to leave space for
  legends, long labels, etc.}
 \item{show.grid}{Logical - whether to draw a circular grid.}
 \item{show.grid.labels}{Whether and where to display labels for the grid
  - see Details.}
 \item{show.radial.grid}{Whether to draw radial lines to the plot labels.}
 \item{grid.col}{Color of the circular grid.}
 \item{grid.bg}{Fill color of above.}
 \item{grid.unit}{Optional unit description for the grid.}
 \item{radial.labels}{Optional labels for the radial grid. The default is
  the values of radial.lim.}
 \item{boxed.radial}{Whether to use boxed.labels or text for radial labels.}
 \item{add}{Whether to add one or more series to an existing plot.}
 \item{...}{Additional arguments are passed to \samp{plot}.}
}
\value{
 The \samp{par} values that are changed in the function
 as they were at the time \samp{radial.pie} was called.
}
\details{
 \samp{radial.pie} displays a plot of radial sectors with optional annular
 sections centered at the midpoint of the plot frame, the lengths corresponding
 to the numeric magnitudes of \samp{radial.extents}.

 If more series are added to an existing plot,
 \samp{radial.pie} will try to maintain the current plot parameters. However,
 it seems unlikely that adding series would be sensible in \samp{radial.pie}.
 This argument may be dropped if it proves useless.

 The size of the labels on the outside of the plot can be adjusted by 
 setting \samp{par(cex.axis=)} and that of the labels inside by setting
 \samp{par(cex.lab=)}. If \samp{radlab} is TRUE, the labels will be rotated
 to a radial alignment. This may help when there are many values and labels.
 If some labels are still crowded, try running \samp{label.pos} through the
 \samp{spreadout} function. If the \samp{show.grid.labels} argument is a number
 from 1 to 4, the labels will be placed along a horizontal or vertical radius.
 The numbers represent the same positions as in \samp{axis}, with the default
 (4) on the right. To suppress these labels, pass zero or FALSE.

 \samp{radial.pie} works somewhat differently from the \samp{radial.plot}
 family and is still under development. I have released it in order to get
 feedback to improve both the design and the programming. If successful, I
 hope to merge the code with the \samp{radial.plot} function.
}
\author{Jim Lemon - thanks to Patrick Jemison for asking for it.}
\seealso{\link{radial.plot}}
\examples{
 pie1<-c(3,6,5,4,7,8,9,1,4)
 pie2<-list(0:3,1:6,2:5,1:4,0:7,4:8,2:9,0:1,0:4)
 pie3<-sample(10:60,36)
 pie4<-list(sort(sample(1:60,8)))
 for(sector in 2:36) pie4[[sector]]<-sort(sample(1:60,8))
 oldpar<-radial.pie(pie1,labels=LETTERS[1:9])
 radial.pie(pie2,labels=letters[2:10])
 radial.pie(pie3,labels=1:36)
 radial.pie(pie4,labels=1:36)
 # restore the par values
 par(oldpar)
}
\keyword{misc}
