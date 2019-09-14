\name{triax.fill}
\alias{triax.fill}
\title{Triangle plot fill}
\description{
 Fill a triangle plot with smaller triangles.
}
\usage{
 triax.fill(col)
}
\arguments{
 \item{col}{List of colors (see Details).}
}
\details{
 In order for \samp{triax.fill} to fill an existing plot that has
 been created by a call to \samp{triax.plot}, the user must supply
 a list of fill colors. The first element of the list must begin with
 at least one value that can be interpreted as a color. The second
 element must begin with at least three such values, and so on, adding
 two values for each element of the list. Each list element will be
 displayed as a row of colored triangles starting at the top of the
 plot. The number of elements in the list determines the number of
 rows that will be displayed.
}
\value{nil}
\author{Jim Lemon}
\seealso{\link{triax.plot},\link{color.scale}}
\examples{
 # the data will be something like response at different proportions
 fillval<-list(0,c(0,0.1,0),c(0,0.1,0.2,0.1,0),
  c(0,0.1,0.2,0.3,0.2,0.1,0),c(0,0.1,0.2,0.3,0.4,0.3,0.2,0.1,0),
  c(0,0.1,0.2,0.3,0.4,0.5,0.4,0.3,0.2,0.1,0),
  c(0,0,0.1,0.2,0.3,0.4,0.5,0.4,0.3,0.2,0.1,0,0),
  c(0,0,0,0.1,0.1,0.2,0.3,0.4,0.3,0.2,0.1,0.1,0,0,0))
 # use some method of converting values to colors
 fillcol<-sapply(fillval,function(x) {x*10+1} )
 oldpar<-triax.plot(main="Test of triax.fill function")
 triax.fill(fillcol)
 par(oldpar)
}
\keyword{misc}
