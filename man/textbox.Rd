\name{textbox}
\alias{textbox}
\title{Add text box}
\description{
 Add text to plot, justified, in a box
}
\usage{
 textbox(x, y, textlist, justify=c('l','c','r'), cex=1, leading=0.5, box=TRUE,
 adj=c(0,0), font=NULL, vfont=NULL, col=NULL, border=NULL, fill=NA, density=NULL,
 angle=45, lty=par("lty"), lwd=par("lwd"), margin=0)
}
\arguments{
 \item{x}{x position: a vector with min. and max. x-position}
 \item{y}{y position: location of the top of the box}
 \item{textlist}{a vector of text strings}
 \item{justify}{x alignment: 'l'=left, 'c'=center, 'r'=right.}
 \item{cex}{character expansion}
 \item{leading}{inter-line spacing}
 \item{box}{whether to draw a box around the text}
 \item{adj}{adjustment for x and y position, default is no adjustment,
  see Details}
 \item{font}{text font, see Details}
 \item{vfont}{text font, see Details}
 \item{col}{text color}
 \item{border}{box border color}
 \item{fill}{box fill color}
 \item{density}{box shading line density, see Details}
 \item{angle}{box shading line angle, see Details}
 \item{lty}{box border and shading line types, see Details}
 \item{lwd}{box border and shading line width, see Details}
 \item{margin}{amount to adjust box border in or out. See Details}
}
\details{
 Draws text in the box by pasting the textlist vector together, splitting it
 into words, and then adding words to the current line until the line is wide
 enough before moving on to the next line.

 \samp{margin} may be a vector of 1, 2, or 4 values, corresponding to 
 adjustment of all borders (1 value), top/bottom and left/right borders
 (2 values), or bottom/left/top/right borders (4 values).  A positive value
 moves text inwards from specified (x,y) position with border remaining at (x,y),
 and a negative value moves the border outwards from (x,y) with the text
 remaining at (x,y).

 The \samp{density} and \samp{angle} arguments have the same behavior as in the
 \samp{rect} function. The \samp{adj, font} and {vfont} arguments have the same
 behavior as in the \samp{text} function. The \samp{lty} and \samp{lwd} 
 arguments have the same behavior as in the \samp{lines} function.
}
\value{
 y-position of bottom line of box, or y-position of next line if there is no box.
}
\author{Ben Bolker. Improvements by Ted Toal.}
\examples{
 plot.new()
 textbox(c(0,0.2), 1, c("many words","more words","why not?",
  "keep going",rep("and going",10)))
 textbox(c(0.3,0.5), 1, c("keep going",rep("and going",10)), cex=0.45,
  col="blue", border="red", fill="#00FFEE80", density=25, angle=60)
 textbox(c(0.6,0.8), 1, c("keep going",rep("and going",10)), justify='c', cex=0.6,
  leading=1, font=4, border="gold", lty=2, lwd=4, margin=0.025)
 textbox(c(0.6,0.8), 0.5, c("keep going",rep("and going",10)), justify='r', cex=0.7,
  col="purple", font=3, border="green", margin=-0.025)
 lines(c(0,1), c(1,1), col="red", lty=2)
 lines(c(0,1), c(0.5,0.5), col="red", lty=2)
}
\keyword{aplot}
