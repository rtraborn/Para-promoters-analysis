#Figures for paralog analysis

library(ggplot2)

#loading the OP database
source("/home/rraborn/scratch/Para-promoters-analysis/scripts/loadOrthoParalogs.R")
Para.orthoPara <- loadOrthoParalogs("/home/rraborn/scratch/Para-promoters-analysis/paralog_datasets/all_aurelias-cut-mod.poff")

#loading the TSS database
source("/home/rraborn/scratch/Para-promoters-analysis/scripts/buildTSSDb.R")
source("/home/rraborn/scratch/Para-promoters-analysis/scripts/tssToList.R")
source("/home/rraborn/scratch/Para-promoters-analysis/scripts/isPresentOP.R")

#setting the directory
setwd("/home/rraborn/scratch/Para-promoters-analysis/tsr/MergedTSR_files/")

Pprim_tsr <- read.table(file="Pprim_TSRsetMerged_updated.txt", header=TRUE)
Pdec_tsr <- read.table(file="Pd_TSRsetMerged_updated.txt", header=TRUE)
Pdodec_tsr <- read.table(file="Pdodec_TSRsetMerged_updated.txt", header=TRUE)
Pn_tsr <- read.table(file="Pn_TSRsetMerged_updated.txt", header=TRUE)
Pj_tsr <- read.table(file="Pj_TSRsetMerged_updated.txt", header=TRUE)
Po_tsr <- read.table(file="Po_TSRsetMerged_updated.txt", header=TRUE)
Pt_tsr <- read.table(file="Pt_TSRsetMerged_updated.txt", header=TRUE)
Ptred_tsr <- read.table(file="Ptred_TSRsetMerged_updated.txt", header=TRUE)

combined_TSR <- rbind(Pprim_tsr, Pdec_tsr, Pdodec_tsr, Pn_tsr, Pj_tsr, Po_tsr, Pt_tsr, Ptred_tsr)
combined_TSR_new <- combined_TSR[!is.na(combined_TSR$featureID), ]

#creating a new tssDB
tsrDb <- buildTSSDb(speciesNames=c("Pdec","Poct","Pnov", "Pjenn", "Pdodec", "Ptet", "Ptred", "Pprim"), "Pd_TSRsetMerged_updated.txt", "Po_TSRsetMerged_updated.txt", "Pn_TSRsetMerged_updated.txt", "Pj_TSRsetMerged_updated.txt","Pdodec_TSRsetMerged_updated.txt","Pt_TSRsetMerged_updated.txt", "Ptred_TSRsetMerged_updated.txt", "Pprim_TSRsetMerged_updated.txt")
save(tsrDb, file="TSRdb_updated.RData")

#printing an example to the tsr to the screen
tsrDb[['Pdec']]['PDEC.223.1.P00010003']

#loading the tsrDB (if necessary)
#load("/home/rraborn/scratch/Para-promoters-analysis/tsr/testTSSdb.RData")

isPresent.ma <- isPresentOP(Para.orthoPara,tsrDb,c("Pdec","Poct","Pnov", "Pjenn", "Pdodec", "Ptet", "Ptred", "Pprim"))





