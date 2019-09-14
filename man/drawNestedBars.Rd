\name{drawNestedBars}
\alias{drawNestedBars}
\title{Display nested bars}
\description{Displays the nested bars for barNest.}
\usage{
 drawNestedBars(x,start,end,shrink=0.1,errbars=FALSE,intervals=TRUE,col=NA,
 labelcex=1,lineht=NULL,showall=TRUE,Nwidths=FALSE,barlabels=NULL,
 showlabels=TRUE,arrow.cap=NA)
}
\arguments{
 \item{x}{One level of the breakdown produced by \samp{brkdnNest}.}
 \item{start,end}{The left and right x coordinates for the bar or group of bars
  to be displayed.}
 \item{shrink}{The proportion to shrink the width of the bars at each level.}
 \item{errbars}{Whether to display error bars on the bars.}
 \item{intervals}{Whether to use offsets or absolute values when displaying
  measures of dispersion.}
 \item{col}{The colors to use to fill the bars. See Details.}
 \item{labelcex}{Character size for the group labels.}
 \item{lineht}{The height of a margin line in user units.}
 \item{showall}{Whether to display the bars at any levels above the last.}
 \item{Nwidths}{Whether to scale the widths of the bars to the number of
  observations.}
 \item{barlabels}{Optional labels to display below the bars.}
 \item{showlabels}{Whether to display the labels below the bars.}
 \item{arrow.cap}{The width of the "cap" on error bars in user units,
  defaulting to 0.01 of the width of the plot.}
}
\value{nil}
\details{
 \samp{drawNestedBars} displays the bars for the nested breakdown performed
 by \samp{brkdnNest}. It starts at the top of the list and calls itself for
 each level of the breakdown. It is unlikely to be useful for anything else.

 The combination of \samp{showlabels=TRUE} and \samp{showall=FALSE} allows
 the display of all of the labels below the plot with only the last set of
 bars being displayed. To have a set of labels not displayed, pass explicit
 \samp{barlabels} and have zero length labels for the level that is not to
 have labels.
}
\author{Jim Lemon and Ofir Levy}
\seealso{\link{brkdnNest}, \link{drawNestedBars}}
\keyword{misc}
