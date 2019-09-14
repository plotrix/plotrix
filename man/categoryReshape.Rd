\name{categoryReshape}
\alias{categoryReshape}
\title{Convert object label/attribute label coding.}
\description{Convert object label/attribute label coding to an object by
 attribute data frame.}
\usage{
 categoryReshape(x)
}
\arguments{
 \item{x}{A matrix or data frame with at least two columns.}
}
\details{
 \samp{categoryReshape} attempts to convert the first two columns of its input
 into a data frame in which rows represent objects and columns attributes. For
 each object, a value of 1 indicates that the object has that attribute, and a
 value of 0 that it does not. In set membership terms, a 1 indicates that the
 object is a member of that set and a 0 that it is not.
}
\value{A data frame (see Details).}
\keyword{misc}
\author{Jim Lemon}
\seealso{\link{makeIntersectList}}
\examples{
 ns<-sample(1:8,20,TRUE)
 objects<-0
 for(i in 1:length(ns)) objects<-c(objects,rep(i,ns[i]))
 attributes<-"Z"
 for(i in 1:length(ns)) attributes<-c(attributes,sample(LETTERS[1:8],ns[i]))
 setdf<-data.frame(objects[-1],attributes[-1])
 categoryReshape(setdf)
}
