gap_barp<-function (height,gap,width=0.4,names.arg=names(height),
 col=NULL,main="",xlab="",ylab="",xlim=NULL,ylim=NULL,x=NULL,
 height.at=pretty(height),height.lab=NULL,...) {
 
 if (missing(height)) stop("height values required")
 hdim<-dim(height)
 if(is.data.frame(height)) height<-as.matrix(height)
 if(is.null(height.lab)) height.lab<-height.at
 if(missing(gap)) stop("gap must be specified")
 if(gap[1] > gap[2]) {
  temp<-gap[2]
  gap[2]<-gap[1]
  gap[2]<-temp
 }
 if (length(ylab) == 0) ylab <- deparse(substitute(height))
 if (is.null(col)) {
  col<-color.gradient(c(0,1),c(0,1,0),c(1,0),length(height))
  if(!is.null(dim(height))) col<-matrix(col,ncol=hdim[2])
 }
 else if(length(col) < length(height)) rep(col,length.out=length(height))
 if(mean(gap) < 0) to_gap<-which(height < min(gap))
 else to_gap<-which(height > max(gap))
 if(length(to_gap) == 0) stop("no values outside gap")
 if(any(height > gap[1] & height < gap[2])) {
  warning("some heights within gap")
  height[height > gap[1] & height < gap[2]]<-gap[2-(mean(gap) < 0)]
 }
 if(is.null(height.lab)) height.lab<-height.at
 if(mean(gap) < 0) {
  height[to_gap]<-height[to_gap] + diff(gap)
  height.at[height.at < gap[1]]<-height.at[height.at < gap[1]] + diff(gap)
 }
 else {
  height[to_gap]<-height[to_gap] - diff(gap)
  height.at[height.at > gap[2]]<-height.at[height.at > gap[2]] - diff(gap)
 }
 if(is.null(hdim)) colnam<-names(height)
 else colnam<-colnames(height)
 barpinfo<-barp(height=height,names.arg=colnam,col=col,
  main=main,xlab=xlab,ylab=ylab,
  height.at=height.at,height.lab=height.lab,
  xlim=xlim,ylim=ylim,x=x,...)
 axis.break(2,gap[ifelse(mean(gap) > 0,1,2)],style="gap")
 invisible(barpinfo)
}
