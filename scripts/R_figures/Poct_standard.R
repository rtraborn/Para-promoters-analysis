## P. octaurelia

### TSRexploreR standard processing module

setwd("/home/rraborn/Para-promoters-analysis/tss") 

library(TSRchitect)
library(TSRexploreR)
library(viridis)
library(ggrastr)
library(ggplot2)

Po.annot <- "/home/rraborn/scratch/annotations/poct-full.gff"
Po.assembly <- "/home/rraborn/scratch/assemblies/poct_mod.fa"
#Pd.assembly.short <- "/home/rraborn/scratch/assemblies/pdec_scaf_1_10.fa"

# Generate sample sheet
sample_sheet <- data.frame(
  sample_name=stringr::str_glue("Poct_{seq_len(3)}"),
  file_1=NA, file_2=NA,
  condition=rep("Vegetative", 3)
)

tss.1 <- read.table(file="Po_TSSset-1.txt", header=TRUE)
tss.2 <- read.table(file="Po_TSSset-2.txt", header=TRUE)
tss.3 <- read.table(file="Po_TSSset-3.txt", header=TRUE)

tsr.1 <- read.table(file="/home/rraborn/Para-promoters-analysis/tsr/Po_TSRset-1.tab", header=FALSE)
tsr.2 <- read.table(file="/home/rraborn/Para-promoters-analysis/tsr/Po_TSRset-2.tab", header=FALSE)
tsr.3 <- read.table(file="/home/rraborn/Para-promoters-analysis/tsr/Po_TSRset-3.tab", header=FALSE)

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

Po.tss <- list(tss.1.gr, tss.2.gr, tss.3.gr)
names(Po.tss) <- c("Poct_1", "Poct_2", "Poct_3")


#### adding column headers to tsr data frames

colnames(tsr.1) <- c("seq", "start", "end", "strand", "nTSSs",
                     "nTags", "peakFraction", "tsrWdth", "tsrTorque", "SI", "mSI")

colnames(tsr.2) <- c("seq", "start", "end", "strand", "nTSSs",
                     "nTags", "peakFraction", "tsrWdth", "tsrTorque", "SI", "mSI")

colnames(tsr.3) <- c("seq", "start", "end", "strand", "nTSSs",
                     "nTags", "peakFraction", "tsrWdth", "tsrTorque", "SI", "mSI")


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

Po.tsr <- list(tsr.1.gr, tsr.2.gr, tsr.3.gr)
names(Po.tsr) <- c("Poct_1", "Poct_2", "Poct_3")

#Creating the TSR explorer object

exp <- tsr_explorer(TSSs=Po.tss, TSRs=Po.tsr, 
                    genome_annotation=Po.annot, genome_assembly=Po.assembly,
                    sample_sheet = sample_sheet
)

#Initial TSS processing

exp <- format_counts(exp, data_type="tss")

#Normalize TSSs
exp <- normalize_counts(exp, data_type = "tss", method = "DESeq2")

## TSS annotation
exp <- annotate_features(exp, data_type = "tss", feature_type="transcript")

##### Sequence analysis
## creating a truncated object for sequence analysis
## some intervals are too close to the edges of short scaffolds, so this was my workaround
#exp <- tsr_explorer(TSSs=Pd.tss, 
#                    genome_annotation=Pd.annot, genome_assembly=Pd.assembly.short,
#                    sample_sheet = sample_sheet
#)
#exp <- format_counts(exp, data_type="tss")
#exp <- normalize_counts(exp, data_type = "tss", method = "DESeq2")

plot_threshold_exploration(exp, samples="Poct_1", point_size=1) + scale_color_viridis_c()
ggsave("Poct_1_threshold_exploration.png")
plot_threshold_exploration(exp, samples="Poct_2", point_size=1) + scale_color_viridis_c()
ggsave("Poct_2_threshold_exploration.png")
plot_threshold_exploration(exp, samples="Poct_3", point_size=1) + scale_color_viridis_c()
ggsave("Poct_3_threshold_exploration.png")

#plotting sequence logo for all three replicates
plot_sequence_logo(exp, samples="Poct_1")
plot_sequence_logo(exp, samples="Poct_2")
plot_sequence_logo(exp, samples="Poct_3")

### plot correlation

plot_correlation(
  exp, data_type="tss",
  use_normalized=TRUE, font_size=12,
  heatmap_colors=viridis::viridis(100)
)

ggsave(file="Poct_correlation_matrix.png") #saving the plot

### plot genomic distribution of TSSs

plot_genomic_distribution(exp, data_type="tss", samples=c("Poct_1","Poct_2","Poct_3")) +
  scale_fill_viridis_d(direction=-1, name="Annotation") 

ggsave(file="Poct_genomic_distribution.png") #saving the plot

### plot density

plot_density(exp, data_type="tss", samples=c("Poct_1", "Poct_2", "Poct_3"))

#Current error
#Error in `[.data.table`(sample_data, , `:=`(samples, factor(samples, levels = samples))) : 
#Supplied 3 items to be assigned to 384133 items of column 'samples'. If you wish to 'recycle' the RHS please use rep() to make this intent clear to readers of your code.

ggsave(file="Poct_density.png") #saving the plot

### plot TSS heatmap

plot_heatmap(
  exp, data_type="tss", samples=c("Poct_1","Poct_2","Poct_3"),
  upstream=250, downstream=250,
  use_normalized=TRUE,
  rasterize=TRUE, raster_dpi=150
)

ggsave(file="Poct_tss_heatmap.png") #saving the plot

### formatting/normalizing tsrs
exp <- format_counts(exp, data_type="tsr")

## TSR annotation
exp <- annotate_features(exp, data_type = "tsr", feature_type="gene")

### plot TSR heatmap
## this doesn't work yet

plot_heatmap(
  exp, data_type="tsr", samples=c("Poct_1","Poct_2","Poct_3"),
  upstream=250, downstream=250,
  use_normalized=TRUE,
  rasterize=TRUE, raster_dpi=150
)

ggave(file="Poct_tsr_heatmap.png") #saving the plot