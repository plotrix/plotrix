\name{battleship.plot}
\alias{battleship.plot}
\title{Display a matrix of values as the widths of stacked rectangles}
\usage{
 battleship.plot(x,mar=c(2,5,5,1),col="white",border="black",
 main="",xlab="",ylab="",xaxlab=NULL,yaxlab=NULL,cex.labels=1,
 maxxspan=0.45,maxyspan=0.45)
}
\arguments{
 \item{x}{A matrix or data frame containing numeric values. See the example.}
 \item{mar}{Margins for the plot.}
 \item{col}{The fill colors for the rectangles.}
 \item{border}{The border colors for the rectangles.}
 \item{main}{The title for the plot (i.e. \samp{main}).}
 \item{xlab,ylab}{The x and y axis labels.}
 \item{xaxlab,yaxlab}{Optional labels for the rows and columns.}
 \item{cex.labels}{Character expansion for the row and column labels.}
 \item{maxxspan,maxyspan}{Scaling factor for the widths and heights of the
  rectangles so that they don't overlap.}
}
\description{
 \samp{battleship.plot} displays a matrix of rectangles, with widths
 proportional to the values in \samp{x}. The values are scaled so that half the
 width of the largest rectangle is equal to \samp{maxxspan} in user units. This
 prevents the rectangles from overlapping. The user can adjust the spacing of the
 stacks of rectangles by changing \samp{maxxspan}. Similarly, maxyspan controls
 the spacing between rectangles in the vertical direction.

 The labels for each stack of plots (the columns of x) are displayed at the top
 of the plot, angled at 45 degrees. The labels for each row of rectangles in the
 stacks (the rows of x) are displayed at the left. Long labels for either may
 require adjusting the \samp{mar} argument. 

 The function will try to extract the labels \samp{xaxlab} and \samp{yaxlab} from
 the matrix column and row names respectively if none are passed.
}
\value{nil}
\author{Jim Lemon - thanks to Adam Maltese for the suggestion}
\keyword{misc}
\seealso{\link{plot}, \link{staxlab}}
\examples{
 x<-matrix(sample(10:50,100,TRUE),10)
 xaxlab=c("One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten")
 yaxlab=c("First","Second","Third","Fourth","Fifth","Sixth","Seventh",
  "Eighth","Ninth","Tenth")
 battleship.plot(x,xlab="The battle has just begun",main="Battleship1",
  xaxlab=xaxlab,yaxlab=yaxlab)
}
