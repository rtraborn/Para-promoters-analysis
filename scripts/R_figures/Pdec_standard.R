### TSRexploreR standard processing module

setwd("/home/rraborn/Para-promoters-analysis/tss") 

library(TSRchitect)
library(TSRexploreR)
library(viridis)
library(ggrastr)
library(ggplot2)

#load("PdSTRIPE_complete.RData")
#load("PdSTRIPE_testObj.RData")
#load("PdSTRIPE_testObj_tsr.RData")
#load("PdSTRIPE_testObj_tss.RData")

tss.1 <- read.table(file="Pd_TSSset-1.txt", header=TRUE)
tss.2 <- read.table(file="Pd_TSSset-2.txt", header=TRUE)
tss.3 <- read.table(file="Pd_TSSset-3.txt", header=TRUE)

tsr.1 <- read.table(file="Pd_TSRset-1.txt", header=TRUE)
tsr.2 <- read.table(file="Pd_TSRset-2.txt", header=TRUE)
tsr.3 <- read.table(file="Pd_TSRset-3.txt", header=TRUE)

#Pd.annot <- "/home/rraborn/scratch/annotations/pdec_cds.gff"
Pd.annot <- "/home/rraborn/scratch/annotations/pdec-full.gff"
Pd.assembly <- "/home/rraborn/scratch/assemblies/pdec_mod.fa"
#Pd.assembly.short <- "/home/rraborn/scratch/assemblies/pdec_scaf_1_10.fa"
Pd_pos <- "/home/rraborn/scratch/Para-promoters-analysis/tss"

# Generate sample sheet
sample_sheet <- data.frame(
  sample_name=stringr::str_glue("Pdec_{seq_len(3)}"),
  file_1=NA, file_2=NA,
  condition=rep("Vegetative", 3)
)


#writing the tss files to the workspace
#tss.1 <- PdSTRIPE@tssCountData[[1]]
#tss.2 <- PdSTRIPE@tssCountData[[2]]
#tss.3 <- PdSTRIPE@tssCountData[[3]]

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

##### Sequence analysis
## creating a truncated object for sequence analysis
## some intervals are too close to the edges of short scaffolds, so this was my workaround
#exp <- tsr_explorer(TSSs=Pd.tss, 
#                    genome_annotation=Pd.annot, genome_assembly=Pd.assembly.short,
#                    sample_sheet = sample_sheet
#)
#exp <- format_counts(exp, data_type="tss")
#exp <- normalize_counts(exp, data_type = "tss", method = "DESeq2")

#plot_threshold_exploration(exp, samples="Pdec_1", point_size=1) + scale_color_viridis_c()
#plot_threshold_exploration(exp, samples="Pdec_2", point_size=1) + scale_color_viridis_c()
#plot_threshold_exploration(exp, samples="Pdec_3", point_size=1) + scale_color_viridis_c()

#plotting sequence logo for all three replicates
plot_sequence_logo(exp, samples="Pdec_1")
ggsave(file="Pdec_r1_sequenceLogo.png")
### note strange output of plot here
plot_sequence_logo(exp, samples="Pdec_2")
plot_sequence_logo(exp, samples="Pdec_3")

### plot correlation

plot_correlation(
  exp, data_type="tss",
  use_normalized=TRUE, font_size=12,
  heatmap_colors=viridis::viridis(100)
)

ggsave(file="Pdec_correlation_matrix.png") #saving the plot

### plot genomic distribution of TSSs

plot_genomic_distribution(exp, data_type="tss", samples=c("Pdec_1","Pdec_2","Pdec_3")) +
  scale_fill_viridis_d(direction=-1, name="Annotation") 

ggave(file="Pdec_genomic_distribution.png") #saving the plot

### plot density

plot_density(exp, data_type="tss", samples=c("Pdec_1", "Pdec_2", "Pdec_3"))

#Current error
#Error in `[.data.table`(sample_data, , `:=`(samples, factor(samples, levels = samples))) : 
#Supplied 3 items to be assigned to 384133 items of column 'samples'. If you wish to 'recycle' the RHS please use rep() to make this intent clear to readers of your code.

ggsave(file="Pdec_density.png") #saving the plot

### plot TSS heatmap

plot_heatmap(
  exp, data_type="tss", samples=c("Pdec_1","Pdec_2","Pdec_3"),
  upstream=250, downstream=250,
  use_normalized=TRUE,
  rasterize=TRUE, raster_dpi=150
)

ggsave(file="Pdec_tss_heatmap.png") #saving the plot

### formatting/normalizing tsrs
exp <- format_counts(exp, data_type="tsr")

## TSR annotation
exp <- annotate_features(exp, data_type = "tsr", feature_type="gene")

### plot TSR heatmap
## this doesn't work yet

plot_heatmap(
  exp, data_type="tsr", samples=c("Pdec_1","Pdec_2","Pdec_3"),
  upstream=250, downstream=250,
  use_normalized=TRUE,
  rasterize=TRUE, raster_dpi=150
)

ggave(file="Pdec_tsr_heatmap.png") #saving the plot