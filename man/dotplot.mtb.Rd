\name{dotplot.mtb}
\alias{dotplot.mtb}
\title{ Minitab style dotplots. }
\description{
 Create a dotplot of a data vector in the sense of "dotplot" as
 used in the Minitab\eqn{\mbox{\copyright}} package.
}
\usage{
dotplot.mtb(x, xlim = NULL, main = NULL, xlab = NULL, ylab = NULL,
            pch = 19, hist = FALSE, yaxis = FALSE, mtbstyle=TRUE)
}
\arguments{
  \item{x}{ A numeric vector. }
  \item{xlim}{ The x limits of the plot. }
  \item{main}{ A title for the plot; defaults to blank.}
  \item{xlab}{ A label for the x axis; defaults to blank.}
  \item{ylab}{ A label for the y axis; defaults to blank.}
  \item{pch}{ The plotting symbol for the dots in the plot;
              defaults to a solid disc. }
  \item{hist}{ Logical scalar; should the plot be done "histogram"
               style, i.e. using vertical lines rather than stacks
               of dots?}
  \item{yaxis}{ Logical scalar; should a y-axis be produced? }
  \item{mtbstyle}{ Logical scalar; should the dotplot be done in
                   the "Minitab" style?  I.e. should the zero level
                   be at the vertical midway point? }
}
\details{
  The result of \code{hist=TRUE} looks less ugly than stacks of
  dots for very large data sets.
}
\value{
  Nothing.  A plot is produced as a side effect.
}
\author{ Barry Rowlingson
  \email{B.Rowlingson@lancaster.ac.uk}
  and Rolf Turner
  \email{r.turner@auckland.ac.nz}
  \url{http://www.stat.auckland.ac.nz/~rolf}
}
\section{Warnings}{
This function does something toadally different from the \code{dotplot()}
(now \code{\link{dotchart}()}) function in the graphics package.

The labelling of the \code{y}-axis is device dependent.
}

\examples{
\dontrun{
set.seed(42)
x <- rpois(100,10)
dotplot.mtb(x,main="No y-axis.")
dotplot.mtb(x,yaxis=TRUE,main="With y-axis displayed.")
dotplot.mtb(x,hist=TRUE,main="An \"h\" style plot.")
dotplot.mtb(x,xlim=c(4,16),main="With the x-axis limited.")
dotplot.mtb(x,yaxis=TRUE,mtbstyle=FALSE,main="Non-Minitab style.")
dotplot.mtb(x,yaxis=TRUE,xlab="x",ylab="count",
            main="With x and y axis labels.")
}
}
\keyword{ hplot }
