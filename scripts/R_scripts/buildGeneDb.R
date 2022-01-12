## Builds a database of genes selected paramecium species and returns a list object

library(rtracklayer)

buildGeneDb <- function(speciesNames, ...) {
	    if (is.character(speciesNames)==FALSE) {
	       stop("speciesNames must be of class 'character'")
	       }
	       
	    message("Loading gene annotations to object.")

	    sp.len <- length(speciesNames)
	    x.1 <- list(...)
	    print(x.1)
	    x <- length(x.1)

	    if (x != sp.len) {
	       stop("speciesNames and gff files must be of the same length")
	       }

            my.seq <- 1:x
	    my.list <- vector(mode="list", length=x)
	    my.slots <- speciesNames
	    #print(my.slots) #for debugging
	    names(my.list) <- my.slots
	    #print(names(my.list)) #for debugging
	         for (i in 1:x) {
	              this.gff  <- readGFF(filepath=x.1[[i]])
		      this.df <- this.gff[this.gff$type=="gene",]
		      genes.table <- this.df$ID
		      my.list[[i]] <- genes.table
		      }

	   return(my.list)
}
