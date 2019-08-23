setwd("/N/dc2/projects/ParameciumPromoters/Para-promoters-analysis/tsr")
source("../scripts/buildTSSDb.R")
source("../scripts/tssToList.R")

sampleDb <- buildTSSDb(speciesNames=c("Pdec","Poct","Pnov", "Pjenn"), "Pd_TSRsetMerged.txt", "Po_TSRsetMerged.txt", "Pn_TSRsetMerged.txt", "Pj_TSRsetMerged.txt")   

save(sampleDb, file="testTSSdb.RData")
