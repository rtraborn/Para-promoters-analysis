## Parses an OPobj and returns a matrix containing information about the number of paralogs in each ortho-paralog group


evalNumPara <- function(x) {
	   message("Tabulating the number of orthogs.")
	   if (is.list(x)==FALSE) {
	      stop("Input must be of class 'list'.")
	      }
	   this.ma <- x$numbersMA
	   if (is.matrix(this.ma)==FALSE) {
	      stop("Item must be of class 'matrix'.")
	      }

	   new.ma <- matrix(NA, nrow=nrow(this.ma), ncol=4)
	   rownames(new.ma) <- rownames(this.ma)
	   colnames(new.ma) <- c("Num_no_OPs", "N_one_OP", "Num_two_OP", "Total ortho-paralogs")

	   for (i in 1:nrow(this.ma)) {
	       this.vec <- this.ma[i, ]		  	   		    
	       n.two <- length(which(this.vec==2))
	       print(n.two)
	       n.one <- length(which(this.vec==1))
	       print(n.one)
	       n.none <- length(which(this.vec==0))
	       n.op <- sum(this.vec)
	       new.ma[i, ] <- c(n.none, n.one, n.two, n.op)
	       }

	       message("Complete.")

	       return(new.ma)
}
