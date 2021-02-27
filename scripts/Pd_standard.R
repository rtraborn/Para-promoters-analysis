### TSRexploreR standard processing module

setwd("/home/rraborn/Para-promoters-analysis/tss") 

library(TSRchitect)
library(TSRexploreR)

#load("PdSTRIPE_complete.RData")
load("PdSTRIPE_testObj.RData")

#Pd.annot <- "/home/rraborn/scratch/annotations/pdec_cds.gff"
#Pt.annot <- "home/rraborn/scratch/annotations/pdec-full.gff"
#Pd.assembly <- "/home/rraborn/scratch/assemblies/pdec_mod.fa"
#Pd.assembly.short <- "/home/rraborn/scratch/assemblies/pdec_scaf_1_10.fa"
Pd_pos <- "/home/rraborn/scratch/Para-promoters-analysis/tss"

Pt.annot <- "pdec-full.gff"
Pd.assembly <- "pdec_mod.fa"
Pd.assembly.short <- "pdec_scaf_1_10.fa"


# Generate sample sheet
sample_sheet <- data.frame(
  sample_name=stringr::str_glue("Pdec_{seq_len(3)}"),
  file_1=NA, file_2=NA,
  condition=rep("Vegetative", 3)
)


#writing the tss files to the workspace
tss.1 <- PdSTRIPE@tssCountData[[1]]
tss.2 <- PdSTRIPE@tssCountData[[2]]
tss.3 <- PdSTRIPE@tssCountData[[3]]

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

#Creating the TSR explorer object
exp <- tsr_explorer(TSSs=Pd.tss, TSRs=TSRs_Pd, 
                    genome_annotation=Pd.annot, genome_assembly=Pd.assembly,
                    sample_sheet = sample_sheet
)

#Initial TSS processing

exp <- format_counts(exp, data_type="tss")

#Normalize TSSs
exp <- normalize_counts(exp, data_type = "tss", method = "DESeq2")

## TSS annotation
exp <- annotate_features(exp, data_type = "tss", feature_type="transcript")

### Current error:
### Error in (function (classes, fdef, mtable)  : 
### unable to find an inherited method for  for "SortedByQueryHits"signature NSBSfunction 

##### Sequence analysis
## creating a truncated object for sequence analysis
## some intervals are too close to the edges of short scaffolds, so this was my workaround
exp <- tsr_explorer(TSSs=Pd.tss, 
                    genome_annotation=Pd.annot, genome_assembly=Pd.assembly.short,
                    sample_sheet = sample_sheet
)
exp <- format_counts(exp, data_type="tss")
exp <- normalize_counts(exp, data_type = "tss", method = "DESeq2")

plot_threshold_exploration(exp, samples="Pdec_1", point_size=1) + scale_color_viridis_c()
### Additional error:
### Error in ifelse(simple_annotations == "Promoter", "n_promoter_proximal",  : 
###                  object 'simple_annotations' not found

plot_sequence_logo(exp, samples="Pdec_1")
