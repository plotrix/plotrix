\name{barNest}
\alias{barNest}
\title{Display a nested breakdown of numeric values}
\description{Breaks down the elements of a data frame by one or more
 categorical elements and displays the breakdown as a bar plot.}
\usage{
 barNest(formula=NULL,data=NULL,FUN=c("mean","sd","sd","valid.n"),ylim=NULL,
 main="",xlab="",ylab="",shrink=0.1,errbars=FALSE,col=NA,
 labelcex=1,lineht=NULL,showall=TRUE,Nwidths=FALSE,barlabels=NULL,
 showlabels=TRUE,mar=NULL,arrow.cap=NULL,trueval=TRUE)
}
\arguments{
 \item{formula}{A formula with a numeric element of a data frame on the left and
  one or more categorical elements on the right.}
 \item{data}{A data frame containing the elements in \samp{formula}.}
 \item{FUN}{The functions to apply to x.}
 \item{ylim}{Optional y limits for the plot, usually necessary for counts.}
 \item{main}{Title for the plot.}
 \item{xlab,ylab}{Axis labels for the plot. The x axis label is typically blank}
 \item{shrink}{The proportion to shrink the width of the bars at each level.}
 \item{errbars}{Whether to display error bars on the lowest level of breakdown.}
 \item{col}{The colors to use to fill the bars. See Details.}
 \item{labelcex}{Character size for the group labels.}
 \item{lineht}{The height of a line of text in the lower margin of the plot in user
  units. This will be calculated by the function if a value is not passed.}
 \item{showall}{Whether to display bars for the entire breakdown.}
 \item{Nwidths}{Whether to scale the widths of the bars to the number of
  observations.}
 \item{barlabels}{Optional group labels that may be useful if the factors used to
  break down the numeric variable are fairly long strings.}
 \item{showlabels}{Whether to display the labels below the bars.}
 \item{mar}{If not NULL, a four element vector to set the plot margins. If new
  margins are set, the user must reset the margins after the function exits.}
 \item{arrow.cap}{The width of the "cap" on error bars in user units,
  calculated on the basis of the number of bars in the final breakdown if NA.}
 \item{trueval}{If this is not NA, the call to \samp{brkdnNest} will return the
  proportions of the response variable that are equal to \samp{trueval}.
  See Details.}
}
\value{The summary list produced by brkdnNest.}
\details{
 \samp{barNest} displays a bar plot illustrating the hierarchic breakdown of
 the elements of a data frame. The breakdown is performed by \samp{brkdnNest}
 and the actual display is performed by \samp{drawNestedBars}. The heights of
 the bars will be proportional to the values returned by the first function in
 \samp{FUN}. If \samp{showall} is TRUE, the entire nested breakdown will be
 displayed. This can be useful in visualizing the relationship between groups
 and subgroups in a compact format.

 \samp{barNest} assumes that there will be four breakdowns in the list
 returned by \samp{brkdnNest} in the order summary measure, upper dispersion
 value, lower dispersion value and number of valid observations. If
 \samp{Nwidths=FALSE}, it may work with only three and if \samp{errbars=FALSE}
 as well, it may work with only one.

 If \samp{Nwidths=TRUE}, the bar widths will be scaled to the relative number
 of observations per group. When the numbers of observations are very different,
 the labels for those bars with small numbers of observations will probably
 overlap.

 A number of functions can be passed in the \samp{FUN} argument. Three
 functions, \samp{propbrk}, \samp{sumbrk} and \samp{valid.n} will work as
 summary measures, giving proportions or sums of particular values of a
 discrete variable and counts in each group and subgroup respectively.
 Binomial confidence limits can be added to the proportions returned by
 \samp{propbrk} with \samp{binciWl} and \samp{binciWu} as in the second last
 example. If \samp{valid.n} is the first element of \samp{FUN}, the "overall"
 bar and label will be suppressed, as they are not informative. It is up to
 the user to decide whether any "error bars" displayed are meaningful.

 The colors of the bars are determined by \samp{col}. If \samp{showall} is
 FALSE, the user only need pass a vector of colors, usually the same length
 as the number of categories in the final (last on the right side) element in
 the formula. If \samp{showall} is TRUE and the user wants to color all of the
 bars, a list with as many elements as there are levels in the breakdown
 should be passed. Each element should be a vector of colors, again usually
 the same length as the number of categories. As the categorical variables are
 likely to be factors, it is important to remember that the colors must be in
 the correct order for the levels of the factors. When the levels are not in
 the default alphanumeric order, it is quite easy to get this wrong. As a
 \samp{barNest} plot with more than a few factors and levels in each factor is
 quite dense, easily distinguished colors for each level of the breakdown may
 be preferable. As with some other plots, trying to cram too much information
 into a single illustration may not work well.
}
\author{Jim Lemon and Ofir Levy}
\references{
 Lemon, J. & Levy, O. (2011) barNest: Illustrating nested summary measures.
 Statistical Computing and Graphics Newsletter of the American Statistical
 Association, 21(2): 5-10.
}
\seealso{\link{brkdnNest}, \link{drawNestedBars}, superbarplot(UsingR)}
\examples{
 # recreate the Titanic data frame and show the three way breakdown
 titanic<-data.frame(
  class=c(rep("1st",325),rep("2nd",285),rep("3rd",706),rep("Crew",885)),
  age=c(rep("Adult",319),rep("Child",6),rep("Adult",261),rep("Child",24),
  rep("Adult",627),rep("Child",79),rep("Adult",885)),
  sex=c(rep("M",175),rep("F",144),rep("M",5),rep("F",1),
  rep("M",168),rep("F",93),rep("M",11),rep("F",13),
  rep("M",462),rep("F",165),rep("M",48),rep("F",31),
  rep("M",862),rep("F",23)),
  survived=c(rep("Yes",57),rep("No",118),rep("Yes",140),rep("No",4),rep("Yes",6),
  rep("Yes",14),rep("No",154),rep("Yes",80),rep("No",13),rep("Yes",24),
  rep("Yes",75),rep("No",387),rep("Yes",76),rep("No",89),
  rep("Yes",13),rep("No",35),rep("Yes",14),rep("No",17),
  rep("Yes",192),rep("No",670),rep("Yes",20),rep("No",3)))
 require(plotrix)
 titanic.colors<-list("gray90",c("#0000ff","#7700ee","#aa00cc","#dd00aa"),
  c("#ddcc00","#ee9900"),c("pink","lightblue"))
 barNest(survived~class+age+sex,titanic,col=titanic.colors,showall=TRUE,
  main="Titanic survival by class, age and sex",ylab="Proportion surviving",
  FUN=c("propbrk","binciWu","binciWl","valid.n"),shrink=0.15,trueval="Yes")
 barNest(survived~class+age+sex,titanic,col=titanic.colors,showall=TRUE,
  main="Titanic survival by class, age and sex (scaled bar widths)",
  ylab="Proportion surviving",FUN=c("propbrk","binciWu","binciWl","valid.n"),
  shrink=0.15,trueval="Yes",Nwidths=TRUE)
 # now show the actual numbers of passengers
 barNest(survived~class+age+sex,titanic,col=titanic.colors,showall=TRUE,
  main="Titanic passengers and crew by class, age and sex",
  ylab="Number",FUN="valid.n",shrink=0.15)
 # to see this properly displayed, start a wide plot window
 # x11(width=10)
 test.df<-data.frame(Age=rnorm(100,35,10),
  Sex=sample(c("Male","Female"),100,TRUE),
  Marital=sample(c("Div","Mar","Sing","Wid"),100,TRUE),
  Employ=sample(c("FT","PT","Un"),100,TRUE))
 test.col<-list(Overall="gray",Sex=c("pink","lightblue"),
  Marital=c("mediumpurple","orange","tan","lightgreen"),
  Employ=c("#1affd8","#caeecc","#ff90d0"))
 barNest(formula=Age~Sex+Marital+Employ,data=test.df,ylab="Mean age (years)",
  main="Mean age by subgroups",errbars=TRUE,col=test.col)
 barNest(formula=Age~Sex+Marital+Employ,data=test.df,ylab="Mean age (years)",
  main="Mean age by subgroups (widths scaled to Ns)",errbars=TRUE,col=test.col,
  Nwidths=TRUE)
 # set up functions for 20th and 80th percentiles
 q20<-function(x,na.rm=TRUE) return(quantile(x,probs=0.2,na.rm=TRUE))
 q80<-function(x,na.rm=TRUE) return(quantile(x,probs=0.8,na.rm=TRUE))
 # show the asymmetric dispersion measures
 barNest(formula=Age~Sex+Marital+Employ,data=test.df,ylab="Mean age (years)",
  main="Use median and quantiles for dispersion",
  FUN=c("median","q80","q20","valid.n"),
  errbars=TRUE,col=test.col)
 barNest(formula=Employ~Sex+Marital,data=test.df,ylab="Proportion unemployed",
  main="Proportion unemployed by sex and marital status",
  FUN=c("propbrk","binciWu","binciWl","valid.n"),
  errbars=TRUE,col=test.col,trueval="Un")
 barNest(formula=Employ~Sex+Marital,data=test.df,ylab="Proportion unemployed",
  main="Proportion unemployed by sex and marital status (scaled bar widths)",
  FUN=c("propbrk","binciWu","binciWl","valid.n"),
  errbars=TRUE,col=test.col,trueval="Un",Nwidths=TRUE)
 barNest(formula=Age~Sex+Marital+Employ,data=test.df,ylab="Counts",
  main="Show the counts in subgroups (final level only)",FUN="valid.n",
  col=test.col,showall=FALSE,ylim=c(0,10))
 barNest(formula=Age~Sex+Marital+Employ,data=test.df,ylab="Counts",
  main="Show all the counts in subgroups",FUN="valid.n",mar=c(5,5,4,2),
  col=test.col)
 }
\keyword{misc}
