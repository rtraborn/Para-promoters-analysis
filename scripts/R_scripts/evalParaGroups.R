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
		   #print(i)
	       	   for (j in 1:length(mySpp)) {
		       this.sp <- mySpp[j]
		       #print(this.sp)
		       my.vec <- spp.list[[this.sp]]
		       #print(my.vec)
		       if ((my.vec[1]==".") && (my.vec[2]==".")) {
		          #print("Loop 1")
		       	  n.total <- 0
			  this.ma1[i,j] <- n.total
			  this.ma2[i,j] <- "None"
			  next
			  }
		       if ((is.na(my.vec[1])) && (is.na(my.vec[2]))) {
		          #print("Loop 2")
		       	  n.total <- 0
			  this.ma1[i,j] <- n.total
			  this.ma2[i,j] <- "None"
			  next
			  }
		       if ((is.na(my.vec[1])) || (is.na(my.vec[2]))) {
		          #print("Loop 3")
		       	  this.ind <- which(is.na(my.vec[1]))
			  my.vec <- my.vec[-this.ind]
			  n.total <- 1
			  this.ma1[i,j] <- n.total
			  this.ma2[i,j] <- my.vec
			  next
			  }
		       if ((my.vec[1]==".") || (my.vec[2]==".")) {
		       	  #print("Loop 4")
		       	  this.ind <- which(my.vec==".")
			  my.vec <- my.vec[-this.ind]
			  n.total <- 1
			  this.ma1[i,j] <- n.total
			  this.ma2[i,j] <- my.vec
			  next
			  }
		       else {
		          #print("Loop 5")
		          n.total <- 2
			  this.ma1[i,j] <- n.total
			  this.str <- paste(my.vec[1], my.vec[2], sep=",")
			  #print(this.str)
			  this.ma2[i,j] <- this.str
			  }
	   	    }  
		}
	   out.list <- vector(mode="list", length=2)
	   names(out.list) <- c("numbersMA", "genesMA")
	   out.list[[1]] <- this.ma1
	   out.list[[2]] <- this.ma2		  
	   return(out.list)
}
