#importing the poff table
setwd("/scratch/rraborn/Para-promoters-analysis/paralog_datasets/")

poff <- read.table(file="Poff_table_updated_082020.txt", header=TRUE)
poff2 <- poff[,-1:-4]
poff3 <- poff2[,-27]
poff_new <- cbind(poff[,1], poff3)

col1 <- "geneFamID"
col2 <- colnames(poff3)

colnames_new <- paste(col1, col2)
colnames(poff3) <- colnames_new

