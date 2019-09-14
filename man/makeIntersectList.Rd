\name{makeIntersectList}
\alias{makeIntersectList}
\title{Count set intersections}
\description{Create a list of set intersections from a matrix of indicators}
\usage{
 makeIntersectList(x,xnames=NULL,sep="+")
}
\arguments{
 \item{x}{A data frame or matrix where rows represent objects and columns
  attributes. A \samp{1} or \samp{TRUE} indicates that the object (row) has
  that attribute or is a member of that set (column). \samp{x} can also be
  a matrix or data frame in which the first column contains object identifiers
  and the second contains attribute codes.}
 \item{xnames}{Optional user-supplied names for the attributes of x.}
 \item{sep}{A character to use as a separator for attribute labels.}
}
\details{
 \samp{makeIntersectList} reads a matrix (or data frame where all values are the
 same type) containing dichotomous values (either 0/1 or FALSE/TRUE) or labels
 (see next paragraph). In the first type of input, each row represents an object
 and each column represents a set. A value of 1 or TRUE indicates that that
 object is a member of that set. The function creates a list of vectors that
 correspond to all combinations of the sets (set intersections) and inserts the
 counts of elements in each combination. If a row of \samp{x} is all zeros,
 it will not be counted, but the second last element of the list returned
 contains the count of rows in \samp{x} and thus non-members can be calculated.

 If a matrix (or data frame where all values are the same type) containing values 
 other than 0/1 or TRUE/FALSE, it will be passed to \samp{categoryReshape} for
 conversion to a data frame as described above. See \samp{categoryReshape} for
 details of this.
 
 makeIntersectList combines the set or attribute names to form
 intersection names. For the intersection of sets A and B, the name will
 be A+B (unless \samp{sep} is changed) and so on. These are the names that will
 be displayed by \samp{intersectDiagram}. To change these, use the \samp{xnames}
 argument.
}
\value{
 A list of the intersection counts or percentages, the total number of
 objects and the attribute codes.
}
\keyword{misc}
\author{Jim Lemon}
\seealso{\link{intersectDiagram}, \link{pasteCols}, link{categoryReshape}}
\examples{
 # create a matrix where each row represents an element and
 # a 1 (or TRUE) in each column indicates that the element is a member
 # of that set.
 setdf<-data.frame(A=sample(c(0,1),100,TRUE,prob=c(0.7,0.3)),
  B=sample(c(0,1),100,TRUE,prob=c(0.7,0.3)),
  C=sample(c(0,1),100,TRUE,prob=c(0.7,0.3)),
  D=sample(c(0,1),100,TRUE,prob=c(0.7,0.3)))
 makeIntersectList(setdf)
 ns<-sample(1:8,20,TRUE)
 objects<-0
 for(i in 1:length(ns)) objects<-c(objects,rep(i,ns[i]))
 attributes<-"Z"
 for(i in 1:length(ns)) attributes<-c(attributes,sample(LETTERS[1:8],ns[i]))
 setdf2<-data.frame(objects[-1],attributes[-1])
 makeIntersectList(setdf2)
}
