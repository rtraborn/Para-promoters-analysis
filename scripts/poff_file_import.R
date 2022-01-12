
import_poff <- function(fileName) {
  #importing the poff table
  poff <- read.table(file=fileName, header=TRUE)

  poff2 <- poff[,-1:-4]
  poff3 <- poff2[,-27]
  poff_new <- cbind(poff[,1], poff3)

  col1 <- "geneFamID"
  col2 <- colnames(poff3)

  colnames_new <- c(col1, col2)
  colnames(poff_new) <- colnames_new

  return(poff_new)
}

