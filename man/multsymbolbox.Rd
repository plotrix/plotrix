\name{multsymbolbox}
\alias{multsymbolbox}
\title{Draw boxes filled with symbols}
\description{
 Draw boxes on the current figure filled with symbols representing
 individual counts.
}
\usage{
 multsymbolbox(x1,y1,x2,y2,tot,relw=0.8,fg=par("fg"),bg=par("bg"),
  box=TRUE,debug=FALSE,...)
}
\arguments{
 \item{x1}{numeric vector: left sides of boxes}
 \item{y1}{numeric vector: bottom sides of boxes}
 \item{x2}{numeric vector: right sides of boxes}
 \item{y2}{numeric vector: top sides of boxes}
 \item{tot}{numeric vector: total numbers of symbols to put in each box}
 \item{relw}{relative width (relative to height) of symbols}n
 \item{fg}{foreground color(s)}
 \item{bg}{background color(s)}
 \item{box}{(logical) draw box borders?}
 \item{debug}{debug output?}
 \item{\dots}{additional arguments to polygon() for drawing boxes}
}
\value{
 none
}
\author{Ben Bolker}
\examples{
 plot(1:10,1:10,type="n")
 multsymbolbox(c(2,4),5,c(4,5),8,tot=c(10,8))
}
\keyword{aplot}
