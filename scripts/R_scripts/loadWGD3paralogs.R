# Create a list of all Paramecium spp, each species containing all gene names, and all gene names containing their WGD3 paralogs
loadWGD3paralogs <- function(speciesNames, ...){
  if (is.character(speciesNames)==FALSE) {
    stop("speciesNames must be of class 'character'")
  }
  x.1 = list(...)                                                             #make input a list
  
  if(length(speciesNames) != length(x.1)){
    stop("speciesName and wgd files must be of the same length")
  }
  message("Importing WGD3 paralog table.")
  
  wgdDb = vector(mode="list", length = length(speciesNames))                  # FINAL LIST
  names(wgdDb) = speciesNames
  
  for(tree in x.1){                                # Iterate through each species given
    thisWGD = read.table(file=tree, header=T)                  # read in the WGD3 data frame... should have many thousand rows containing 1-8 genes per row
    thisWGD$NB = NULL                                              # remove the first, useless row
    tmpDb = vector(mode="list")            # make a temporary list that will be attached to each species's object
    
    for(j in 1:nrow(thisWGD)){                                       # Iterate through each row in the WGD3 data frame we imported
      thisWgdRow = thisWGD[j,]
      wgdGenes = thisWgdRow[which(nchar(as.vector(unlist(thisWgdRow))) > 1)]  # remove any item in each row that has less than 1 character (i.e. is just a ".")
      
      for(wgdGene in wgdGenes){
        currentGene = as.character(unlist(wgdGene))
        otherGenes = as.character(unlist(wgdGenes[which(wgdGenes != currentGene)]))
        tmpDb[[currentGene]] = otherGenes
      }
    }
    wgdDb[[i]] = tmpDb
  }
  return(wgdDb)
}
