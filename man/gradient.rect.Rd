\name{gradient.rect}
\title{Display a rectangle filled with an arbitrary color gradient}
\usage{
 gradient.rect(xleft,ybottom,xright,ytop,reds,greens,blues,col=NULL,
  nslices=50,gradient="x",border=par("fg"))
}
\alias{gradient.rect}
\arguments{
 \item{xleft,ybottom,xright,ytop}{Positions of the relevant corners
  of the desired rectangle, as in \samp{rect}.}
 \item{reds,greens,blues}{vectors of the values of the color components
  either as 0 to 1 or ,if any value is greater than 1, 0 to 255.}
 \item{col}{Vector of colors. If supplied, this takes precedence over
  \samp{reds, greens, blues} and \samp{nslices} will be set to its length.}
 \item{nslices}{The number of sub-rectangles that will be drawn.}
 \item{gradient}{whether the gradient should be horizontal (x) or vertical.}
 \item{border}{The color of the border around the rectangle (NA for none).}
}
\description{
 \samp{gradient.rect} draws a rectangle consisting of \samp{nslices}
  subrectangles of the colors in \samp{col} or those returned by 
  \samp{color.gradient} if \samp{col} is NULL. The rectangle is
  'sliced' in the direction specified by \samp{gradient}.
}
\value{the vector of hexadecimal color values from \samp{color.gradient} or
 \samp{col}.}
\author{Jim Lemon}
\examples{
 # get an empty box
 plot(0:10,type="n",axes=FALSE)
 # run across the three primaries
 gradient.rect(1,0,3,6,reds=c(1,0),
  greens=c(seq(0,1,length=10),seq(1,0,length=10)),
  blues=c(0,1),gradient="y")
 # now a "danger gradient"
 gradient.rect(4,0,6,6,c(seq(0,1,length=10),rep(1,10)),
  c(rep(1,10),seq(1,0,length=10)),c(0,0),gradient="y")
 # now just a smooth gradient across the bar
 gradient.rect(7,0,9,6,col=smoothColors("red",38,"blue"),border=NA)
}
\keyword{misc}
