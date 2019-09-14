\name{raw.means.plot}
\alias{raw.means.plot}
\alias{raw.means.plot2}
\title{
raw.means.plot: Raw-Means Plots for Experimental Designs
}
\description{
raw.means.plot is a function for visualizing results of experimental designs
 with up to two factors. It plots both raw data (background) and factor/cell
 means (foreground) to provide a more accurate visualization of the underlying
 distribution.
}
\usage{
raw.means.plot(data, col.offset = 2, col.x = 3, col.value = 4, na.rm = FALSE,
 avoid.overlap = c("y", "x", "both"), y.factor = 1, y.amount = NULL,
 x.amount = 0.05, pch = 21:25, lty = 1:5, bg.b.col = "darkgrey",
 bg.f.col = NULL, fg.b.col = "black",fg.f.col = "black", type = "o",
 pt.cex = 1, lwd = 1, xlab = "", ylab = "", ylim, max.offset = 0.2,
 xaxis = TRUE, x.labels, xaxt = "n", plot = TRUE, legend = TRUE, mar = NULL,
 reset.mar = TRUE, l.pos, yjust = 0.5, l.bty = "n", l.adj = c(0, 0.5), ...)

raw.means.plot2(data, col.id, col.offset, col.x, col.value,
 fun.aggregate = "mean", ...)

}
\arguments{
  \item{data}{
 a \samp{data.frame} in long format (i.e., each datapoint one row,
 see \samp{\link{reshape}} or the reshape package) that contains at least
 three columns: one column coding the first factor (\samp{col.offset}), one
 column coding the second factor (\samp{col.x}), and one column containing
 the values (\samp{col.value}).
}
  \item{col.id}{
 a \samp{character} scalar, specifiying the name of the column specifying the
 id column. (only for \samp{raw.means.plot2})
}
  \item{col.offset}{
 a \samp{character} or \samp{numeric} (only \samp{raw.means.plot}) scalar,
 specifiying either name or number of the column coding the different lines
 (the offset or first factor).
}
  \item{col.x}{
 a \samp{character} or \samp{numeric} (only \samp{raw.means.plot}) scalar,
 specifiying either name or number of the column coding the x-axis factor.
 Default is 3.
}
  \item{col.value}{
 a \samp{character} or \samp{numeric} (only \samp{raw.means.plot}) scalar,
 specifiying either name or number of the data column. Default is 4.
}
  \item{na.rm}{
\samp{logical} indicating whether \samp{NA} values should be stripped before
 the computation proceeds. Default is \samp{FALSE}. Throws an error message
 if FALSE and NAs are encountered.
}
  \item{avoid.overlap}{
 character. What should happen to datapoints within one cell of the two
 factors that have the same value.
\itemize{
 \item \samp{"y"} (the default) \link{jitter} is added so that
  overlapping points are distinguishable on the \strong{y}-axis
 \item \samp{"x"} \link{jitter} is added so that overlapping points
 are distinguishable on the \strong{x}-axis
 \item \samp{"both"} \link{jitter} is added so that overlapping points
 are distinguishable on both the \strong{y}- and the \strong{x}-axis.
 \item anything else. No jitter is added.
}
}
  \item{y.factor}{
 \samp{factor} for controlling the amount of jitter on the y-axis
 (will be passed to \link{jitter}).
}
  \item{y.amount}{
 \samp{amount} for controlling the amount of jitter on the y-axis
 (will be passed to \link{jitter}).
}
  \item{x.amount}{
 \samp{amount} for controlling the amount of jitter on the x-axis
 (will be passed to \link{jitter}).
}
  \item{pch}{
 \samp{pch} values (plot symbols) taken for plotting the data. Note that
 the same values are taken for raw data and means. see \link{points}
 for more details. Recycled if too short (with warning). Default is 21:25,
 because those are the only values that can be displayed filled and non-filled.
 All other values should not be used. 
}
  \item{lty}{
\samp{lty} values (line types) for connecting the means. See \link{par}
 for more details. Recycled if too short (with warning). Default is 1:5.
}
  \item{bg.b.col}{
 background border color: border color of raw data points. Silently recycled. Default:
 \samp{"darkgrey"} 
}
  \item{bg.f.col}{
 background filling color: fill color of raw data points. Silently recycled. Default:
 \samp{NULL}
}
  \item{fg.b.col}{
 foreground border color: border color of mean data points. Silently recycled. Default:
 \samp{black}
}
  \item{fg.f.col}{
 foreground fill color: fill color for mean data points. Silently recycled. Default:
 \samp{black}
}
  \item{type}{
 same as type in \link{plot}. Default: \samp{o} ("overplotted")
}
  \item{pt.cex}{
 \samp{numeric} specifying the \samp{cex} value used for plotting the points.
 Default is 1.
}
  \item{lwd}{
 \samp{numeric} specifying the \samp{lwd} value used for plotting the lines.
 Default is 1.
}
  \item{xlab}{
 x-axis label. Default: \samp{""}
}
  \item{ylab}{
 y-axis label. Default: \samp{""}
}
  \item{ylim}{
 the y-axis limits of the plot. If not specified (the default) will be taken
 from data so that all raw data points are visible and a warning message is
 displayed specifying the ylim.
}
  \item{max.offset}{
 \samp{numeric}. maximal offset of factor levels from the offset factor
 (\samp{col.offset}) specifying the different lines. The centre of each factor
 on the x-axis is at full numbers (starting from 1 to ...). The maximum will
 only be reached if the number of factor levels (from \samp{col.offset}) is
 even. Default: 0.2.
}
  \item{xaxis}{
 \samp{logical} value indicating whether or not the x-axis should be generated
 by \samp{raw.means.plot}. If \samp{TRUE}, labels for the x-axis will be taken
 either from the unique values of \samp{col.x} or can be specified with
 \samp{x.labels}.
}
  \item{x.labels}{
 \samp{character} vector specifiying \samp{col.x} levels. Only relevant if
 \samp{xaxis=TRUE}. Then, the values given here will be displayed at the
 x-axis for each factor level of \samp{col.x}.
}
  \item{xaxt}{
 A character which specifies whether ot not the x-axis should be plotted by
 the call to plot function. Interfers with the aforementioned \samp{xaxis}
 argument and the automatic \samp{xaxis} function by \samp{raw.means.plot}.
 Just there for completeness. Default \samp{"n"} (and should not be changed).
}
  \item{plot}{
 \samp{logical}. Should the \samp{raw.means.plot} be drawn or not. If
 \samp{TRUE} (the default) plot will be drawn. If \samp{FALSE} only the legend
 will be drawn (if \samp{legend = TRUE}) See details.
}
  \item{legend}{
 \samp{logical} indicating whether or not \samp{raw.means.plot} should
 automatically add a legend on the right outside the plot area indicating
 which line and points refer to which \samp{col.offset} factor levels. Default
 is \samp{TRUE}.
}
  \item{mar}{
 \samp{NULL} or \samp{numerical} vector of length 4 indicating the margins of
 the plot (see \link{par}). If \samp{NULL} (the default) the right
 margin (i.e., \samp{par("mar")[4]}) will be (imperfectly) guessed from the
 \samp{col.offset} factors for placing the legend right to the plot. If length
 is four this value will be taken. Ignored for \samp{plot = FALSE}.
}
  \item{reset.mar}{
\samp{logical} indicating if the margins (\samp{mar}) shall be resetted after
 setting internally. Will be ignored if \samp{legend = FALSE}. Default is
 \samp{TRUE} and should not be changed (especially with \samp{plot = FLASE}).
}
  \item{l.pos}{
 \samp{numeric} vector of length 2 indicating the position of the legend. If
 not specified automatically determined. See details.
}
  \item{yjust}{
 how the legend is to be justified relative to the legend y location. A value
 of 0 means top, 0.5 means centered and 1 means bottom justified. Default is
 0.5.
}
  \item{l.bty}{
 the type of box to be drawn around the legend. The allowed values are
 \samp{"o"} and \samp{"n"} (the default).
}
  \item{l.adj}{
 \samp{numeric} of length 1 or 2; the string adjustment for legend text. Useful
 for y-adjustment when labels are plotmath expression. see \link{legend}
 and \link{plotmath} for more info.
}
  \item{\dots}{
 further arguments which are either passed to plot or legend (or
 \samp{raw.means.plot} for \samp{raw.means.plot2}). The following arguments
 are passed to legend, all others are passed to plot:
 \samp{"fill", "border", "angle", "density", "box.lwd", "box.lty", "box.col",
 "pt.cex", "pt.lwd", "xjust", "x.intersp", "y.intersp", "text.width",
 "text.col", "merge", "trace", "plot", "ncol", "horiz", "title", "inset",
 "title.col", "title.adj"}
}
  \item{fun.aggregate}{
 Function or function name used for aggregating the data across the two
 factors. Default is \samp{"mean"}. (only for \samp{raw.means.plot2})
}
}
\details{

\samp{raw.means.plot2} is probably the more useful function, as it allows for
 using a data.frame with more than two-factors and aggregates across the other
 factors, but needs a column specifying the experimental unit (e.g.,
 participant).

\samp{raw.means.plot} is basically an advanced wrapper for two other
 functions: \link{plot} and (if \samp{legend=TRUE})
 \link{legend}. Furthermore, raw data is plotted with a call to
 \link{points} and the means with a call to \link{lines}.

You can use \samp{raw.means.plot} to plot only a legend by setting
 \samp{plot = FALSE} and \samp{legend = TRUE}. Then, \samp{raw.means.plot}
 will draw an invisible plot with \samp{xlim = c(0,10)} and
 \samp{ylim = c(0, 10)} and place the legend on this invisible plot. You
 can specify \samp{l.pos} to position the legend, otherwise it will be plotted
 at \samp{c(5,5)} (i.e., in the middle of the plot). Note that
 \samp{xpd = TRUE} in the call to \samp{legend} (see \link{par}).
}
\value{
Nothing. This function is invoked for its side effects.
}
\author{
Henrik Singmann (\email{henrik.singmann@psychologie.uni-freiburg.de}) with
 ideas from Jim Lemon
}
\seealso{
\link{add.ps} can be used in addition to\samp{raw.means.plot} to
 compare the factors at each x-axis position, by adding p-values from t-tests
 to the x-axis.
}


