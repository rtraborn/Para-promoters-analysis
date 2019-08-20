## Parses an OPobj and returns a matrix containing information about the number of paralogs in each ortho-paralog group


evalParaGroups <- function(OPobj) {
	   message("Calculating ortho-paralog membership.")
	   mySpp <- c("Pbi", "Pdec", "Pdodec", "Pjenn", "Pnov", "Poct", "Ppent", "Pprim", "Pquad" , "Psept", "Psex", "Pson", "Ptet", "Ptre")
	   this.ma1 <- matrix(NA, nrow=length(OPobj), ncol=14)
	   rownames(this.ma1) <- names(OPobj)
	   colnames(this.ma1) <- c("Pbi", "Pdec", "Pdodec", "Pjenn", "Pnov", "Poct", "Ppent", "Pprim", "Pquad" , "Psept", "Psex", "Pson", "Ptet", "Ptre")
	   this.ma2 <- matrix(NA, nrow=length(OPobj), ncol=14)
	   colnames(this.ma2) <- c("Pbi", "Pdec", "Pdodec", "Pjenn", "Pnov", "Poct", "Ppent", "Pprim", "Pquad" , "Psept", "Psex", "Pson", "Ptet", "Ptre")
	   rownames(this.ma2) <- names(OPobj)

		for (i in 1:length(OPobj)) {
	       	   spp.list <- OPobj[[i]]
		   #print(head(spp.list))

	       	   for (j in 1:length(mySpp)) {
		       this.sp <- mySpp[j]
		       #print(this.sp)
		       my.vec <- spp.list[[this.sp]]
		       #print(my.vec)
		       if ((my.vec[1]==".") && (my.vec[2]==".")) {
		       	  n.total <- 0
			  this.ma1[i,j] <- n.total
			  next
			  }
		       if ((my.vec[1] == ".") || (my.vec[2] == ".")) {
		       	  n.total <- 1
			  this.ma1[i,j] <- n.total
			  next
			  }
		       else {
		          n.total <- 2
			  this.ma1[i,j] <- n.total
			  }
	   	    }  
		}
			  
	   return(this.ma1)
}

# current error message: Error in if (my.vec[1] == "." && my.vec[2] == ".") { :
# missing value where TRUE/FALSE needed