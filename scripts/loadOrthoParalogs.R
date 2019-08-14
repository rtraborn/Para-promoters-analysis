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
#	   	  for (i in 1:nrow(myOP.table)) {
		  for (i in 1:10) {
		      this.id <- myOP.table[i,1]
		      this.vec <- spp.table[i,]
		      #print(head(this.vec))
		      this.list <- strsplit(as.character(unlist(this.vec)), split=",")
		      small.list <- vector(mode="list", length=14)
		      names(small.list) <- sppIds
		      opList[[i]] <- small.list
		      for (j in 1:14) {
		      	  this.spp <- sppIds[j]
			  #print(this.spp)
			  print(j)
		      	  m.vec <- vector(mode="character", length=2)
			  opList[[i]][j] <- m.vec
			  this.slice <- this.list[[j]]
			  print(this.slice)
			  #print(length(this.slice))
		      	  opList[[i]][j][1:2] <- this.slice
			  #names(opList[[i]][j]) <- c("Paralog1", "Paralog2")
			  # current status: every element of test.results.i[[i]] has only one item eg $Ppent [1] "PPENT.87.1.P0460077"
			  # please fix this
			  }
		      }
	   
	   return(opList)
}
