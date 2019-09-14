jiggle<-function(n,range=c(-1,1)) return(rescale(sample(1:n,n),range))

valid.n<-function(x,na.rm=TRUE) return(if(na.rm) sum(!is.na(x)) else length(x))

propbrk<-function(x,trueval=TRUE,na.rm=TRUE) {
 if(anyNA(x) || length(x) == 0) return(0)
 else return(sum(x==trueval,na.rm=TRUE)/
  (if(na.rm) valid.n(x) else length(x)))
}

sumbrk<-function(x,trueval=TRUE,na.rm=TRUE) {
 return(sum(x==trueval,na.rm=TRUE))
}

binciW<-function(x,n,alpha=0.05,cc=FALSE) {
 p<-x/n
 q<-1-p
 z<-qnorm(1-alpha/2)
 z2<-z*z
 if(cc) {
  cil<-(2*n*p+z2-(z*sqrt(z2-1/n+4*n*p*q+(4*p-2))+1))/(2*(n+z2))
  ciu<-(2*n*p+z2+(z*sqrt(z2-1/n+4*n*p*q+(4*p-2))+1))/(2*(n+z2))
 } else {
 cil<-(1/(1+z2/n))*(p+z2/(2*n)-z*sqrt((p/n*q)+z2/(4*n*n)))
 ciu<-(1/(1+z2/n))*(p+z2/(2*n)+z*sqrt((p/n*q)+z2/(4*n*n)))
 }
 if(cil < 0) cil<-0
 if(ciu > 1) ciu<-1
 return(c(cil,ciu))
}

binciWu<-function(x,n,alpha=0.05,trueval=TRUE,na.rm=TRUE) {
 if(missing(n)) n<-ifelse(na.rm,valid.n(x),length(x))
 x<-sum(x==trueval,na.rm=TRUE)
 return(binciW(x,n,alpha=alpha)[2])
}

binciWl<-function(x,n,alpha=0.05,trueval=TRUE,na.rm=TRUE) {
 if(missing(n)) n<-ifelse(na.rm,valid.n(x),length(x))
 x<-sum(x==trueval,na.rm=TRUE)
 return(binciW(x,n,alpha=alpha)[1])
}

brkdnNest<-function(formula, data, FUN = c("mean", "sd", "sd", "valid.n"),
 label1 = "Overall", trueval = TRUE) {

 if(missing(data) || missing(formula)) stop("brkdnNest(formula,data,...")
 bn<-as.character(attr(terms(formula), "variables")[-1])
 nbn<-length(bn)
 nFUN<-length(FUN)
 brklist<-vector("list", nFUN)
 truevalFUN<-c("propbrk","binciWu","binciWl","sumbrk")
 brklevels<-list()
 for(brk in 1:nbn)
  if(is.factor(data[,bn[brk]])) brklevels[[brk]]<-levels(data[,bn[brk]])
  else brklevels[[brk]]<-sort(unique(data[,bn[brk]]))
  for(brkfun in 1:nFUN) {
   brklist[[brkfun]] <- vector("list", nbn)
   if(FUN[brkfun] %in% truevalFUN)
    brklist[[brkfun]][[1]] <- do.call(FUN[brkfun], list(data[[bn[1]]],
    trueval = trueval, na.rm = TRUE))
   else brklist[[brkfun]][[1]] <- do.call(FUN[brkfun], list(data[[bn[1]]],
    na.rm = TRUE))
   names(brklist[[brkfun]][[1]]) <- label1
   for(brk in 2:nbn) {
    if(FUN[brkfun] %in% truevalFUN)
     brklist[[brkfun]][[brk]] <- tapply(data[[bn[1]]],
      data[bn[2:brk]], FUN = match.fun(FUN[brkfun]),
      trueval = trueval)
    else brklist[[brkfun]][[brk]] <- tapply(data[[bn[1]]],
     data[bn[2:brk]], FUN = match.fun(FUN[brkfun]),
     na.rm = TRUE)
    names(brklist[[brkfun]][[brk]]) <- brklevels[[brk]]
   }
   if(FUN[brkfun] == "valid.n")
    brklist[[brkfun]]<-
     rapply(brklist[[brkfun]],function(x) ifelse(is.na(x),0,x),how="replace")
  }
 if(trueval == "prop") {
  brklist[[1]][[2]]<-brklist[[1]][[2]]/brklist[[1]][[1]]
  for(column in 1:ncol(brklist[[1]][[3]])) {
   brklist[[1]][[3]][,column]<-
   brklist[[1]][[3]][,column]/sum(brklist[[1]][[3]][,column])
  }
  brklist[[1]][[1]]<-1
 }
 attr(brklist, "class") <- "brklist"
 names(brklist) <- FUN
 return(brklist)
}

sliceArray<-function(x,slice) {
 dimx<-dim(x)
 if(is.null(dimx)) return(x[slice])
 else {
  ndim<-length(dimx)
  slicestring<-
   paste("x[",slice,paste(rep(",",ndim-1),collapse=""),"]",sep="",collapse="")
  newx<-eval(parse(text=slicestring))
  return(newx)
 }
}

print.brklist<-function(x,...) {

 crawlBreakList<-function(x,depth=1) {
  if(length(x)>1) {
   if(depth==1) cat(names(x[[1]]),unlist(x[[1]]),"\n")
   x[[1]]<-NULL
   for(nextbit in 1:length(x[[1]])) {
    newx<-lapply(x,sliceArray,nextbit)
    cat(rep("\t",depth),names(x[[1]][nextbit]),unlist(x[[1]][nextbit]),"\n")
    crawlBreakList(newx,depth=depth+1)
   }
  }
 }

 xnames<-names(x)
 for(func in 1:length(x)) {
  cat(xnames[func],"\n")
  crawlBreakList(x[[func]])
 }
}
