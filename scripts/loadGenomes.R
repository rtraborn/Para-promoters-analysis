## Loads the provided number of genomes onto a new genome object
## TODO: provide commands (i.e. ... argument in function) that allow for multiple genomes
## TODO: create object

library(seqinr)

loadGenomes <- function(pathToFasta) {
	   message("Loading genome assemblies onto new object.")
	   if (is.character(pathToFasta)==FALSE) {
	      stop("Input must be of class 'character'.")
	      }
	   
	   my.genome <- read.fasta(file=pathToFasta, as.string=TRUE)

	       message("Complete.")

	       return(my.genome)
}
