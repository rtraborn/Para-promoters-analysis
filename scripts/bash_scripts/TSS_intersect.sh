#!/bin/bash

#SBATCH -p serial
#SBATCH -n 24
#SBATCH -t 01:00:00

module load bedtools/2.17.0

PdecTSS=Pd_TSSset-1filt.bed
PdecTSR=../tsr/PdTSRset_merged.bed
PdecInt=PdecTSS_intersect.bed

PoctTSS=Po_TSSset-1filt.bed
PoctTSR=../tsr/PoTSRset_merged.bed
PoctInt=PoctTSS_intersect.bed

PjenTSS=Pj_TSSset-1filt.bed
PjenTSR=../tsr/PjTSRset_merged.bed
PjenInt=PjenTSS_intersect.bed

PnovTSS=Pn_TSSset-1filt.bed
PnovTSR=../tsr/PnTSRset_merged.bed
PnovInt=PnovTSS_intersect.bed

echo "Launching job"

cd /home/rraborn/scratch/Para-promoters-analysis/tss

echo "Pdec"

bedtools intersect -s -wb -a $PdecTSS -b $PdecTSR > $PdecInt

echo "Poct"

bedtools intersect -s -wb -a $PoctTSS -b $PoctTSR > $PoctInt

echo "Pjen"

bedtools intersect -s -wb -a $PjenTSS -b $PjenTSR > $PjenInt

echo "Pnov"

bedtools intersect -s -wb -a $PnovTSS -b $PnovTSR > $PnovInt

echo "Job complete"
