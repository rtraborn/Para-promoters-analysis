## Builds a TSS database from selected paramecium species and returns an .RData object that can be accesed programatically. 


buildTSSDb <- function(...) {
	   y <- ...
	   x <- length(...)
	   for (i in 1:x) {
	   	   if (is.character(i)==FALSE) {
	   	      stop("file i must be of class 'character'")
		      }
		      }
            my.seq <- 1:x
	    my.slots <- paste("species", my.seq, sep="_")	  
	         for (i in 1:x) {
	              my.slots[i]  <- read.table(file=y[i], header=TRUE)
	      }

	      vector(mode="list", length=3)