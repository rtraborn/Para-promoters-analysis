## Creates a list from the contents of a standard TSRsetMerged.txt file from TSRchitect

tssToList <- function(x, geneID) {
	   library(GenomicRanges)
	   this.table  <- x
	   this.list <- vector(mode="list", length=1)
	   this.list.2 <- vector(mode="list", length=9)
	   names(this.list) <- geneID
	   names(this.list.2) <- c("seq", "coords", "strand", "nTSSs", "nTAGs", "tsrPeak", "tsrWdth", "tsrSI", "tsrMSI")
	   this.gene <- this.table[this.table$featureID==geneID,]
	 	        if (nrow(this.gene) == 1) { 
			this.list.2$seq <- this.gene$seq
			this.list.2$coords <- IRanges(start=this.gene$start, end=this.gene$end)
			this.list.2$strand <- this.gene$strand
			this.list.2$nTSSs <- this.gene$nTSSs
			this.list.2$nTAGs <- this.gene$nTAGs
			this.list.2$tsrPeak <- this.gene$tsrPeak
			this.list.2$tsrWdth <- this.gene$tsrWdth
	   		this.list.2$tsrSI <- this.gene$tsrSI
			this.list.2$tsrMSI <- this.gene$tsrMSI
			this.list[[1]] <- this.list.2
			}
	   return(this.list)
}
