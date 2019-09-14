\name{brkdnNest}
\alias{brkdnNest}
\title{Perform a nested breakdown of numeric values}
\description{Breaks down a numeric or categorical element of a data frame
 by one or more categorical elements.}
\usage{
 brkdnNest(formula,data,FUN=c("mean","sd","sd","valid.n"),label1="Overall",
  trueval=TRUE)
}
\arguments{
 \item{formula}{A formula with a numeric element of a data frame on the left and
  one or more categorical elements on the right.}
 \item{data}{A data frame containing the elements in \samp{formula}.}
 \item{FUN}{The functions to be applied to successive breakdowns.}
 \item{label1}{The label to use for the overall value of the first function.}
 \item{trueval}{The value to use in calculating proportions or sums of a
  categorical response variable. See Details.}
}
\value{
 A list with as many elements as there are functions in \samp{FUN}. It is
 probably best to always specify four functions (summary measure, upper
 dispersion measure, lower dispersion measure and number of valid observations)
 even if this is redundant as in the default.

 This function is similar to \samp{brkdn} in the \pkg{prettyR} package, but
 is structured to be used with the \samp{barNest} function. It produces one
 or more measures for the overall data, then the subsets of the data defined by
 the first variable to the right of the tilde, then the subsets defined by
 the first and second variable, and so on.
}
\details{
 \samp{brkdnNest} performs a nested breakdown of an element of a data frame
 by one or more categorical elements. For each category and optional
 subcategories, the variable on the left of the formula is summarized as
 specified by the functions named in \samp{FUN}.

 If \samp{trueval} is not NA, brkdnNest will calculate the proportion of
 \samp{trueval} values in the response variable out of the total valid
 responses. If the function \samp{valid.n} is the first function in 
 \samp{FUN}, the counts of the groups and subgroups will be returned.

 Two specialized summary functions are defined within \samp{brkdnNest}.
 \samp{sumbrk} returns the count of values in a factor equal to \samp{trueval},
 and \samp{propbrk} returns the proportion of values equal to 
 \samp{trueval}. Be aware that if a categorical variable is specified on 
 the left of the formula, functions which expect numeric data such as 
 \samp{mean} should not be included in \samp{FUN}.

 The user should take care when specifying different summary functions.
 \samp{barNest} expects a summary measure as the first component of the list
 and measures of dispersion as the second and third. If two different measures
 of dispersion are passed, the first must calculate the upper and the second
 the lower measure.
}
\author{Jim Lemon}
\seealso{\link{by}}
\examples{
 brkdntest<-data.frame(Age=rnorm(100,25,10),
  Sex=factor(sample(c("M","F"),100,TRUE)),
  Marital=sample(c("M","X","S","W"),100,TRUE),
  Employ=sample(c("FT","PT","NO"),100,TRUE))
 brkdnNest(formula=Age~Sex+Marital+Employ,data=brkdntest)
 # show the proportion of unemployed with binomial confidence intervals
 brkdnNest(formula=Employ~Sex+Marital,data=brkdntest,
  FUN=c("propbrk","binciWu","binciWl"),trueval="NO")
}
\keyword{misc}
