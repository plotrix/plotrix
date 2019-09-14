\name{axis.break}
\alias{axis.break}
\title{ Place a "break" mark on an axis }
\description{
 Places a "break" mark on an axis on an existing plot.
}
\usage{
 axis.break(axis=1,breakpos=NULL,pos=NULL,bgcol="white",breakcol="black",
  style="slash",brw=0.02)
}
\arguments{
 \item{axis}{which axis to break}
 \item{breakpos}{where to place the break in user units}
 \item{pos}{position of the axis (see \link{axis}).}
 \item{bgcol}{the color of the plot background}
 \item{breakcol}{the color of the "break" marker}
 \item{style}{Either \samp{gap}, \samp{slash} or \samp{zigzag}}
 \item{brw}{break width relative to plot width}
}
\value{nil}
\details{
 The \samp{pos} argument is not needed unless the user has specified a
 different position from the default for the axis to be broken.
}
\note{
 There is some controversy about the propriety of using discontinuous
 coordinates for plotting, and thus axis breaks. Discontinuous coordinates
 allow widely separated groups of values or outliers to appear without
 devoting too much of the plot to empty space. The major objection seems 
 to be that the reader will be misled by assuming continuous coordinates.
 The \samp{gap} style that clearly separates the two sections of the plot
 is probably best for avoiding this.
}
\author{Jim Lemon and Ben Bolker}
\seealso{\link{gap.plot}}
\examples{
 plot(3:10, main = "Axis break test")
 # put a break at the default axis and position
 axis.break()
 axis.break(2, 2.9, style = "zigzag")
 twogrp <- c(rnorm(10) + 4, rnorm(10) + 20)
 gap.plot(twogrp,gap = c(8,16), xlab = "Index", ylab = "Group values",
  main = "Two separated groups with gap axis break",
  col = c(rep(2, 10), rep(3, 10)), ytics = c(3, 5, 18, 20))
 legend(12, 6, c("Low group", "High group"), pch = 1, col = 2:3)
}
\keyword{misc}
