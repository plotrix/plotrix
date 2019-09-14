\name{ehplot}
\alias{ehplot}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Engelmann-Hecker-Plot - EH-Plot
}
\description{
  This R function provides a convenient way to visualize the distribution of 
  grouped numerical data.
}
\usage{
  ehplot(data, groups, intervals=50, offset=0.1, log=FALSE,
         median=TRUE, box=FALSE, boxborder="grey50",
         xlab="groups", ylab="values", col="black",
         add=FALSE, sort=TRUE, ...)
}
\arguments{
  \item{data}{
    Vector of numerical data.
}
  \item{groups}{
    Vector of group names which should have the same length as data.
}
  \item{intervals}{
    The data is splitted into a certain number of intervals. If data
    points are in the same interval they are drawn side-by-side.
}
  \item{offset}{
    x-distance between two data points at the same interval.
}
  \item{log}{
    Logarithmic display
}
  \item{median}{
    To show the median of each group. NAs in data are not considered
    for calculating the medians.
}
  \item{box}{
    To underlay a boxplot.
}
  \item{boxborder}{
    The color of the boxplot if a boxplot is drawn.
}
  \item{xlab}{
    x-axis label
}
  \item{ylab}{
    y-axis label
}
  \item{col}{
    vector of colors for the datapoints. (recycled as necessary).
}
  \item{add}{
    add this plot to an existing one (i.e. do not call plot.new).
}
  \item{sort}{
    normally, the groups are sorted by name. To keep the order as provided in
    the groups-vector, set this to FALSE
}
  \item{\dots}{
    additional plot-parameters will be passed to the plot-function
}

}
\author{
  Robby Engelmann <robby.engelmann@med.uni-rostock.de> and
  Michael Hecker <michael.hecker@rocketmail.com>
}

\examples{
data(iris)
ehplot(iris$Sepal.Length, iris$Species, intervals=20, cex=1.8, pch=20)
ehplot(iris$Sepal.Width, iris$Species, intervals=20, box=TRUE, median=FALSE)
ehplot(iris$Petal.Length, iris$Species, pch=17, col="red", log=TRUE)
ehplot(iris$Petal.Length, iris$Species, offset=0.06, pch=as.numeric(iris$Species))

# Groups don't have to be presorted:
rnd <- sample(150)
plen <- iris$Petal.Length[rnd]
pwid <- abs(rnorm(150, 1.2))
spec <- iris$Species[rnd]
ehplot(plen, spec, pch=19, cex=pwid, col=rainbow(3, alpha=0.6)[as.numeric(spec)])
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ misc }
