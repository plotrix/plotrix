\name{addtable2plot}
\alias{addtable2plot}
\title{Add a table of values to a plot}
\description{
 Displays a table of values at a user-specified position on an existing plot}
\usage{
 addtable2plot(x,y=NULL,table,lwd=par("lwd"),bty="n",bg=par("bg"),
  cex=1,xjust=0,yjust=1,xpad=0.1,ypad=0.5,box.col=par("fg"),text.col=par("fg"),
  display.colnames=TRUE,display.rownames=FALSE,hlines=FALSE,vlines=FALSE,
  title=NULL)
}
\arguments{
 \item{x,y}{Either x and y coordinates to locate the table or an
  \samp{xy.coords} object.}
 \item{table}{A data frame, matrix or similar object that will be displayed.}
 \item{lwd}{The line width for the box and horizontal dividers.}
 \item{bty}{Whether to draw a box around the table ("o") or not ("n").}
 \item{bg}{The background color for the table.}
 \item{cex}{Character expansion for the table.}
 \item{xjust,yjust}{Positioning for the table relative to \samp{x,y}.}
 \item{xpad,ypad}{The amount of padding around text in the cells as a
  proportion of the maximum width and height of the strings in each column.}
 \item{box.col}{The color for the box and lines.}
 \item{text.col}{The color for the text.}
 \item{display.colnames}{Whether to display the column names in the table.}
 \item{display.rownames}{Whether to display the row names in the table.}
 \item{hlines}{Whether to draw horizontal lines between each row of the table.}
 \item{vlines}{Whether to draw vertical lines between each column of the table.}
 \item{title}{Optional title placed over the table.}
}
\value{nil}
\details{
 \samp{addtable2plot} displays the values in \samp{table} at a position in user
 coordinates specified by \samp{x,y}. The two justification arguments,
 \samp{xjust} and \samp{yjust} are the same as in the \samp{legend} function,
 and \samp{addtable2plot} has been programmed to be as similar to \samp{legend}
 as possible. The function now accepts the positional arguments such as
 "topright" if passed as \samp{x}. The defaults are those that were most
 popular in scientific journals at the time of programming.

 If \samp{bg} is a matrix of colors of the same dimensions as \samp{x}, those
 colors will be the backgrounds of the cells. The default is no background color.
}
\author{Original by John Kane, mods by Jim Lemon and Brian Diggs. Thanks to
 Andrija Djurovic for asking for the individual cell colors and Gabor Grothendieck
 for alerting me to the problem of widely varying column widths.}
\seealso{\link{legend}}
\examples{
 testdf <- data.frame(Before = c(10, 7, 5, 9), During = c(8, 6, 2, 5),
  After = c(5, 3, 4, 3))
 rownames(testdf) <- c("Red", "Green", "Blue", "Lightblue")
 barp(testdf, main = "Test addtable2plot", ylab = "Value",
  names.arg = colnames(testdf), col = 2:5)
 # show most of the options including the christmas tree colors
 abg <- matrix(c(2, 3, 5, 6, 7, 8), nrow=4, ncol=3)
 addtable2plot(2, 8, testdf, bty = "o", display.rownames = TRUE, hlines = TRUE,
  vlines = TRUE, title = "The table", bg = abg)
}
\keyword{misc}
