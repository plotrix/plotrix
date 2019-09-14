\name{cylindrect}
\alias{cylindrect}
\title{Display an apparent cylinder}
\description{Display rectangles shaded to appear like cylinders.}
\usage{
 cylindrect(xleft,ybottom,xright,ytop,col,border=NA,gradient="x",nslices=50)
}
\arguments{
 \item{xleft}{The position of the left side of the rectangle(s).}
 \item{ybottom}{The position of the bottom of the rectangle(s).}
 \item{xright}{The position of the right side of the rectangle(s).}
 \item{ytop}{The position of the top side of the rectangle(s).}
 \item{col}{The base color(s) of the rectangles.}
 \item{border}{Whether to draw a border and what color.}
 \item{gradient}{Whether to vary the shading horizontally ("x" - the default)
  or vertically (anything but "x").}
 \item{nslices}{The number of "slices" of color for shading.}
}
\value{The base color(s) of the rectangle(s).}
\details{
 \samp{cylindrect} displays a rectangle filled with "slices" of color that
 simulate the appearance of a cylinder. The slices are calculated so that the 
 base color appears at the right or bottom edge of the rectangle, becomes
 progressively lighter to a "highlight" at two thirds of the width or height
 and then darkens toward the base color again.

 The appearance is of a cylinder lit from above and to the left of the viewer.
 The position of the apparent light source is hard coded into the function.
}
\author{Jim Lemon}
\seealso{\link{gradient.rect}}
\examples{
 plot(0,xlim=c(0,5),ylim=c(0,5),main="Examples of pseudocylindrical rectangles",
  xlab="",ylab="",axes=FALSE,type="n")
 cylindrect(0,0,1,5,"red")
 cylindrect(rep(1,3),c(0,2,4),rep(4,3),c(1,3,5),"green",gradient="y")
 cylindrect(4,0,5,5,"#8844aa")
}
\keyword{misc}
