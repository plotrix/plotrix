\name{color.id}
\alias{color.id}
\title{Identify closest match to a color}
\description{
 Given a color specified as a hex string, find the closest match in the
 table of known (named) colors
}
\usage{
 color.id(col)
}
\arguments{
 \item{col}{a color specified as a hex string}
}
\details{
 finds the color with the minimum squared distance in RGB space
}
\value{
 the name of the closest match
}
\author{Ben Bolker}
\seealso{\link{col2rgb},\link{colors}}
\examples{
 color.id("#cc00cc")
}
\keyword{color}
