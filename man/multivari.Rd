\name{multivari}
\alias{multivari}
\title{
Function to draw a multivari chart
}
\description{
A multivari chart of one quantitative response variable depending on two
to four categorical variables can be drawn.
}
\usage{
multivari(var, fac1, fac2, fac3 = NULL, fac4 = NULL, data, sort = FALSE,
 fun = mean, pch = list(15, 16, 17), col = list("black", "blue", "red"),
 col0 = "black", cex = 1, fac.cex = 2, xlab.depth = 3, legend = FALSE,
 main = paste("multivari chart of", var), add = FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{var}{variable name (character string) or column index of response
  variable, required
}
  \item{fac1}{variable name (character string) or column index of first
  level factor, required; precedes \code{fac2} and \code{fac3} (if present) in the hierarchy (see Details)
}
  \item{fac2}{variable name (character string) or column index of second
  level factor, required; follows \code{fac1} and precedes \code{fac3} (if present) 
  in the hierarchy (see Details)
}
  \item{fac3}{variable name (character string) or column index of third
  level factor, optional; if present, \code{fac3} is the last factor in the hierarchy (see Details)
}
  \item{fac4}{
variable name (character string) or column index of fourth level factor,
optional; can only be specified if there is also a third level factor;
if present, this factor is the first in the hierarchy (see Details), and separate multivari charts for the first three factors are drawn for each level of this factor}
  \item{data}{
a data frame, required
}
  \item{sort}{
logical, specifying whether or not levels are sorted, when converting
character vectors to factors (a single choice for all factors is needed); default: \code{FALSE}
}
  \item{fun}{
a function to be used in aggregation; default: \code{mean}
}
  \item{pch}{
  a list of length 2 or 3, depending on whether or not \code{fac3} is
  specified; the ith list element can be an individual plotting symbol
  (like the usual \code{pch} entry) or a vector of plot symbols for each
  level of \code{fac_i}
}
  \item{col}{
  a list of length 2 or 3, depending on whether or not \code{fac3} is
  specified; the ith list element can be an individual color or a vector
  of colors for each level of \code{fac_i}; this color specification is
  used for the plot symbols of \code{fac_i} levels and for the lines
  connecting the symbols for the next level in the hierarchy
}
  \item{col0}{
the color for the first line to be drawn
}
  \item{cex}{
the size of axis annotation text
(annotation of the fourth level header is 1.5 times this size)
}
  \item{fac.cex}{
a multiplier for \code{cex}; plot symbol sizes are \code{fac.cex*cex};
default: 2
}
  \item{xlab.depth}{
labels for the horizontal axis are printed down to this level of the
hierarchy (default: 3); if the depth is reduced, different plot symbols
should be used, and a legend should be drawn
}
  \item{legend}{
logical determining whether or not a legend should be drawn (default:
FALSE); the function determines wether top right or bottom right yields
a better position (it is not guaranteed that there is no overlab); if
this does not work well, one can manually draw a legend in the outer
margin
}
  \item{main}{
title, as usual; a default is provided
}
  \item{add}{
logical; add to an existing plot (which of course has to have suitable axis limits)?; default: FALSE;
note that horizontal axis labeling will always be printed by function multivari, while vertical axis labeling will be omitted for \code{add=TRUE}
}
  \item{\dots}{
further arguments to functions \code{plot}, \code{lines}, \code{points}, 
   \code{mtext}
}
}
\details{
The function is inspired by Minitabs behavior for multivari charts 
(see also Bruno Scibilia's blog which is linked in the references). It
does not attempt to visualize individual observations.

A multivari chart mainly serves exploratory purposes.
It works particularly well with balanced data, but can also be used for messy data. 
\code{multivari} can visualize the dependence of a single quantitative variable on up to four factors (i.e., interactions of order up to four can be visualized). The display is hierarchical: for factors later in the hierarchy, conditional means given level combinations of factors earlier in the hierarchy are displayed. Therefore, the order of the
factors can make a big difference in the display. If there is no natural
order, it may be worthwhile to inspect several orders.

For interactions with two factors only, it is often preferrable to use
function \code{\link{interaction.plot}} or \code{\link{raw.means.plot}}.

}
\value{
a list of (lists of) data frames with summary statistics to be plotted
}

\references{
Scibilia, Bruno (2013). Using Multi-Vari Charts to Analyze Families of Variations. \url{https://blog.minitab.com/en/using-variability-charts-to-analyze-call-center-wait-times}.
}

\author{
Ulrike Groemping
}
\seealso{
See also \code{\link{interaction.plot}}, \code{\link{raw.means.plot}}
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
\dontrun{
require(car)
multivari("cycles", "len", "load", "amp", data=Wool, 
    col=list("black","red",c("grey70","grey45","grey20")),
    pch=list(15,17,8), legend=TRUE, xlab.depth = 2, lwd=2)
multivari("cycles", "load", "len", "amp", data=Wool, 
    col=list("black",c("red","blue","darkgreen"),
    c("grey70","grey45","grey20")),
    pch=list(15,17,8), legend=TRUE, xlab.depth = 2, lwd=2)
    
## create a fake fourth factor
fakedat <- rbind(cbind(newfac="blabla",Wool),cbind(newfac="albalb",Wool))
## make it character for demonstrating the effect of sort option
fakedat$newfac <- as.character(fakedat$newfac)

## default: sort order in the data is respected (order of unique is used)
multivari("cycles", "load", "len", "amp", "newfac", data=fakedat, 
    col=list("black",c("red","blue","darkgreen"),
    c("grey70","grey45","grey20")),
    pch=list(15,17,8), legend=TRUE, xlab.depth = 2, lwd=2, cex=0.8)
    
## sort=TRUE: levels are sorted (order of sort(unique))
multivari("cycles", "load", "len", "amp", "newfac", data=fakedat, 
    col=list("black",c("red","blue","darkgreen"),
    c("grey70","grey45","grey20")),
    pch=list(15,17,8), legend=TRUE, xlab.depth = 2, lwd=2, cex=0.8,
    sort=TRUE)
}
}
\keyword{ hplot }
\keyword{ design }
