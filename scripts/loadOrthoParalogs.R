## Parses the poff file and deposits the results in a ParaOrtho object


loadOrthoParalogs <- function(OPtable) {
	    if (is.character(OPtable)==FALSE) {
	       stop("Argument OPtable must be of class 'character'")
	       }
	   message("Importing ortho-paralog table.")
	   myOP.table <- read.table(file=OPtable, header=TRUE)
	   sppVec <- c("WGD_ID", "nbGenes", "Pbi", "Pdec", "Pdodec", "Pjenn", "Pnov", "Poct", "Ppent", "Pprim", "Pquad", "Psept", "Psex", "Pson", "Ptet", "Ptre", "Pcaud", "Pmult")
	   colnames(myOP.table) <- sppVec
	   spp.table <- myOP.table[,-1:-2]
	   spp.table <- spp.table[,-15:-16]
	   sppIds <- c("Pbi", "Pdec", "Pdodec", "Pjenn", "Pnov", "Poct", "Ppent", "Pprim", "Pquad", "Psept", "Psex", "Pson", "Ptet", "Ptre")
	   colnames(myOP.table) <- sppVec	   
	   opList <- vector(mode="list", length=nrow(myOP.table))
	   names(opList) <- myOP.table[,1]
		  for (i in 1:nrow(myOP.table)) {
		      this.id <- myOP.table[i,1]
		      this.vec <- spp.table[i,]
		      #print(head(this.vec))
		      this.list <- strsplit(as.character(unlist(this.vec)), split=",")
		      this.vector <- unlist(this.list)
		      small.list <- vector(mode="list", length=14)
		      names(small.list) <- sppIds
		      this.ma <- matrix(this.vector, nrow=14, ncol=2, byrow=TRUE)
		      for (j in 1:length(sppIds)) {
		      	  this.spp <- sppIds[j]
			  small.vec <- vector(mode="character", length=2)
			  names(small.vec) <- c("Para1","Para2")
			  small.list[[j]] <- small.vec
			  #print(j)
			  small.list[[j]] <- this.ma[j,]
			  names(small.list[[j]]) <- c("Para1", "Para2")
			  #print(small.vec)
			  #print(this.ma[j,])
			  }
		      opList[[i]] <- small.list
		      }
	   
	   return(opList)
}
