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
		      my.list[[i]] <- this.table
	      }

	   return(my.list)
}
