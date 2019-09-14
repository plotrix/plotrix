multivari <- function(var, fac1, fac2, fac3=NULL, fac4=NULL, data, 
                            sort=FALSE, fun=mean, pch=list(15, 16, 17), 
                col=list("black", "blue","red"), col0="black", 
                cex=1, fac.cex=2, xlab.depth=3, legend=FALSE,
                main=paste("multivari chart of", var), add=FALSE, ...){
  ## if fac4 is given, make two separate multivaricharts for fac1 to fac3
  ## on the same y scale
  ## fac4 only allowed if there is also fac3
  ## x a data frame
  ## fac1 to fac4 character strings as names of categorical variables
  ## these are coerced to factor, if they are not factors yet
  ## if sort=FALSE, the order of appearance in unique() is used for level order,
  ##    else levels are ordered in the default way of factor
  ## nfac (calculated) is the number of non-NULL factors
  ## pch and col are lists of length 2 or 3 
  ##    (depending on the number of factors)
  ##    elements can be unique symbol/color specifications
  ##    or vectors of symbol/color specifications for the levels of 
  ##    fac1, fac2, or fac3 resp. (fac4 is in separate charts)
  ##    Usually, one would need to specify a pch vector for the last factor,
  ##    in case of more than two factors.
  ##    line colors are taken from the symbol colors of the previous level
  ##        (try out whether this makes sense)
  ## fac.cex is a factor to enlarge the points versus the text
  ## xlab.depth gives the highest level for which the horizontal axis 
  ##        carries labels for the factor levels
  
  ## Changes Dec 8: 
  ## bug fix: colors and symbols did not work correctly, 
  ##    if some levels do not occur in the data; 
  ##    now, colors and symbols are always picked according to factor levels
  ## added extra space for legend on horizontal axis
  ## added an add option (for adding to otherwise prepared plotting template)
  ## modified initial plot call: 
  ##    more logical choice for x and y, which should not change anything
  ##    added cex.axis=cex and cex.lab=cex, 
  ##    so that y-axis labeling is also affected by cex
  ## added/modified/removed some comment text
  
  stopifnot(is.data.frame(data))
  nc <- ncol(data)
  if (is.numeric(fac1)) {
    stopifnot(fac1 %in% 1:nc)
    fac1 <- names(data)[fac1]
  }
  if (is.numeric(var)){
    stopifnot(var %in% 1:nc)
    var <- names(data)[var]
  }
  if (is.numeric(fac2)){
    stopifnot(fac2 %in% 1:nc)
    fac2 <- names(data)[fac2]
  }
  if (is.numeric(fac3)){
    stopifnot(fac3 %in% 1:nc)
    fac3 <- names(data)[fac3]
  }
  if (is.numeric(fac4)){
     stopifnot(fac4 %in% 1:nc)
    fac4 <- names(data)[fac4]
  }
  stopifnot(is.character(var))
  stopifnot(var %in% names(data))
  stopifnot(is.numeric(data[[var]]))
  fn <- c(fac1, fac2, fac3, fac4)
  if (any(!is.character(fn))) stop("fac1 to fac4 must be character or NULL")
  if (any(!fn %in% names(data))) stop("fac1 to fac4 must be variable names in data")
  ## all factors are columns of data or NULL
  
  ## make non-factors into factors
  ## if (!sort), respect level ordering as encountered in the data
  ## sort does not touch level ordering in factors
  nfac <- 2
  if (!sort){
    if (!is.factor(data[[fac1]])) data[[fac1]] <- factor(data[[fac1]], levels=unique(data[[fac1]]))
    if (!is.factor(data[[fac2]])) data[[fac2]] <- factor(data[[fac2]], levels=unique(data[[fac2]]))
    if (!is.null(fac3)){
      nfac <- 3
      if (!is.factor(data[[fac3]])) data[[fac3]] <- factor(data[[fac3]], levels=unique(data[[fac3]]))
      if (!is.null(fac4)){
        nfac <- 4
        if (!is.factor(data[[fac4]])) data[[fac4]] <- factor(data[[fac4]], levels=unique(data[[fac4]]))
      }
    }
  }
  else{
    if (!is.factor(data[[fac1]])) data[[fac1]] <- factor(data[[fac1]])
    if (!is.factor(data[[fac2]])) data[[fac2]] <- factor(data[[fac2]])
    if (!is.null(fac3)){
      nfac <- 3
      if (!is.factor(data[[fac3]])) data[[fac3]] <- factor(data[[fac3]])
      if (!is.null(fac4)){
        nfac <- 4
        if (!is.factor(data[[fac4]])) data[[fac4]] <- factor(data[[fac4]])
      }
    }
  }
  stopifnot(is.list(col))
  stopifnot(is.list(pch))
  stopifnot(length(col)>=min(3, nfac))
  stopifnot(length(pch)>=min(3, nfac))

  ## the number of observations behind the aggregated values
  aggrn <- as.data.frame(table(data[fn][!is.na(data[[var]]),]))
  aggrn <- aggrn[!aggrn$Freq==0,]
  
  ## for ylim and lowest level
  aggr <- aggregate(data[var], data[fn], fun)
  names(aggr)[nfac+1] <- var
  aggr <- merge(aggr, aggrn, by=fn)
  ylim <- range(aggr[[var]])  ## for all chunks of the chart
  ## now we have the data structure, nfac factors and one value

  if (nfac==4) {
    dat_split <- split(data, data[[fac4]])
  }
  else {
    dat_split <- list(data)
  }
  
  
  npanel <- length(dat_split)
  xlim <- c(0.5, (nlevels(data[[fac1]])+1)*npanel+legend)

  ## within each panel, use x positions 1 to nlevels(dat[[fac1]])
  ## continue from these with x positions at most +/-0.25
  ## and then with x positions at most +/- 0.1
  
  aggrlists <- lapply(dat_split, function(obj){
    hilf <- list(aggregate(obj[var], obj[fac1], fun), 
                 aggregate(obj[var], obj[c(fac1, fac2)], fun))
    if (nfac >= 3) hilf[[3]] <- aggregate(obj[var], obj[c(fac1, fac2, fac3)], fun)
    hilf
  })

  nlevs <- sapply(data[fn], nlevels)
  poscalc <- function(i){
    ## calculate x positions
    ## i is the panel
      pos3 <- NULL
      pos1 <- 1:nlevs[1] + (nlevs[1] + 1) * (i - 1)
      pos2 <- rep(pos1, nlevs[2]) + 
        0.5*rep((0:(nlevs[2]-1) - (nlevs[2]-1)/2)/(nlevs[2] - 1), 
                each=length(pos1))
      if (nfac >= 3) pos3 <- rep(pos2, nlevs[3]) + 
        0.2*rep((0:(nlevs[3]-1) - (nlevs[3]-1)/2)/(nlevs[3] - 1), 
                each=length(pos2))
      ## take care of missing levels 
      ## the number of observations behind the aggregated values
      aggrn1 <- as.data.frame(table(dat_split[[i]][fac1][!is.na(data[[var]]),]))
      pos1 <- pos1[aggrn1$Freq>0]
      aggrn2 <- as.data.frame(table(dat_split[[i]][c(fac1,fac2)][!is.na(data[[var]]),]))
      pos2 <- pos2[aggrn2$Freq>0]
      if (nfac>=3){ 
        aggrn3 <- as.data.frame(table(dat_split[[i]][c(fac1,fac2,fac3)][!is.na(data[[var]]),]))
        pos3 <- pos3[aggrn3$Freq>0]
      }
      mapply(cbind, aggrlists[[i]], list(pos1=pos1,pos2=pos2,pos3=pos3)[1:min(nfac, 3)])
  }
  
    ## functions to draw each element of aggrlists in its place
  linesfun <- function(x, ...){
     lines()
  }

  pch <- as.list(pch)
  col <- as.list(col)
  for (i in 1:min(3, nfac)) 
    if (length(pch[[i]]) < nlevs[i]) pch[[i]] <- rep(pch[[i]],nlevs[i])
  for (i in 1:min(3, nfac)) 
    if (length(col[[i]]) < nlevs[i]) col[[i]] <- rep(col[[i]],nlevs[i])
  ## now, pch and col are lists with a level for each 
  
  calcresults <- lapply(1:npanel, function(obj){ 
      hilf <- poscalc(obj)
      hilf <- lapply(hilf, function(obj) {
        names(obj)[ncol(obj)] <- "x"
        obj
        }
        )
      hilf
    })
  
  ## prepare plot
  if (!add) plot(xlim,ylim,type="n", xaxt="n", xlab="", ylab=var, tcl=0.5,
       xlim=xlim, ylim=ylim, main=main, cex.axis=cex, cex.lab=cex, ...)
  for (i in 1:npanel){
    plotlist <- calcresults[[i]]
      ## last column of each list element holds x-position
      ## last but one column (name var) holds y value
      tit <- ""
      if (nfac==4) tit <- paste(fac4, "=", levels(data[[fac4]])[i])
      for (j in 1:length(plotlist)){
        ## jth hierarchy level
        dd <- plotlist[[j]]
        if (j==1) {
          lines(dd$x, dd[[var]], col=col0, ...)
          points(dd$x, dd[[var]], col=col[[1]][as.numeric(dd[[fac1]])], 
                 pch=pch[[1]][as.numeric(dd[[fac1]])], cex=fac.cex*cex, ...)
          mtext(side=3, at=mean(dd$x), text=tit, line=0, cex=1.5*cex, ...)
          mtext(side=1, at=dd$x, line=0, levels(data[[fac1]]), cex=cex, ...)
          mtext(side=1, at=xlim[2], line=0, fac1, cex=cex, adj=1, ...)
        }
        else {
          ## not first level of hierarchy
          ## hilf contains separate portions for each level of fac1 to facj-1
          hilf <- split(dd, dd[fn[1:(j-1)]])
          if (xlab.depth >= j){
            mtext(side=1, at=dd$x, line=j-1, dd[[fn[j]]], cex=cex, ...)
            mtext(side=1, at=xlim[2], line=j-1, fn[j], cex=cex, adj=1, ...)
          }
          for (ii in 1:length(hilf)){
            dd <- hilf[[ii]]
            ## color from previous hierarchy level
          lines(dd$x, dd[[var]], 
                col=col[[j-1]][as.numeric(dd[[fn[j-1]]])[1]], ...)
            ## point symbol and color from current hierarchy level
          points(dd$x, dd[[var]], cex=fac.cex*cex, 
                col=col[[j]][as.numeric(dd[[fn[j]]])], 
                pch=pch[[j]][as.numeric(dd[[fn[j]]])], ...)
          }
        }
      }
  }
  if (legend){
    ## check whether legend makes sense 
    ##     (col and/or pch for last level defined as vector)
    ## add legend at the bottom right
    pick <- 3
    if (nfac<3) pick <- 2
    if (length(col[[pick]])==1 && length(pch[[pick]])==1)
      warning("no legend created, because symbols are not distinct")
    else{
      lastval <- dd[[var]][which.max(dd$x)]
      lpos <- "bottomright"
      if (lastval < mean(ylim)) lpos <- "topright"
      legend(lpos, legend=levels(data[[fn[pick]]]), 
             pch=pch[[pick]], col=col[[pick]], cex=0.5*fac.cex*cex,
             title=fn[pick])
    }
  }
  invisible(calcresults)
}


