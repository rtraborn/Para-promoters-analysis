### TSRexploreR standard processing module

setwd("/home/rraborn/Para-promoters-analysis/tss") 

library(TSRchitect)
library(TSRexploreR)
library(viridis)
library(ggrastr)
library(ggplot2)

load("PdSTRIPE_testObj_tsr.RData")
load("PdSTRIPE_testObj_tss.RData")

Pd.annot <- "/home/rraborn/scratch/annotations/pdec-full.gff"
Pd.assembly <- "/home/rraborn/scratch/assemblies/pdec_mod.fa"
Pd.assembly.short <- "/home/rraborn/scratch/assemblies/pdec_scaf_1_10.fa"
Pd_pos <- "/home/rraborn/scratch/Para-promoters-analysis/tss"

# Generate sample sheet
sample_sheet <- data.frame(
  sample_name=stringr::str_glue("Pdec_{seq_len(3)}"),
  file_1=NA, file_2=NA,
  condition=rep("Vegetative", 3)
)

colnames(tss.1) <- c("seq","TSS", "strand", "score")
colnames(tss.2) <- c("seq","TSS", "strand", "score")
colnames(tss.3) <- c("seq","TSS", "strand", "score")

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

Pd.tss <- list(tss.1.gr, tss.2.gr, tss.3.gr)
names(Pd.tss) <- c("Pdec_1", "Pdec_2", "Pdec_3")

Pd.tsr <- list(tsr.1.gr, tsr.2.gr, tsr.3.gr)
names(Pd.tsr) <- c("Pdec_1", "Pdec_2", "Pdec_3")

#making granges files from tsr data frames
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

setwd("/home/rraborn/Para-promoters-analysis/figures/") 

#Creating the TSR explorer object
exp <- tsr_explorer(TSSs=Pd.tss, TSRs=Pd.tsr, 
                    genome_annotation=Pd.annot, genome_assembly=Pd.assembly,
                    sample_sheet = sample_sheet
)

#Initial TSS processing

exp <- format_counts(exp, data_type="tss")

#Normalize TSSs
exp <- normalize_counts(exp, data_type = "tss", method = "DESeq2")

## TSS annotation
exp <- annotate_features(exp, data_type = "tss", feature_type="transcript")

# CLustering TSSs
exp <- tss_clustering(exp, threshold=3, max_distance=25, n_samples=1)

### associate TSSs with TSRs
exp <- associate_with_tsr(exp)

### Annotate TSRs
exp <- annotate_features(exp, data_type="tsr", upstream=250, downstream=100,
                         feature_type="transcript")

# Mark dominant TSS per TSR
exp <- mark_dominant(exp, data_type="tss")

#calculate tsr metrics
exp <- tsr_metrics(exp)

## getting this error:
## Error in eval(jsub, SDenv, parent.frame()) : 
##  object 'shape_class' not found

### plotting sequence logos

plot_sequence_logo(exp, dominant=TRUE, samples="Pdec_1",
                   data_conditions = conditionals(data_grouping=shape_class))

#### note : this doesn't work as expected (Note the figure it generates)
ggsave(file="Pdec_r1_by_shape.png")

### plotting metrics

exp <- plot_tsr_metric(exp, tsr_metrics="iqr_width", samples=c("Pdec_1", "Pdec_2", "Pdec_3"),
                   log2_transform = TRUE, ncol=2,
                   data_conditions = conditionals(data_grouping=shape_class)) +
  ggplot2::ylim(c(0,8))