\examples{

x <- data.frame(id = 1:150, offset = rep(c("Group A", "Group B", "Group C"),
 each = 50), xaxis = sample(c("A", "B", "C", "D"),150, replace = TRUE),
 data = c(rnorm(50, 10, 5), rnorm(50, 15,6), rnorm(50, 20, 5)))

raw.means.plot(x)

raw.means.plot(x, main = "Example", ylab = "Values", xlab = "Factor",
 title = "Groups")

raw.means.plot(x, "offset", "xaxis", "data")

raw.means.plot(x, "xaxis", "offset", "data")

raw.means.plot(x, 3, 2, 4)

# different colors:
raw.means.plot(x, main = "Example", ylab = "Values", xlab = "Factor",
 title = "Groups", fg.f.col = c("red","blue", "green"))

x2 <- data.frame(id = 1:150, offset = rep(c("Group A", "Group B", "Group C"),
 each = 50), xaxis = sample(c("A", "B", "C", "D"),150, replace = TRUE),
 data = c(rnorm(50, 10, 5), rnorm(50, 15,6), rnorm(50, 20, 5)))

layout(matrix(c(1,2,3,3), 2,2,byrow = TRUE), heights = c(7,1))
raw.means.plot(x, main = "Data x1", ylab = "Values", xlab = "Factor",
 legend = FALSE, mar = c(4,4,4,1)+0.1)
raw.means.plot(x2, main = "Data x2", ylab = "Values", xlab = "Factor",
 legend = FALSE, mar = c(4,4,4,1)+0.1)
raw.means.plot(x2, plot = FALSE, title = "Groups")


y <- data.frame(id = 1:300, offset = rep(1, 300),
 axis = sample(LETTERS[1:6],300, replace = TRUE), data = c(rnorm(100, 1),
 rnorm(100), rnorm(100,1)))

par(mfrow = c(2,2))

raw.means.plot(y, legend = FALSE)

raw.means.plot(y, type = "p", legend = FALSE)

raw.means.plot(y, type = "l", legend = FALSE)

raw.means.plot(y, 3, 2, x.labels = "one group only")


# Example with overlapping points
z <- data.frame (id = 1:200, offset = rep(c("C 1", "C 2"), 200),
 axis = sample(LETTERS[1:4], 200, replace = TRUE),
 data = sample(1:20, 200, replace = TRUE))

# x versus y jitter
par(mfrow = c(2,2))
raw.means.plot(z, avoid.overlap = "none", main = "no-jitter")
raw.means.plot(z, main = "y-axis jitter (default)")
raw.means.plot(z, avoid.overlap = "x", main = "x-axis jitter")
raw.means.plot(z, avoid.overlap = "both", main = "both-axis jitter")


# y-axis jitter (default)
par(mfrow = c(2,2))
raw.means.plot(z, avoid.overlap = "none", main = "no jitter")
raw.means.plot(z, y.factor = 0.5, main = "smaller y-jitter")
raw.means.plot(z, main = "standard y-jitter")
raw.means.plot(z, y.factor = 2, main = "bigger y-jitter")


# x-axis jitter (default)
par(mfrow = c(2,2))
raw.means.plot(z, avoid.overlap = "none", main = "no jitter")
raw.means.plot(z, avoid.overlap = "x", x.amount = 0.025,
 main = "smaller x -jitter")
raw.means.plot(z, avoid.overlap = "x", main = "standard x-jitter")
raw.means.plot(z, avoid.overlap = "x", x.amount= 0.1,
 main = "bigger x-jitter")



\dontrun{

#The examples uses the OBrienKaiser dataset from car and needs reshape.
require(reshape)
require(car)
data(OBrienKaiser)
OBKnew <- cbind(factor(1:nrow(OBrienKaiser)), OBrienKaiser)
colnames(OBKnew)[1] <- "id"
OBK.long <- melt(OBKnew)
OBK.long[, c("measurement", "time")] <-
 t(vapply(strsplit(as.character(OBK.long$variable), "\\\."),  "[", c("", "")))

raw.means.plot2(OBK.long, "id", "measurement", "gender", "value")

raw.means.plot2(OBK.long, "id", "treatment", "gender", "value")

# also use add.ps:
# For this example the position at each x-axis are within-subject comparisons!
raw.means.plot2(OBK.long, "id", "measurement", "gender", "value")
add.ps(OBK.long, "id", "measurement", "gender", "value", paired = TRUE)
 #reference is "fup"

raw.means.plot2(OBK.long, "id", "measurement", "gender", "value")
add.ps(OBK.long, "id", "measurement", "gender", "value", ref.offset = 2,
 paired = TRUE) #reference is "post"

# Use R's standard (i.e., Welch test)
raw.means.plot2(OBK.long, "id", "treatment", "gender", "value")
add.ps(OBK.long, "id", "treatment", "gender", "value",
 prefixes = c("p(control vs. A)", "p(control vs. B)"))

# Use standard t-test
raw.means.plot2(OBK.long, "id", "treatment", "gender", "value")
add.ps(OBK.long, "id", "treatment", "gender", "value", var.equal = TRUE,
 prefixes = c("p(control vs. A)", "p(control vs. B)"))

}

}
