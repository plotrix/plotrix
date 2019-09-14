\name{corner.label}
\alias{corner.label}
\title{Find corner locations and optionally display a label}
\description{
 Finds the coordinates in user parameters of a specified corner of the
 figure region and optionally displays a label there
}
\usage{
 corner.label(label=NULL,x=-1,y=1,xoff=NA,yoff=NA,figcorner=FALSE,...)
}
\arguments{
 \item{label}{Text to display. The default is to display nothing.}
 \item{x}{an integer value: -1 for the left side of the plot, 1 for the
  right side}
 \item{y}{an integer value: -1 for the bottom side of the plot, 1 for
  the top side}
 \item{xoff,yoff}{Horizontal and vertical text offsets. Defaults to one
  half of the width and height of "m" respectively. }
 \item{figcorner}{Whether to find/display at the corner of the plot or figure.}
 \item{...}{further arguments to the \samp{text} command for the label}
}
\details{
 \samp{corner.label} finds the specified corner of the plot or figure and if
 \samp{label} is not NULL, displays it there. The text justification is specified
 so that the label will be justified away from the corner. To get the label
 squeezed right into a corner, set \samp{xoff} and \samp{yoff} to zero.
}
\value{
 A list of the x and y positions of the corner adjusted for the offsets.
}
\author{Ben Bolker}
\examples{
 plot(1:10,1:10)
 corner.label("A")
 corner.label(x=1,y=1)
 corner.label("B",y=-1,x=1,figcorner=TRUE,col="red")
}
\keyword{aplot}
