buildPresenceMatrix <- function(x, print=TRUE) {
  OPlist <- x
  if (is.list(OPlist)==FALSE) {
    message("x must be of class 'list'")
  }
  nRows <- length(names(OPlist))
  output.ma <- matrix(nrow=nRows, ncol=3)
  
  id.num <- names(OPlist)
  opID <- paste("OP", id.num, sep="")
  rownames(output.ma) <- opID
  
  ##need to do this (for every OG): 
  # test.ma <- matrix(NA, nrow=26, ncol=2)
  # test.ma <- unlist(OPlist[[1]])
  ### unknown.presence <- t(apply(ma,1,function(u) grepl("\\?",u)))
  
  
  return(output.ma)
}