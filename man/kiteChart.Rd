\name{kiteChart}
\alias{kiteChart}
\title{ Magnitude by position chart. }
\description{
 Display numeric values as the widths of a polygon along a dimension such as time.
}
\usage{
 kiteChart(x,xlim=NA,ylim=NA,timex=TRUE,main="Kite chart",
 xlab=ifelse(timex,"Time","Groups"),ylab=ifelse(timex,"Groups","Time"),
 border=par("fg"),col=NULL,varpos=NA,varlabels=NA,varscale=FALSE,
 timepos=NA,timelabels=NA,mar=c(5,4,4,4),axlab=c(1,2,3,4),
 normalize=FALSE,shownorm=TRUE,...)
}
\arguments{
 \item{x}{Numeric matrix or data frame}
 \item{xlim}{Horizontal extent of the chart. Defaults to 1:dim(x)[2].}
 \item{ylim}{Vertical extent of the chart. Defaults to 0.5:dim(x)[1]+0.5.}
 \item{timex}{Whether the "time" axis is x (horizontal) or not.}
 \item{main,xlab,ylab}{As in \samp{plot}.}
 \item{border}{The border color(s) for the polygons.}
 \item{col}{The fill colors for the polygons.}
 \item{varpos}{Optional positions for the "kite lines". Defaults to 1:dimx[1].
  (see Details)}
 \item{varlabels}{Labels for the rows of values - defaults to the rownames,
  or if these are missing, varpos[1:dim(x)[1]].}
 \item{varscale}{Whether to show the maximum extent of each "kite line".}
 \item{timepos}{The positions of the values along the x axis, usually times,
  defaulting to 1:dim(x)[2].}
 \item{timelabels}{Labels for the positions, defaulting to \samp{timepos}.}
 \item{mar}{Plot margins. These leave space for the normalization multipliers
  on the right or top side (see Details).}
 \item{axlab}{Where to put axis tick labels and multipliers. See Details.}
 \item{normalize}{Whether to scale each row of values to a maximum width of 1.}
 \item{shownorm}{Whether to display the normalization multipliers.}
 \item{...}{additional arguments passed to \samp{plot}.}
}
\details{
 \samp{kiteChart} displays each row of \samp{x} as a sequence of widths, allowing
 the relationships between those values and the dimension along which they occur
 (usually time) to be illustrated.

 The values in x are scaled to a maximum polygon width of 1 if \samp{normalize}
 is TRUE. This is to avoid overlapping of the polygons. There may be some cases
 where the values can be displayed directly. If normalized, the multipliers will
 be displayed for each row on the right or top side of the chart unless \samp{shownorm}
 is FALSE. Remember to specify the \samp{mar} argument if more space at the top
 is needed.

 The \samp{axlab} argument allows the user to place the axis tick labels and
 normalization multipliers on different axes. The default places the tick labels
 on the bottom and left sides of the plot and the multipliers on the right or top.
 Using \samp{axlab=c(3,4,1,2)} places the tick labels on the top and right and the 
 multipliers on the left or bottom. The \samp{mar} argument may have to be adjusted.

 The user can display raw values by default, or by setting \samp{varpos} to TRUE.
 Setting \samp{varpos} to a vector of positions will place the "kite lines" on those
 values. If there are no row names and the \samp{varlabels} argument is NA, the values
 of \samp{varpos} will be used as labels for each "kite line". The maximum extent of
 each "kite line" can be displayed by setting \samp{varscale} to TRUE. If
 \samp{varscale} is TRUE, one extra line will be added to the top margin. If
 \samp{varpos[1]} is not NA, \samp{normalize} is FALSE by default.
}
\value{The values of \samp{mar} that were current when \samp{kiteChart} was called.}
\author{Jim Lemon (Thanks to Michael Bedward for suggestions on the arguments and
 Nikolaus Lampadariou for the suggestions on displaying raw values)}
\seealso{\link{polygon}}
\examples{
 testmat<-matrix(c(runif(50),sample(1:50,50),rnorm(50)+5,
  sin(1:50)),ncol=50,byrow=TRUE)
 kiteChart(testmat,varlabels=c("Uniform","Sample","Normal","Sine"),
  timepos=seq(1,50,by=5),timex=FALSE)
 # not enough space for the last label, add it
 mtext("Sine",at=65,side=1,line=2)
 # now show it with kite line maxima
 kiteChart(testmat,varlabels=c("Uniform","Sample","Normal","Sine"),
  timepos=seq(1,50,by=5),timex=FALSE,varscale=TRUE)
 mtext("Sine",at=65,side=1,line=2)
 musicmat<-matrix(c(c(0.5,0.4,0.3,0.25,0.2,0.15,0.1,rep(0.05,44))+runif(51,0,0.05),
  c(0.1,0.2,0.3,0.35,0.4,0.5,0.4,rep(0.5,14),rep(0.4,15),rep(0.3,15))+runif(51,0,0.1),
  rep(0.15,51)+runif(51,0,0.1),
  c(rep(0,29),c(0.1,0.2,0.4,0.5,0.3,0.2,rep(0.05,16))+runif(22,0,0.05)),
  c(rep(0,38),c(rep(0.05,6),0.08,0.15,0.20,0.25,0.2,0.25,0.3)+runif(13,0,0.05))),
  ncol=51,byrow=TRUE)
 kiteChart(musicmat,varlabels=c("Swing","Rock","Jazz","Disco","Rap"),
  main="An utterly imaginary chart of music popularity",
  timepos=seq(1,51,by=10),timelabels=seq(1950,2000,by=10),mar=c(5,4,4,2))
 # now flip it to vertical, normalize and show the normalization factors
 kiteChart(musicmat,varlabels=c("Swing","Rock","Jazz","Disco","Rap"),
  main="An utterly imaginary chart of music popularity",xlab="Style",
  timepos=seq(1,51,by=10),timelabels=seq(1950,2000,by=10),mar=c(5,4,4,2),
  timex=FALSE,normalize=TRUE,shownorm=TRUE)
}
\keyword{misc}
