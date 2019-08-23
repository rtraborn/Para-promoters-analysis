## Builds a TSS database from selected paramecium species and returns an .RData object that can be accesed programatically. 


buildTSSDb <- function(speciesNames, ...) {
	    if (is.character(speciesNames)==FALSE) {
	       stop("speciesNames must be of class 'character'")
	       }
	    sp.len <- length(speciesNames)
	    x.1 <- list(...)
	    print(x.1)
	    x <- length(x.1)
            my.seq <- 1:x
	    my.list <- vector(mode="list", length=x)
	    my.slots <- speciesNames
	    #print(my.slots) #for debugging
	    names(my.list) <- my.slots
	    #print(names(my.list)) #for debugging
	         for (i in 1:x) {
	              this.table  <- read.table(file=x.1[[i]][1], header=TRUE)
		      genes.table <- this.table[complete.cases(this.table[,12]),]
		      for (j in 1:nrow(genes.table)) {
		      	  my.gene <- genes.table[j,12]
			  my.list[[i]][j] <- tssToList(genes.table, my.gene)
			  print(j)
			  }
	               names(my.list[[i]]) <- genes.table[,12]
	      }

	   return(my.list)
}
