## Loads the provided number of genomes onto a new genome object
## TODO: provide commands (i.e. ... argument in function) that allow for multiple genomes
## TODO: create object

library(seqinr)

loadGenomes <- function(pathToFasta, ...) {
	   message("Loading genome assemblies onto new object.")

	   if (is.character(pathToFasta)==FALSE) {
	      stop("Input must be of class 'character'.")
	      }
	   
	   genome.paths <- list(pathToFasta, ...)
	   
	   paths.vec <- unlist(genome.paths)
	   
	   #print(genome.paths)

	   genome.obj <- vector(mode="list", length=length(genome.paths))

	   gen.names <- vector(mode="character", length=length(genome.paths))

	   for (i in 1:length(genome.paths)) {

	        this.path <- genome.paths[[i]]

		this.name <- strsplit(basename(paths.vec[i]), split="_")

		obj.name <- unlist(this.name)[1]

		print(obj.name)

		genome.obj[[i]] <- read.fasta(file=this.path, as.string=TRUE)

		gen.names[i] <- obj.name

		}

		names(genome.obj) <- gen.names

	        message("Complete.")

	        return(genome.obj)
}
