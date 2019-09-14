\name{oz.windrose}
\alias{oz.windrose}
\title{Display an Australian wind rose}
\description{Displays a wind rose in the style used by the Australian
 Bureau of Meteorology.}
\usage{
 oz.windrose(windagg,maxpct=20,wrmar=c(4,5,6,5),scale.factor=30,
  speed.col=c("#dab286","#fe9a66","#ce6733","#986434"),
  speed.width=NA,show.legend=TRUE,legend.pos=NA,...)
}
\arguments{
 \item{windagg}{A matrix of percentages with the rows representing
  speed ranges and the columns indicating wind directions.}
 \item{maxpct}{The maximum percentage displayed on the radial grid.}
 \item{wrmar}{Plot margins for the diagram.}
 \item{scale.factor}{The scale factor for the diagram.}
 \item{speed.col}{Colors representing speed ranges.}
 \item{speed.width}{Half widths of the bars representing speed ranges.}
 \item{show.legend}{Logical indicating whether to display a legend.}
 \item{legend.pos}{The vertical position of the wind rose legend. The
  Australian Bureau of Meteorology displays the legend at the top of
  the plot}
 \item{...}{additional arguments passed to \samp{plot}.}
}
\details{
 \samp{oz.windrose} displays a wind rose in the style used by the Australian
  Bureau of Meteorology. Each limb represents a bin of wind directions, and 
  there are conventionally eight bins. If \samp{windagg} has more than eight
  columns, more limbs will be displayed. The rows of \samp{windagg} represent
  the speed ranges used by the Australian Bureau of Meteorology (0, 0-10, 
  10-20, 20-30 and over 30 in km/hour). The diameter of the central circle is
  calculated as (percent calm observations)/(number of direction bins). The
  remaining grid circles are spaced from the circumference of the "Calm"
  circle.
}
\note{
 If a title is desired, remember to move the legend to the bottom 
  of the plot. If the function is passed values that do not sum to 100, the
  resulting plot will at best be misleading.
}
\value{nil}
\author{Jim Lemon (thanks to Anna in the Sydney BoM office and Alejo for
 finding the problem with heavily prevailing winds.)}
\seealso{\link{oz.windrose.legend}, \link{draw.circle}, \link{bin.wind.records}}
\examples{
 windagg<-matrix(c(8,0,0,0,0,0,0,0,4,6,2,1,6,3,0,4,2,8,5,3,5,2,1,1,
  5,5,2,4,1,4,1,2,1,2,4,0,3,1,3,1),nrow=5,byrow=TRUE)
 oz.windrose(windagg)
}
\keyword{misc}
