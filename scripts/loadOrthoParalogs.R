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
	   sppIds <- c("Pbi", "Pdec", "Pdodec", "Pjenn", "Pnov", "Poct", "Ppent", "Pprim", "Pquad", "Psept", "Psex", "Pson", "Ptet", "Ptre", "Pcaud", "Pmult")
	   colnames(myOP.table) <- sppVec	   
	   opList <- vector(mode="list", length=nrow(myOP.table))
	   names(opList) <- myOP.table[,1]
	   	  for (i in 1:nrow(myOP.table)) {
		      this.id <- myOP.table[i,1]
		      #print(this.id)
		      this.slot <- spp.table[i,]
#		      this.vec <- unlist(as.character(spp.table[i,]))
		      opList[[i]] <- this.slot
		      ### need to work on assigning each paralog
		      ### remove multimicronuc
		      }
	   
	   return(opList)
}
