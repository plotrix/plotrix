\name{makeDendrite}
\alias{makeDendrite}
\title{Build a list of the mutually exclusive attributes of objects}
\description{Build a list of mutually exclusive attributes from a matrix of 
 category indicators.}
\usage{
 makeDendrite(x)
}
\arguments{
 \item{x}{A data frame or matrix where rows represent objects and columns
  mutually exclusive attributes of a given class.}
}
\details{  
 The values in \samp{x} indicate which attribute of a particular class is
  possessed by the object. For instance, the attributes dead and alive are
  mutually exclusive. \samp{makeDendrite} creates a nested list that contains
  the counts of successive combinations of the attributes. The top level
  attributes are taken from the first column, then those are combined with
  the attributes in the second column and so on.
}
\value{
 A list of the counts of objects for each combination of the attribute
 classes.
}
\keyword{misc}
\author{Jim Lemon}
\seealso{\link{plot.dendrite}}
\examples{
 sex<-sample(c("M","F"),100,TRUE)
 hair<-sample(c("Blond","Black","Brown","Red"),100,TRUE)
 eye<-sample(c("Blue","Black","Brown","Green"),100,TRUE)
 charac<-data.frame(sex=sex,hair=hair,eye=eye)
 characlist<-makeDendrite(charac)
 characlist
}
