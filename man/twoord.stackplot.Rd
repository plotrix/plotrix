\name{twoord.stackplot}
\alias{twoord.stackplot}
\title{Multiple (stack) plot with two ordinates}
\description{
	Two set of data are plotted on two different ordinate scales.
}
\usage{
twoord.stackplot(lx, rx, ldata, rdata, lcol, rcol, ltype, rtype, 
	border, rylab, lylab, xlab, ..., incrylim=NULL,
	halfwidth=0.4, leftfront=FALSE, mar = c(5, 4, 4, 4))
}
\arguments{
  \item{lx,rx}{x-values for left/right data.}
  \item{ldata,rdata}{data on the left/right y-axes.}
  \item{lcol, rcol}{colors to be used for left/right data.}
  \item{ltype, rtype}{line types to be used for left/right data, see details.}
  \item{border}{color for the border of barplot}
  \item{rylab,lylab}{labels for the left/right y-axes.}
  \item{xlab}{labels for the x-axis.}
  \item{...}{further arguments to be passed to \samp{plot}.}
  \item{incrylim}{a number to increase the limits of y-axes.}
  \item{halfwidth}{half the width of the bars in user units. 
	The bars are centered on successive integers if no x values are supplied}
  \item{leftfront}{if \samp{TRUE}, plot the left data on the front layer.}
  \item{mar}{optional margin adjustment, defaults to c(5,4,4,4).}
}
\details{
\samp{twoord.stackplot} works in the same way as \samp{twoord.plot}
 on which it is heavily inspired. The functions let the user plot
 multiple curve/point or bar plots on the same graph with two different axes.
 The line type can be one of the following \samp{"l"} for lines,
 \samp{"p"} for points, \samp{"b"} for both points and line, 
 \samp{"o"} for overplotted, \samp{"bar"} for barplot.
}
\value{ nil }
\seealso{\link{twoord.plot}}
\author{ Christophe Dutang }
\examples{
# plot data
#

time <- 0:25

A <- 1+1/2*sin(time/2)
B <- A + rnorm(length(A), sd=1/10)
B <- B + rnorm(length(A), sd=1/10)

sizeA <- floor(450*(1 + 1/4*sin(time/2+2))*(1+.1))
sizeB <- 1000-sizeA

C <- (A*sizeA + B*sizeB)/(sizeA+sizeB)


#typical usage 
#

twoord.stackplot(lx=time, rx=time, ldata=cbind(sizeA, sizeB), 
	rdata=cbind(A, B, C),  lcol=c("grey80", "white"), 
	rcol=c("blue", "red","black"), ltype="bar", rtype=c("l","p","o"), 
	border="grey80", lylab="Size", rylab="A,B,C", xlab="Time", 
	main="a plot", incrylim=2/100)

#add a legend
#

par(xpd=TRUE) #extend the area of plotting
par(new=TRUE) #to add new graph "layers"
plot(0:1, 0:1, type="n", xlab="",ylab="", axes=FALSE) #redo the x/y limits

#first legend
legend(-0.18, 1.2, leg=c("Size A", "Size B"), fill=c("grey80", "white")) 
#second legend
legend(.97, -0.08, leg=c("A", "B", "C"), col=c("blue", "red","black"), 
	pch=c(NA, 19, 19), lty=c(1,NA,1)) 

par(xpd=FALSE, new=FALSE) #default setting



#reverse the order of plotting
twoord.stackplot(lx=time, rx=time, ldata=cbind(sizeA, sizeB), 
	rdata=cbind(A, B, C),  lcol=c("grey80", "white"), 
	rcol=c("blue", "red","black"), ltype="bar", rtype=c("l","p","o"), 
	border="grey80", lylab="Size", rylab="A,B,C", xlab="Time", 
	main="a plot", incrylim=2/100, leftfront=TRUE)

}
\keyword{misc}
