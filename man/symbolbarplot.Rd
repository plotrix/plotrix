\name{symbolbarplot}
\alias{symbolbarplot}
\title{barplot filled with symbols}
\description{
 Produces a barplot where each piece of the barplot is filled with the
 number of symbols equal to the size of the bar
}
\usage{
 symbolbarplot(height,width=1,space=NULL,names.arg=NULL,
  legend.text=NULL,beside=FALSE,horiz=FALSE,col=heat.colors(NR),
  border=par("fg"),main=NULL,sub=NULL,xlab=NULL,ylab=NULL,xlim=NULL,
  ylim=NULL,axes=TRUE,axisnames=TRUE,inside=TRUE,plot=TRUE,rel.width=0.8,
  symbol="circles",symbbox=TRUE,debug=FALSE,...)
}
\arguments{
  \item{height}{numeric vector or matrix of barplot heights}
  \item{width}{width of bars}
  \item{space}{space between bars}
  \item{names.arg}{vector of names}
  \item{legend.text}{vector of legend text}
  \item{beside}{(logical) plot bars beside each other?}
  \item{horiz}{(logical) horizontal barplot?}
  \item{col}{vector of colors}
  \item{border}{plot border?}
  \item{main}{main title}
  \item{sub}{subtitle}
  \item{xlab}{x axis label}
  \item{ylab}{y axis label}
  \item{xlim}{x limits}
  \item{ylim}{y limits}
  \item{axes}{draw axes?}
  \item{axisnames}{label horizontal axis?}
  \item{inside}{draw lines dividing adjacent bars?}
  \item{plot}{produce plot?}
  \item{rel.width}{relative width of symbols}
  \item{symbol}{which symbol to use}
  \item{symbbox}{draw boxes for symbol boxes?}
  \item{debug}{debug output?}
  \item{\dots}{further arguments to multsymbolbox}
}
\value{
 Nil
}
\note{This is a mostly a hack of barplot()}
\author{Ben Bolker}
\examples{
 set.seed(1001)
 bvals <- matrix(rpois(12,20),nrow=3)
 b <- symbolbarplot(bvals)
}
\keyword{hplot}
