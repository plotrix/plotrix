\name{radial.grid}
\alias{radial.grid}
\title{Display a radial grid}
\usage{
 radial.grid(labels=NA,label.pos=NULL,radlab=FALSE,radial.lim=NULL,
  start=0,clockwise=FALSE,label.prop=1.1,grid.pos,rad.col="gray",
  grid.col="gray",grid.bg="transparent",show.radial.grid=TRUE,
  start.plot=FALSE)
}
\arguments{
 \item{labels}{The labels to display around the circumference of the grid.}
 \item{label.pos}{Radial positions for the labels.}
 \item{radlab}{Whether to rotate the labels to a radial orientation.}
 \item{radial.lim}{Optional radial limits for the circular plot. If specified,
  these must be the same as the radial limits of the original plot.}
 \item{start}{The zero position on the plot in the units of \samp{label.pos}.}
 \item{clockwise}{Whether to increase angles clockwise rather than the
  default counterclockwise.}
 \item{label.prop}{Proportion of \samp{radial.lim} to place the labels.}
 \item{grid.pos}{Radial positions for the circular grid lines.}
 \item{rad.col}{Color for the radial grid lines.}
 \item{grid.col}{Color for the circumferential grid lines.}
 \item{grid.bg}{Background color for the radial grid.}
 \item{show.radial.grid}{Whether to display the radial lines on the grid.}
 \item{start.plot}{If TRUE, sets up a blank radial grid.}
}
\description{
 \samp{radial.grid} displays a radial grid for the \samp{radial.plot} and
 \samp{radial.pie} functions.
}
\value{nil}
\author{Jim Lemon}
\keyword{misc}
