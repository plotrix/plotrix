\name{rectFill}
\alias{rectFill}
\title{Draw a rectangle filled with symbols}
\description{
 Draws a rectangle on the current figure filled with arbitrary symbols.
}
\usage{
 rectFill(x1,y1,x2,y2,fg=par("fg"),bg=par("bg"),xinc=NA,yinc=NA,
  pch=1,pch.cex=1,pch.col=par("fg"),...)
}
\arguments{
 \item{x1,y1,x2,y2}{Rectangle limits as in \samp{rect}.}
 \item{fg}{Foreground color}
 \item{bg}{Background color}
 \item{xinc,yinc}{The x and y increments of spacing for the symbols.}
 \item{pch}{Which symbol to use}
 \item{pch.cex}{Character expansion for the symbols.}
 \item{pch.col}{Color(s) for the symbols. }
 \item{...}{Additional arguments to \samp{points} for the symbols.}
}
\details{
 \samp{rectFill} draws a rectangle and fills the rectangle with the
 symbols requested. It is probably most useful as a substitute for
 fill colors in a black and white environment.
}
\value{ nil }
\author{Jim Lemon}
\seealso{\link{rect}, \link{points}}
\examples{
 plot(1:7,type="n",xlab="",ylab="",main="Test of rectFill")
 rectFill(1:6,1:6,2:7,2:7,bg=2:7,pch=c("+","*","o",".","#","^"),
  xinc=c(0.2,0.1,0.2,0.1,0.2,0.2),yinc=c(0.2,0.1,0.2,0.1,0.2,0.2),
  pch.col=1:6)
 barp(matrix(runif(9),nrow=3),main="Black and white bar plot",pch=1:3)
}
\keyword{misc}
