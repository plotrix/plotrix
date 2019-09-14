box.heresy<-function(x,y,uinner,linner,ulim,llim=ulim,
 boxwidth=NULL,intervals=FALSE,arrow.cap=NULL,pch=22,main="",xlab="",
 ylab="",xaxlab=NULL,col="white",do.first=NULL,...) {

 if(missing(y)) {
  y<-x
  x<-1:length(y)
 }
 if(missing(llim)) llim<-ulim
 if(missing(linner)) linner<-uinner
 if(is.null(xaxlab)) xaxlab<-x
 # if dispersion is specified in intervals, convert to absolute values
 if(intervals) {
  ulim<-y+ulim
  llim<-y-llim
  uinner<-y+uinner
  linner<-y-linner
 }
 if(is.null(boxwidth)) {
  if(length(x) > 1) xrange<-range(x)
  else xrange<-c(0.5,1.5)
  boxwidth<-diff(xrange)/(4*length(x))
  xspace<-diff(xrange)/10
  xlim<-c(xrange[1]-xspace,xrange[2]+xspace)
 }
 else {
  nboxes<-length(y)
  xspace<-min(boxwidth)/4
  x<-cumsum(boxwidth*2)+cumsum(rep(xspace,nboxes))
  xlim<-c(xspace+boxwidth[1]/2,x[nboxes]+boxwidth[nboxes]+xspace)
 }
 plot(x,y,xlim=xlim,ylim=range(c(llim,ulim)),main=main,
 xlab=xlab,ylab=ylab,type="n",xaxt="n")
 if(!is.null(do.first)) eval(parse(text=do.first))
 axis(1,at=x,labels=xaxlab)
 if(is.null(arrow.cap)) arrow.cap<-boxwidth/diff(par("usr")[1:2])
 # upper and lower limits have already been converted
 dispersion(x,y,ulim,llim,intervals=FALSE,arrow.cap=arrow.cap,...)
 rect(x-boxwidth,linner,x+boxwidth,uinner,col=col)
 points(x,y,pch=pch)
}
