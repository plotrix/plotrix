\name{revaxis}
\alias{revaxis}
\title{ Plot with axis direction(s) reversed }
\description{
   Reverses the sense of either or both the \samp{x} and \samp{y} axes.
}
\usage{
revaxis(x, y, xrev=FALSE, yrev=TRUE, xside=if (yrev) 3 else 1,
       yside=if (xrev) 4 else 2, xlab=NULL, ylab=NULL, bty=NULL, ...)

}
\arguments{
   \item{x}{ Vector of \samp{x}-coordinates of the data to be plotted. }
   \item{y}{ Vector of \samp{y}-coordinates of the data to be plotted. }
   \item{xrev}{ Logical scalar; should the sense of the \samp{x}-axis
    be reversed?}
   \item{yrev}{ Logical scalar; should the sense of the \samp{y}-axis
    be reversed?}
   \item{xside}{ The side of the plot on which the \samp{x}-axis labels
   should go.}
   \item{yside}{ The side of the plot on which the \samp{y}-axis labels
   should go.}
   \item{xlab}{ Character string for labelling the \samp{x}-axis. }
   \item{ylab}{ Character string for labelling the \samp{y}-axis. }
   \item{bty}{ Single letter indicating the type of box to be drawn
   around the plot. See \link{par} for the possible letters
   and their meaning.}
   \item{\dots}{ Other arguments to be passed to plot.}
}

\value{ nil }
\author{Rolf Turner}
\seealso{ \link{plot}, \link{box}, \link{par}}

\examples{
x <- runif(20)
y <- runif(20)
revaxis(x,y,yside=4)
}
\keyword{ hplot }
