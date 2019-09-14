textbox<-function(x,y,textlist,justify=c("l","c","r"),cex=1,leading=0.5,
 box=TRUE,adj=c(0,0),font=NULL,vfont=NULL,col=NULL,border=NULL,fill=NA,
 density=NULL,angle=45,lty=par("lty"),lwd=par("lwd"),margin=0) {

 if (length(margin) == 1) margin<-rep(margin, 4)
 else if (length(margin) == 2) margin<-rep(margin, 2)
 saveAdj<-par(adj = 0)
 textstr<-paste(textlist, collapse=" ")
 words<-strsplit(textstr," ")[[1]]
 line.height<-strheight("hy",cex=cex,font=font,vfont=vfont) * (1+leading)
 if(margin[2] > 0) x[1]<-x[1] + margin[2]
 if(margin[3] > 0) y<-y-margin[3]
 if(margin[4] > 0) x[2]<-x[2]-margin[4]
 if(x[1] >= x[2]) x[2]<-x[1]+diff(par("usr")[1:2])*0.1
 x.len<-diff(x)
 y.pos<-y
 x.pos<-x[1]
 adj2<-c(0,1)
 if(justify[1] == "c") {
  x.pos<-x.pos + x.len/2
  adj2[1]<-0.5
 }
 else {
  if(justify[1] == "r") {
   x.pos<-x.pos + x.len
   adj2[1]<-1
  }
 }
 curword<-1
 curline<-1
 txtline<-""
 while(curword <= length(words)) {
  txtline[curline]<- ""
  txtline[curline]<-paste(txtline[curline],words[curword])
  curword<-curword + 1
  while(strwidth(paste(txtline[curline],words[curword]),cex=cex, 
   font=font,vfont=vfont) < x.len && !is.na(words[curword])) {
   txtline[curline]<-paste(txtline[curline],words[curword])
   curword<-curword+1
  }
  curline<-curline+1
  y.pos[curline]<-y.pos[curline-1]-line.height
 }
 if(box) {
  xbox<-x
  ybox<-c(y.pos[curline],y)
  ybox[1]<-ybox[1]-abs(margin[1])
  xbox[1]<-xbox[1]-abs(margin[2])
  ybox[2]<-ybox[2]+abs(margin[3])
  xbox[2]<-xbox[2]+abs(margin[4])
  rect(xbox[1],ybox[1],xbox[2],ybox[2],border=border, 
   col=fill,density=density,angle=angle,lty=lty,lwd=lwd)
 }
 text(x.pos,y.pos[1:curline-1],txtline,adj=adj+adj2,cex=cex,
  col=col,font=font,vfont=vfont)
 par(saveAdj)
 return(y.pos)
}
