\name{plot_bg}
\alias{plot_bg}
\title{ Add a background color to a plot }
\description{Displays a colored rectangle over the entire area of a plot}
\usage{plot_bg(col="lightgray")}
\arguments{
 \item{col}{The color of the background}
}
\details{
 \samp{plot_bg} is probably only useful when part of the \samp{do.first}
 argument in another plot function to add a background color to the plot.
}
\value{nil}
\author{Jim Lemon}
\examples{
 barp(1:5,do.first="plot_bg()",col=1:5)
}
\keyword{misc}
