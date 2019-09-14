\name{brkdn.plot}
\alias{brkdn.plot}
\title{A point/line plotting routine}
\description{Display a point/line plot of breakdowns of one or more variables.}
\usage{
 brkdn.plot(vars,groups=NULL,obs=NULL,data,mct="mean",md="std.error",
 stagger=NULL,dispbar=TRUE,main="Breakdown plot",xlab=NULL,ylab=NULL,xaxlab=NA,
 ylim=NA,type="b",pch=1,lty=1,col=par("fg"),staxx=FALSE,yat=NULL,...)
}
\arguments{
 \item{vars}{The names or indices of one or more columns in a data frame.
  The columns must contain numeric data. If only one variable is to be
  broken down, vars can be a formula.}
 \item{groups}{The name or index of a column in a data frame that classifies
  the values in \samp{vars} into different, usually fixed effect, levels.}
 \item{obs}{The name or index of a column in a data frame that classifies
  the values in \samp{vars} into different, usually random effect, levels.}
 \item{data}{The data frame.}
 \item{mct}{The measure of central tendency to calculate for each group.}
 \item{md}{The measure of dispersion to calculate, NA for none.}
 \item{stagger}{The amount to offset the successive values at each horizontal
  position as a proportion of the width of the plot. The calculated default
  is usually adequate. Pass zero for none.}
 \item{dispbar}{Whether to display the measures of dispersion as bars.}
 \item{main}{The title at the top of the plot.}
 \item{xlab,ylab}{The labels for the X and Y axes respectively. There are
  defaults, but they are basic.}
 \item{xaxlab}{Optional labels for the horizontal axis ticks.}
 \item{ylim}{Optional vertical limits for the plot.}
 \item{type}{Whether to plot symbols, lines or both (as in \samp{plot}).}
 \item{pch}{Symbol(s) to plot.}
 \item{lty}{Line type(s) to plot.}
 \item{col}{Color(s) for the symbols and lines.}
 \item{staxx}{Whether to call \link{staxlab} to display the X axis
  labels.}
 \item{yat}{Optional y axis tick positions.}
 \item{...}{additional arguments passed to \samp{plot}.}
}
\value{
 A list of two matrices of dimension \samp{length(levels(groups))} by 
 \samp{length(levels(obs))}. The first contains the measures of central
 tendency calculated and its name is the name of the function passed as
 \samp{mct}. The second contains the measures of dispersion and its name
 is the name of the function passed as \samp{md}.
 
 If both \samp{groups} and \samp{obs} are not NULL, the rows of each matrix
 will be the \samp{groups} and the columns the \samp{obs}. If \samp{obs}
 is NULL, the rows will be the \samp{groups} and the columns the \samp{vars}.
 If \samp{groups} is NULL, the rows will be the \samp{vars} and the columns
 the \samp{obs}. That is, if \samp{vars} has more than one element, if
 \samp{obs} is NULL, the elements of \samp{vars} will be considered to
 represent observations, while if \samp{groups} is NULL, they will be
 considered to represent groups. At least one of \samp{groups} and \samp{obs}
 must be not NULL or there is no point in using \samp{brkdn.plot}.
}
\details{
 \samp{brkdn.plot} displays a plot useful for visualizing the breakdown of a
 response measure by two factors, or more than one response measure by either
 a factor representing something like levels of treatment (\samp{groups}) or
 something like repeated observations (\samp{obs}). For example, if
 observations are made at different times on data objects that receive
 different treatments, the \samp{groups} factor will display the measures
 of central tendency as points/lines with the same color, symbol and line type,
 while the \samp{obs} factor will be represented as horizontal positions on the
 plot. If \samp{obs} is numeric, its unique values will be used as the 
 positions, if not, 1 to the number of unique values. This is a common way of 
 representing changes over time intervals for experimental groups.

 If only one numeric variable is to be broken down, \samp{vars} may be a
 formula like \samp{var~groups+obs}. The position of the two factors to break
 down the variable is fixed - the second term will be interpreted as "groups"
 and the third, if present, will be interpreted as "obs".
}
\author{Jim Lemon}
\seealso{\link{dispersion}}
\examples{
 test.df<-data.frame(a=rnorm(80)+4,b=rnorm(80)+4,c=rep(LETTERS[1:4],each=20),
  d=rep(rep(letters[1:4],each=4),5))
 # first use the default values
 brkdn.plot("a","c","d",test.df,pch=1:4,col=1:4)
 # now jazz it up a bit using medians and median absolute deviations
 # and some enhancements
 bp<-brkdn.plot(a~c+d,data=test.df,main="Test of the breakdown plot",
  mct="median",md="mad",xlab="Temperature range", ylab="Cognition",
  xaxlab=c("10-15","16-20","21-25","25-30"),pch=1:4,lty=1:4,col=1:4)
 es<-emptyspace(bp)
 legend(es,legend=c("Sydney","Gosford","Karuah","Brisbane"),pch=1:4,
  col=1:4,lty=1:4,xjust=0.5,yjust=0.5)
}
\keyword{misc}
