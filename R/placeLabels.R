placeLabels<-function(x,y=NA,labels,pointer=TRUE,cex=1,labelcol=par("fg"),
 labelbg="white",border=par("fg"),pointercol=par("fg"),
 pch=1,col=1,bg="white",flagcol="red") {

 if(is.na(y) && is.list(x)) {
  y<-unlist(x[[2]])
  x<-unlist(x[[1]])
 }
 nlabels<-length(labels)
 if(length(labelcol) < nlabels) labelcol<-rep(labelcol,length.out=nlabels)
 if(length(labelbg) < nlabels) labelbg<-rep(labelbg,length.out=nlabels)
 if(length(border) < nlabels) border<-rep(border,length.out=nlabels)
 if(length(pointercol) < nlabels) pointercol<-rep(pointercol,length.out=nlabels)
 if(length(pch) < nlabels) pch<-rep(pch,length.out=nlabels)
 if(length(col) < nlabels) col<-rep(col,length.out=nlabels)
 if(length(bg) < nlabels) bg<-rep(bg,length.out=nlabels)
 for(i in 1:nlabels) {
  points(x[i],y[i],pch=19,col=flagcol)
  labelxy<-locator(1)
  if(pointer)
   segments(x[i],y[i],labelxy$x,labelxy$y,col=pointercol[i])
  boxed.labels(labelxy$x,labelxy$y,labels[i],
   col=labelcol[i],bg=labelbg[i],border=border[i])
  points(rep(x[i],2),rep(y[i],2),pch=c(19,pch[i]),
   col=c("white",col[i]),bg=c(NA,bg[i]))
 }
}
