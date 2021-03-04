myWD <- "/N/dc2/projects/ParameciumPromoters/stripeSeq/paraSTRIPE_analysis/tsr"
setwd(myWD)

Pn_tsr <- "/N/dc2/projects/ParameciumPromoters/stripeSeq/paraSTRIPE_analysis/tsr/Pn_TSRsetMerged.txt"
Po_tsr <- "/N/dc2/projects/ParameciumPromoters/stripeSeq/paraSTRIPE_analysis/tsr/Po_TSRsetMerged.txt"
Pd_tsr <- "/N/dc2/projects/ParameciumPromoters/stripeSeq/paraSTRIPE_analysis/tsr/Pd_TSRsetMerged.txt"
Pj_tsr <- "/N/dc2/projects/ParameciumPromoters/stripeSeq/paraSTRIPE_analysis/tsr/Pj_TSRsetMerged.txt"

AtTSR <- read.table(Pn_tsr, header=TRUE)                                     
AtTSR.p <- AtTSR[AtTSR$strand=="+",]
AtTSR.m <- AtTSR[AtTSR$strand=="-",]
tsr.p.start <- AtTSR.p$nTSSs - 1
tsr.m.end <- AtTSR.m$nTSSs + 1
tsr.p.start <- AtTSR.p$TSS - 1
tsr.m.end <- AtTSR.m$TSS + 1

n.peaks <- 1:nrow(AtTSR)
peak.ids <- paste("tsr", n.peaks, sep="_")
AtTSR_df <- data.frame(cbind(as.character(AtTSR$seq), AtTSR$start, AtTSR$end, AtTSR$featureID, AtTSR$nTAGs, as.character(AtTSR$strand)), AtTSR$tsrMSI, AtTSR$tsrWdth)
colnames(AtTSR_df) <- c("chr","start", "end", "tsrID", "nTAGs", "strand", "shape", "width")

write.table(AtTSR_df, file="PnTSRset_merged.bed", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)

######################

AtTSR <- read.table(Po_tsr, header=TRUE)                                     
AtTSR.p <- AtTSR[AtTSR$strand=="+",]
AtTSR.m <- AtTSR[AtTSR$strand=="-",]
tsr.p.start <- AtTSR.p$nTSSs - 1
tsr.m.end <- AtTSR.m$nTSSs + 1
tsr.p.start <- AtTSR.p$TSS - 1
tsr.m.end <- AtTSR.m$TSS + 1

n.peaks <- 1:nrow(AtTSR)
peak.ids <- paste("tsr", n.peaks, sep="_")
AtTSR_df <- data.frame(cbind(as.character(AtTSR$seq), AtTSR$start, AtTSR$end, AtTSR$featureID, AtTSR$nTAGs, as.character(AtTSR$strand)), AtTSR$tsrMSI, AtTSR$tsrWdth)
colnames(AtTSR_df) <- c("chr","start", "end", "tsrID", "nTAGs", "strand", "shape", "width")

write.table(AtTSR_df, file="PoTSRset_merged.bed", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)

######################

AtTSR <- read.table(Pj_tsr, header=TRUE)                                     
AtTSR.p <- AtTSR[AtTSR$strand=="+",]
AtTSR.m <- AtTSR[AtTSR$strand=="-",]
tsr.p.start <- AtTSR.p$nTSSs - 1
tsr.m.end <- AtTSR.m$nTSSs + 1
tsr.p.start <- AtTSR.p$TSS - 1
tsr.m.end <- AtTSR.m$TSS + 1

n.peaks <- 1:nrow(AtTSR)
peak.ids <- paste("tsr", n.peaks, sep="_")
AtTSR_df <- data.frame(cbind(as.character(AtTSR$seq), AtTSR$start, AtTSR$end, AtTSR$featureID, AtTSR$nTAGs, as.character(AtTSR$strand)), AtTSR$tsrMSI, AtTSR$tsrWdth)
colnames(AtTSR_df) <- c("chr","start", "end", "tsrID", "nTAGs", "strand", "shape", "width")

write.table(AtTSR_df, file="PjTSRset_merged.bed", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)

######################

AtTSR <- read.table(Pd_tsr, header=TRUE)                                     
AtTSR.p <- AtTSR[AtTSR$strand=="+",]
AtTSR.m <- AtTSR[AtTSR$strand=="-",]
tsr.p.start <- AtTSR.p$nTSSs - 1
tsr.m.end <- AtTSR.m$nTSSs + 1
tsr.p.start <- AtTSR.p$TSS - 1
tsr.m.end <- AtTSR.m$TSS + 1

n.peaks <- 1:nrow(AtTSR)
peak.ids <- paste("tsr", n.peaks, sep="_")
AtTSR_df <- data.frame(cbind(as.character(AtTSR$seq), AtTSR$start, AtTSR$end, AtTSR$featureID, AtTSR$nTAGs, as.character(AtTSR$strand)), AtTSR$tsrMSI, AtTSR$tsrWdth)
colnames(AtTSR_df) <- c("chr","start", "end", "tsrID", "nTAGs", "strand", "shape", "width")

write.table(AtTSR_df, file="PdTSRset_merged.bed", quote=FALSE, sep="\t", row.names=FALSE, col.names=FALSE)