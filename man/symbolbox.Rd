\name{symbolbox}
\alias{symbolbox}
\title{Draw a box filled with symbols}
\description{
 Draws a box on the current figure that is filled with symbols
 representing individual counts
}
\usage{
 symbolbox(x1,y1,x2,y2,tot,relw=0.5,fg=par("fg"),bg=par("bg"),box=TRUE,
  debug = TRUE,...)
}
\arguments{
 \item{x1}{left side of box}
 \item{y1}{bottom side of box}
 \item{x2}{right side of box}
 \item{y2}{top side of box}
 \item{tot}{total number of symbols to put in the box}
 \item{relw}{relative width (relative to height) of symbols}
 \item{fg}{foreground color}
 \item{bg}{background color}
 \item{box}{(logical) draw box border?}
 \item{debug}{debug output?}
 \item{\dots}{additional arguments to polygon() for drawing box}
}
\details{
 tries to automatically figure out appropriate scaling to fit symbols
 into the box
}
\value{
 none; draws on the current figure
}
\author{Ben Bolker}
\seealso{\link{multsymbolbox}}
\examples{
 plot(1:10,1:10,type="n")
 symbolbox(2,5,3,7,tot=20)
 symbolbox(6,2,10,6,tot=50,fg="blue",bg="magenta")
}
\keyword{aplot}
