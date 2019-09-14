drawNestedBars<-function (x,start,end,shrink=0.1,errbars=FALSE,
 intervals=TRUE,col=NA,labelcex=1,lineht=NULL,showall=TRUE,Nwidths = FALSE, 
 barlabels=NULL,showlabels=TRUE,arrow.cap=NA) {

 barcol <- ifelse(is.list(col), col[[1]], col)
 if(!is.null(x[[1]][[1]]) && (showall >= 1 || length(x[[1]]) == 1)) 
  rect(start, 0, end, unlist(x[[1]][[1]]), col = barcol)
 if(showlabels && !is.null(x[[1]][[1]]) && showall >= 1) {
  if(!is.null(barlabels)) barlabel <- barlabels[[1]]
  else barlabel <- names(x[[1]][[1]])
  labely <- -lineht * length(x[[1]])
  if (nchar(barlabels[[1]][1])) {
   par(xpd = TRUE)
   segments(c(start, end, start), c(0, 0, labely), c(start, 
    end, end), rep(labely, 3))
   boxed.labels((start + end)/2, labely, barlabel, ypad = 1.4, 
    bg = ifelse(is.na(barcol), "white", barcol), cex = labelcex)
   par(xpd = FALSE)
  }
 }
 if (errbars && length(x[[1]]) == 1) 
  dispersion((start + end)/2, x[[1]][[1]], x[[2]][[1]], 
  x[[3]][[1]], intervals = intervals, arrow.cap = arrow.cap)
 for (xcomp in 1:length(x)) x[[xcomp]][[1]] <- NULL
 if (length(x[[1]])) {
  nvalues <- length(unlist(x[[1]][[1]]))
  if (is.list(col)) col[[1]] <- NULL
  if (!is.null(barlabels) && length(barlabels) > 1) barlabels[[1]] <- NULL
  barspace <- (end - start) * shrink
  if(Nwidths) barwidth<-((end-start)-barspace)*x[[4]][[1]]/sum(x[[4]][[1]])
  else barwidth <- rep(((end-start)-barspace)/nvalues,nvalues)
  barspace <- barspace/(nvalues + 1)
  for (nextval in 1:nvalues) {
   newx <- list()
   for (xcomp in 1:length(x))
    newx[[xcomp]] <- lapply(x[[xcomp]], sliceArray, nextval)
   newbarlabels <- barlabels
   start <- start + barspace
   newcol <- col
   if(is.list(col)) newcol[[1]] <- col[[1]][nextval]
   if(!is.null(barlabels)) newbarlabels[[1]]<-barlabels[[1]][nextval]
   drawNestedBars(newx, start, start + barwidth[nextval], 
    shrink = shrink, errbars = errbars, col = newcol, 
    labelcex = labelcex, lineht = lineht, showall = showall + 1, 
    Nwidths = Nwidths, barlabels = newbarlabels, 
    showlabels = showlabels, arrow.cap = arrow.cap,intervals = intervals)
    start <- start + barwidth[nextval]
  }
 }
}
