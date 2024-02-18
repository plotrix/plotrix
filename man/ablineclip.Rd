\name{ablineclip}
\alias{ablineclip}
\title{Add a straight line to a plot}
\description{
  As \samp{abline}, but has arguments \samp{x1,x2,y1,y2} as in \samp{clip}.
}
\usage{
 ablineclip(a=NULL,b=NULL,h=NULL,v=NULL,reg=NULL,coef=NULL,untf=FALSE,
  x1=NULL,x2=NULL,y1=NULL,y2=NULL,...)
}
\arguments{
 \item{a}{Intercept.}
 \item{b}{Slope.}
 \item{h}{the y-value(s) for horizontal line(s).}
 \item{v}{the x-value(s) for vertical line(s).}
 \item{reg}{Fitted lm object. }
 \item{coef}{Coefficients, typically intercept and slope.}
 \item{untf}{How to plot on log coordinates, see \samp{abline}.}
 \item{x1,x2,y1,y2}{Clipping limits, see \samp{clip}.}
 \item{...}{Further arguments passed to \samp{abline}.}
}
\details{
 \samp{ablineclip} sets a new clipping region and then calls \samp{abline}.
 If any of the four clipping limits is NULL, the values from \samp{par("usr")}
 are substituted. After the call to \samp{abline}, the old clipping region
 is restored. In order to make \samp{clip} work, there is a call to \samp{abline} that draws a line off the plot.

 Multiple lines of the same type can be drawn in a single call, but the clipping region must be the same for each group of lines. Thanks to Berry Boessenkool for pointing this out.
}
\value{
 None. Adds to the current plot.
}
\author{ Remko Duursma }
\seealso{\link{abline}, \link{clip}}
\examples{
 x <- rnorm(100)
 y <- x + rnorm(100)
 lmfit <- lm(y~x)
 plot(x, y, xlim=c(-3.5, 3.5))
 ablineclip(lmfit, x1 = -2, x2 = 2, lty = 2)
 ablineclip(h = 0, x1 = -2,x2 = 2,lty = 3, col = "red")
 ablineclip(v = 0, y1 = -2.5, y2 = 1.5, lty=4, col = "green")
}
\keyword{ aplot }
