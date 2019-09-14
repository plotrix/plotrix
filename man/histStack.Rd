\name{histStack}
\alias{histStack}
\alias{histStack.formula}
\alias{histStack.default}
\title{Histogram "stacked" by categories}
\description{
 Histogram of a quantitative variable with bars that are "stacked" by the
 values of a factor variable.
}
\usage{
 histStack(x,...)

 \method{histStack}{formula}(x,data,breaks="Sturges",col="rainbow",
  right=TRUE,main="",xlab=NULL,legend.pos=NULL,cex.legend=0.75,...)

 \method{histStack}{default}(x,z,breaks="Sturges",col="rainbow",
  right=TRUE,main="",xlab=NULL,legend.pos=NULL,cex.legend=0.75,...)
}
\arguments{
 \item{x}{A vector of quantitative data or a formula of the form x~z
 (see z below).}
 \item{z}{A vector of categorical data (a factor) that will define the
  \dQuote{stacks}.}
 \item{data}{A data frame that contains both x and z.}
 \item{breaks}{Breaks to use in categorizing values of x.}
 \item{col}{Either a vector of colors in any legitimate form or a
  character string that specifies a function that requires only the length
  of the vector as an argument and will return a vector of colors with that
  length. (see Details)}
 \item{right}{A logical that indicates whether the bins are right-open
  (left-closed; =TRUE) or right-closed (left-open; =FALSE; default).}
 \item{main}{A character string that forms the main title for the plot.}
 \item{xlab}{A character string for labeling the x-axis.}
 \item{legend.pos}{A character string or two numeric values indicating the
  position for the stacking legend.}
 \item{cex.legend}{A numeric character expansion value for the legend.
  Values less than 1 will make the legend smaller.}
 \item{...}{Additional arguments sent to the hist function.}
}
\details{
 \samp{histStack} displays a \dQuote{stacked histogram} while using many of
 the same arguments as hist(). The argument \samp{z} will be converted to a
 factor with a warning if it is not already a factor.

 The color functions in \pkg{grDevices} (e.g. "gray.colors") should always
 be valid when passed as the \samp{col} argument. Any function that will
 return a vector of \samp{n} colors when called with a single argument
 \samp{n} and that exists in the current environment should work. An error
 will occur if length(col)==1 and the value is not a function as described
 for \samp{col} (e.g., \samp{col="blue"} will result in an error).If fewer
 colors than levels of \samp{z} are passed, they will be recycled.
}
\value{nil. A plot is displayed.}
\note{
 This function is currently experimental.
}
\author{Derek Ogle with modifications by Jim Lemon}
\seealso{\link{hist}, \link{legend}} 
\examples{
 set.seed(409)
 df<-data.frame(len=rnorm(100)+5,
  grp=sample(c("A","B","C","D"),100,replace=TRUE))
 histStack(len~grp,data=df,main="Default (rainbow) colors",
  xlab="Length category")
 histStack(len~grp,data=df,col="heat.colors",main="Heat colors",
  xlab="Length category",legend.pos="topright")
 histStack(len~grp,data=df,col=2:5,main="Colors by number",
  xlab="Length category",legend.pos=c(2.8,18))
}
\keyword{misc}
