# at present this function generates warnings: 
# output currently looks like this: please check
#$Ppent
#Para1 Para2 
#"1" "948"

loadOrthoParalogs <- function(OPtable) {
  if (is.character(OPtable)==FALSE) {
    stop("OPtable must be of class 'character'")
  }
  myOP.table <- read.table(file=OPtable,header=FALSE)
  myOP.table <- myOP.table[,-2:-4]
  myOP.table <- myOP.table[,-31]
  message("Importing ortho-paralog table.")
  sppVec <- c("geneFamID", "Pbi_1", "Pdec_1", "Pdodec_1", "Pjenn_1", "Pnov_1", "Poct_1", "Ppent_1", "Pprim_1", "Poct_1","Psex_1", "Pson_1", "Ptet_1", "Ptred_1", "Pbi_2", "Pdec_2", "Pdodec_2", "Pjenn_2", "Pnov_2", "Poct_2", "Ppent_2", "Pprim_2", "Pquadec_2", "Psex_2", "Pson_2", "Ptet_2", "Ptred_2")
  colnames(myOP.table) <- sppVec
  spp.table <- myOP.table[,-1]
  sppIds <- c("Pbi_1", "Pdec_1", "Pdodec_1", "Pjenn_1", "Pnov_1", "Poct_1", "Ppent_1", "Pprim_1", "Poct_1","Psex_1", "Pson_1", "Ptet_1", "Ptred_1", "Pbi_2", "Pdec_2", "Pdodec_2", "Pjenn_2", "Pnov_2", "Poct_2", "Ppent_2", "Pprim_2", "Pquadec_2", "Psex_2", "Pson_2", "Ptet_2", "Ptred_2")
  colnames(myOP.table) <- sppVec	   
  opList <- vector(mode="list", length=nrow(myOP.table))
  names(opList) <- myOP.table[,1]
  for (i in 1:nrow(myOP.table)) {
    this.id <- as.character(myOP.table[i,1])
    this.vec <- spp.table[i,]
    #print(head(this.vec)) #for debugging
    this.list <- strsplit(as.character(unlist(this.vec)), split=",")
    this.vector <- unlist(this.list)
    small.list <- vector(mode="list", length=26)
    names(small.list) <- sppIds
    this.ma <- matrix(this.vector, nrow=26, ncol=2, byrow=TRUE)
    for (j in 1:length(sppIds)) {
      this.spp <- sppIds[j]
      small.vec <- vector(mode="character", length=2)
      names(small.vec) <- c("Para1","Para2")
      small.list[[j]] <- small.vec
      print(j)
      small.list[[j]] <- as.character(this.ma[j,])
      names(small.list[[j]]) <- c("Para1", "Para2")
      #print(small.vec)
      #print(this.ma[j,])
    }
   opList[[i]] <- small.list
  }
  
  return(opList)
}
