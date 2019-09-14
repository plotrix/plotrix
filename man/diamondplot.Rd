\name{diamondplot}
\alias{diamondplot}
\title{Plot multiple variables as polygons on a radial grid}
\usage{
 diamondplot(x, bg=gray(0.6), col=rainbow,name="", ...)
}
\arguments{
 \item{x}{A data frame containing numeric values that represent attributes
  (possibly repeated observations) of data objects. See the example.}
 \item{bg}{The background color for the plot.}
 \item{col}{The colors for the polygons.}
 \item{name}{The title for the plot (i.e. \samp{main}).}
 \item{...}{additional arguments passed to \samp{plot}.}
}
\description{
 \samp{diamondplot} displays a plot of polygons on a radial grid representing
 the relationships between one or more attributes of data objects. For a slightly
 different style of plot, see the "spiderweb plot" example in \samp{radial.plot}.
}
\value{nil}
\author{Elisa Biancotto}
\keyword{misc}
\seealso{\link{plot}, \link{radial.plot}}
\examples{
 data(mtcars)
 mysubset<-mtcars[substr(dimnames(mtcars)[[1]],1,1)=="M",c("mpg","hp","wt","disp")]
 diamondplot(mysubset)
}
