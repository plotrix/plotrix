\name{furc}
\alias{furc}
\title{Plot a dendrite}
\description{Plot one level of a dendrogram displaying two or more mutually 
 exclusive attributes.}
\usage{
 furc(x,xpos,yrange,toplevel,maxx,cex=1,col)
}
\arguments{
 \item{x}{A \samp{dendrite} object containing the counts of objects having
  combinations of mutually exclusive attributes.}
 \item{xpos}{The horizontal position on the plot to display the current level
  of the dendrogram.}
 \item{yrange}{The range of values in which the current level of the dendrogram
  will be displayed.}
 \item{toplevel}{A flag for the function to know whether it is at the top level
  of the dendrogram or not. Do not change this argument.}
 \item{maxx}{The maximum xpos value to suppress staggering of the category
  labels. This is calculated in \samp{plot.dendrite}.}
 \item{cex}{The character expansion to use in the display.}
 \item{col}{The color(s) to use for the backgrounds of the boxes containing
  the category labels.}
}
\details{  
 \samp{furc} displays one \emph{furc}ation of the dendrogram. A furcation is
 a single box displaying its label and count that may split into finer
 divisions. If so, \samp{furc} calls itself for each furcation until there
 are no more splits.
 
 On the final level of categorization, the category labels are staggered 
 to minimize overprinting.
}
\value{nil}
\keyword{misc}
\author{Jim Lemon}
\seealso{\link{plot.dendrite}}
