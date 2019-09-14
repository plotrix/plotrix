clustered.dotplots<-function(xgroup, ygroup, freq, type = "circles",
 main="",xlab="",ylab="",x_las=1,y_las=1,axes=TRUE,size=1,...) {

	dfx = data.frame(xgroup = xgroup, ygroup = ygroup, freq = freq)
	if(any(duplicated(dfx[,1:2]))){
		stop("There can be only one 'frequency' for each pair of 'xgroup' and 'ygroup'")
	}
	
	x_unique <- unique(xgroup)
    y_unique <- unique(ygroup)
    
    plot(1, 1, asp = 1, xlim = c(0.5, 0.5+length(x_unique)),
     ylim = c(0.5, 0.5+length(y_unique)), type = "n",
     main=main,xlab = xlab, ylab = ylab, axes = FALSE)
    
    if(axes == TRUE){
        box()
        axis(1, at = seq_along(x_unique), labels = x_unique, las = x_las)
        axis(2, at = seq_along(y_unique), labels = y_unique, las = y_las)
    }
	
	spacing <- (1-0.10)/ceiling(sqrt(max(freq))) * size
	#size can go from 0 to 1, 1 being the maximum spacing
	
    for (i in 1:length(y_unique)){
        #Subset dfx corresponding to first 'ygroup'
        freq_subset <- subset(dfx, dfx$ygroup == y_unique[i]) 
		
        for (j in 1:length(freq_subset$xgroup)){
            #Determine the size of square matrix that can accomodate the frequency
            matrix_sz <- ceiling(sqrt(freq_subset$freq[j])) 
            #Initialize y matrix
            matrix_y <- matrix(rep(0, matrix_sz^2), nrow = matrix_sz) 
            #Determine 'relative' y-co-ordinates
            matrix_y <- (NROW(matrix_y)+1)/2 - row(matrix_y) 
            
            #Initiate x matrix			
            matrix_x <- matrix(rep(0, matrix_sz^2), nrow = matrix_sz) 
            #Determine 'relative' x-co-ordinates
            matrix_x <- col(matrix_x) - (NCOL(matrix_x)+1)/2 
            
            #Determine the co-ordinate of the center of the square matrix grid			
            x_center <- j
            y_center <- i
            #To keep track of symbols plotted
            flag <- 1 
            
            # Plot circles around the center based on relative co-ordinates
            for (rows in 1:matrix_sz){
                for (columns in 1:matrix_sz){
                    if (flag > freq_subset$freq[j]){
                        #Break when the necessary number of points have been plotted
                        break 
                    }
                    xx <- x_center + spacing * matrix_x[rows, columns]
                    yy <- y_center + spacing * matrix_y[rows, columns]
                    flag <- flag + 1
                    
                    if(type == "circles"){
                        draw.circle(x = xx, y = yy, radius = spacing/2.05, ...) #Uses draw.circle of plotrix. Can be replaced with 'symbol'
                    }else if(type == "points"){
                        points(x = xx, y = yy, ...)
                    }
                }
            }
        }
    }
}
