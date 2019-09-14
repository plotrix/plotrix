\name{plot.dendrite}
\alias{plot.dendrite}
\title{Plot a dendrogram of a dendrite object}
\description{Plot a dendrogram for two or more mutually exclusive attributes.}
\usage{
 \method{plot}{dendrite}(x,xlabels=NULL,main="",mar=c(1,0,3,0),cex=1,
  col="white",...)
}
\arguments{
 \item{x}{A \samp{dendrite} object containing the counts of objects having
  combinations of mutually exclusive attributes.}
 \item{xlabels}{The category labels that will be displayed beneath the
  dendrogram.}
 \item{main}{The title of the plot.}
 \item{mar}{Margins for the plot.}
 \item{cex}{Character expansion for the leaves of the dendrogram.}
 \item{col}{Background colors for the boxes (see Details).}
 \item{...}{Additional arguments passed to \samp{plot}.}
}
\details{  
 \samp{plot.dendrite} sets up a plot for a dendrogram. The actual plotting of
 the dendrogram is done by \samp{furc}.
 
 If samp{col} is a vector of colors as long as the number of category labels,
 each category label will be displayed in a different colored box. This may 
 may cause problems when different category labels are used at each level
 with common names, as the color for a name will be the same at all levels.
}
\value{nil}
\author{Jim Lemon}
\seealso{\link{furc}}
\examples{
 sex<-sample(c("M","F"),100,TRUE)
 hair<-c(sample(c("Blond","Black","Brown","Red"),90,TRUE),rep(NA,10))
 eye<-sample(c("Blue","Black","Brown","Green"),100,TRUE)
 charac<-data.frame(sex=sex,hair=hair,eye=eye)
 characlist<-makeDendrite(charac)
 shecol<-c(Black="black",Blond="yellow",Blue="blue",Brown="brown",
  F="pink",Green="green",M="lightblue","NA"="gray",Red="orange")
 plot.dendrite(characlist,names(charac),main="Test dendrogram",
  col=shecol)
}
\keyword{misc}
