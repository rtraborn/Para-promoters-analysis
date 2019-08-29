## Loads the provided number of genomes onto a new genome object
## TODO: provide commands (i.e. ... argument in function) that allow for multiple genomes
## TODO: create object

library(seqinr)

extractSeq <- function(objName, scaffold, interval) {
	   message("Extracting the selected sequences.")
	   
	   this.seq <- objName$scaffold
	   extractSeqs(this.seq) #continue here
	   	   

}
