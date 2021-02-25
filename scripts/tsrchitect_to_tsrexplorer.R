setwd("/home/rraborn/Para-promoters-analysis/tss")

library("TSRchitect")
library("farver")
library("tidyr")
library("TSRexploreR")
library("ggplot2")
library("viridis")
library("GenomicRanges")
library("dplyr")
library("rtracklayer")

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
exp <- normalize_counts(exp, data_type = "tss", threshold = 3, n_samples = 1)
exp <- normalize_counts(exp, data_type = "tsr", threshold = 5, n_samples = 1)

#making the exp files with two replicates
Pd.tss <- list(tss.1.gr, tss.2.gr)
names(Pd.tss) <- c("Pd_r1", "Pd_r2")

TSRs_Pd <- list(tsr.1.gr, tsr.2.gr)
names(TSRs_Pd) <- c("Pd_r1,", "Pd_r2")

exp2 <- tsr_explorer(TSSs=Pd.tss, TSRs=TSRs_Pd)
exp2 <- count_normalization(exp2, data_type = "tss", threshold = 3, n_samples = 1)

#making the exp files with a single replicate
Pd.tss.2 <- list(tss.2.gr)
names(Pd.tss.2) <- c("Pd_r2")

TSRs_Pd.2 <- list(tsr.2.gr)
names(TSRs_Pd.2) <- c("Pd_r2")

exp3 <- tsr_explorer(Pd.tss.2, TSRs_Pd.2)
exp3 <- count_normalization(exp3, data_type = "tss", threshold = 3, n_samples = 1)

###

p <- plot_correlation(exp, data_type = "tss") +
  ggplot2::theme_bw() +
  ggplot2::theme(text = element_text(size = 6))

p

#ggsave("tss_correlation_Pd_single.png", plot = p, device = "png", type = "cairo", height = 6, width = 6)

#######

p <- plot_correlation(exp, data_type = "tss", correlation_plot = "hierarchical", col = viridis::viridis(100))

png("tss_correlation_hierarchical.png", units = "in", res = 300, height = 3.5, width = 4, type = "cairo")
p
dev.off()

###
# annotate TSSs
exp <- annotate_features(exp, annotation_file = Pd.annot, data_type = "tss", feature_type = "gene")
#exp2 <- annotate_features(exp2, annotation_file = Pd.annot, data_type = "tss", feature_type = "gene")
#exp3 <- annotate_features(exp3, annotation_file = Pd.annot, data_type = "tss", feature_type = "gene")

tss_distribution <- genomic_distribution(exp, data_type = "tss", threshold = 5)

p <- plot_genomic_distribution(tss_distribution) +
  ggplot2::theme(text = element_text(size = 6))

p

ggsave("tss_genomic_distribution_singlerep_new.png", plot = p, device = "png", type = "cairo", height = 2, width = 6)

### making feature plots

features <- detect_features(exp, data_type = "tss", feature_type = "gene", threshold = 5)

p <- plot_detected_features(features, ncol = 3) +
  ggplot2::theme(text = element_text(size = 5))

p

#ggsave("tss_feature_plot_Pdec_all_reps.png", plot = p, device = "png", type = "cairo", height = 6, width = 10)

####

seqs <- tss_sequences(exp, genome_assembly = Pd.assembly.short, threshold = 3)
p <- plot_sequence_logo(seqs, ncol = 3) +
png("tss_seq_logo_Pdec.png", units = "in", res = 300, height = 1, width = 6, type = "cairo")
p


