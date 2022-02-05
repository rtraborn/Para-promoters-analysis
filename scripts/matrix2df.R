library(reshape2)


matrix2df <- function(myFile, sorted=TRUE, write=TRUE, fileName="myFile.txt") {

	  mat.df <- read.csv(file=myFile, header=TRUE)
	  mat.df.l <- melt(my.csv, id.vars="X")
	  mat.df.l.2 <- dfL[!is.na(mat.df.l$value),]
	  mat.df.l.3 <- mat.df.l.2[,-4]
	  colnames(mat.df.l.3) <- c("gene1", "gene2", "pairwise_dist")

	  if (sorted==TRUE) {
	  mat.df.l.4 <- mat.df.l.3[order(mat.df.l.3$pairwise_dist),]	  	  
	  }

	  if (write==TRUE) {
	     write.table(mat.df.l.4, file=fileName, quote=FALSE, sep="\t", row.names=FALSE, col.names=TRUE)
	     }

	  return(mat.df.l.4)
}