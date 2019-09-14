thigmophobe.labels<-function(x,y,labels=NULL,text.pos=NULL,...) {
 if(missing(x)) stop("Usage: thigmophobe.labels(x,y,labels=1:length(x))")
 lenx<-length(x)
 if(missing(y)) {
  if(is.list(x) && lenx >= 2) {
   y<-x[[2]]
   x<-x[[1]]
  }
  else stop("if y is missing, x must be a list with at least 2 elements")
 }
 validxy<-!(is.na(x) | is.na(y))
 if(is.null(labels)) labels<-1:lenx
 if(is.null(text.pos)) {
  if(lenx > 1) text.pos<-thigmophobe(x[validxy],y[validxy])
  else text.pos<-3
 }
 par(xpd=TRUE)
 text(x[validxy],y[validxy],labels[validxy],pos=text.pos,...)
 par(xpd = FALSE)
}
