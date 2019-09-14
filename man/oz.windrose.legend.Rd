\name{oz.windrose.legend}
\alias{oz.windrose.legend}
\title{Display an Australian wind rose legend}
\description{
 Displays a wind rose legend in the style used by the Australian Bureau 
 of Meteorology.
}
\usage{
 oz.windrose.legend(maxpct=20,scale.factor=30,
  speed.col=c("#dab286","#fe9a66","#ce6733","#986434"),
  speed.width=NA,legend.pos=NA)
}
\arguments{
 \item{maxpct}{The maximum percentage to display on the radial grid.}
 \item{scale.factor}{The scale factor for the plot.}
 \item{speed.col}{Colors representing speed ranges.}
 \item{speed.width}{Half widths of the bars representing speed ranges.}
 \item{legend.pos}{The vertical position of the wind rose legend. The
  Australian Bureau of Meteorology displays the legend at the top of
  the plot}
}
\value{nil}
\author{Jim Lemon (thanks to Anna in the Sydney BoM office)}
\seealso{\link{oz.windrose}}
\examples{
 plot(0,xlim=c(-20,20),ylim=c(-20,20),type="n",axes=FALSE,xlab="",ylab="")
 par(xpd=TRUE)
 oz.windrose.legend()
 par(xpd=FALSE)
}
\keyword{misc}
