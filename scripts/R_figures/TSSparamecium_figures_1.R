setwd("/home/rraborn/Para-promoters-analysis/tss") 
#load("/data/LynchLabCME/Daphnia/DaphPopsTSRs/binaries/PdSTRIPE_complete.rdata")
library(TSRchitect)
library(TSRexploreR)
library(dplyr)
library(stringr)
library(reshape2)
library(GenomicRanges)

load("PdSTRIPE_complete.RData")

#creating the annotation and assembly files
Pd.annot <- "/home/rraborn/scratch/annotations/pnov_cds_only.gff"
Pd.assembly <- "/home/rraborn/scratch/assemblies/pdec_mod.fa"
Pd.assembly.short <- "/home/rraborn/scratch/assemblies/pdec_scaf_1_10.fa"
Pd_pos <- "/home/rraborn/scratch/Para-promoters-analysis/tss"

#writing the tss files to the workspace
tss.1 <- PdSTRIPE@tssCountData[[1]]
tss.2 <- PdSTRIPE@tssCountData[[2]]
tss.3 <- PdSTRIPE@tssCountData[[3]]

#making granges files from tss data frames
tss.1.gr <- makeGRangesFromDataFrame(tss.1,
                                     keep.extra.columns = TRUE,
                                     seqnames.field="seq",
                                     start.field="TSS",
                                     end.field="TSS",
                                     strand.field = "strand"
)

tss.2.gr <- makeGRangesFromDataFrame(tss.2,
                                     keep.extra.columns = TRUE,
                                     seqnames.field="seq",
                                     start.field="TSS",
                                     end.field="TSS",
                                     strand.field = "strand"
)

tss.3.gr <- makeGRangesFromDataFrame(tss.3,
                                     keep.extra.columns = TRUE,
                                     seqnames.field="seq",
                                     start.field="TSS",
                                     end.field="TSS",
                                     strand.field = "strand"
)

#writing the tsr files to the workspace
tsr.1 <- PdSTRIPE@tsrData[[1]]
tsr.2 <- PdSTRIPE@tsrData[[2]]
tsr.3 <- PdSTRIPE@tsrData[[3]]

#making granges files from tss data frames
tsr.1.gr <- makeGRangesFromDataFrame(tsr.1,
                                     keep.extra.columns = TRUE,
                                     seqnames.field="seq",
                                     start.field="start",
                                     end.field="end",
                                     strand.field = "strand"
)

tsr.2.gr <- makeGRangesFromDataFrame(tsr.2,
                                     keep.extra.columns = TRUE,
                                     seqnames.field="seq",
                                     start.field="start",
                                     end.field="end",
                                     strand.field = "strand"
)

tsr.3.gr <- makeGRangesFromDataFrame(tsr.3,
                                     keep.extra.columns = TRUE,
                                     seqnames.field="seq",
                                     start.field="start",
                                     end.field="end",
                                     strand.field = "strand"
)


#making the exp files with all three replicates
## continue here:
Pd.tss <- list(tss.1.gr, tss.2.gr, tss.3.gr)

TSRs_Pd <- list(tsr.1.gr, tsr.2.gr, tsr.3.gr)
names(TSRs_Pd) <- c("Pd_r1,", "Pd_r2", "Pd_r3")

exp <- tsr_explorer(TSSs=Pd.tss, TSRs=TSRs_Pd)
## current error: Error: Elements 1, 2, 3 of is.na(TSSs) are not true or (is.list(TSSs) && has_attr(TSSs, "names")) is not TRUE

exp <- normalize_counts(exp, data_type = "tss", threshold = 3, n_samples = 1)
exp <- normalize_counts(exp, data_type = "tsr", threshold = 5, n_samples = 1)
