## Loads the provided number of genomes onto a new genome object
## At present objName must be a list (from import.fasta) of scaffolds imported using loadGenomes
## TODO add write argument using write.fasta from seqinr

library(seqinr)

extractSeq <- function(objName, scaffoldID, start, end, strand) {

	   if (is.list(objName)==FALSE) {
	      stop("objName must be of class 'list'")
	      }

	   if (is.character(scaffoldID)==FALSE) {
	      stop("scaffoldID must be of class 'character'")
	      }

	   message("Extracting the selected sequences.")

	   #extractSeqs(this.seq) #continue here # tim recommends using substr(seq, start, end)
	   if (strand=="+") {
	      this.list <- objName[[scaffoldID]]
	      this.seq <- substr(this.list, start, end)
	      }

	  else if (strand=="-") {
	     this.seq <- substr(objName[[scaffoldID]], start, end)
	     this.seq <- c2s(rev(comp(s2c(this.seq))))
	     }
	   
return(this.seq)

}
