\name{color.axis}
\alias{color.axis}
\title{Display an axis in a specified color}
\usage{
 color.axis(side=1,at=NULL,labels=TRUE,axlab=NA,axlab.at=NA,
  col=par("fg"),cex.axis=par("cex.axis"),cex=par("cex"))
}
\arguments{
 \item{side}{Which axis - see axis.}
 \item{at}{Positions for the tick labels.}
 \item{labels}{Tick labels.}
 \item{axlab}{Optional axis label.}
 \item{axlab.at}{Where to position the axis label - defaults to centered.}
 \item{col}{Color for the axis.}
 \item{cex.axis}{Character expansion for the tick labels.}
 \item{cex}{Character expansion for the axis label.}
}
\description{
 \samp{color.axis} displays an axis in the specified color.
}
\value{nil}
\author{Jim Lemon}
\keyword{misc}
