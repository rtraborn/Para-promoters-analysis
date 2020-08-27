#!/bin/bash

#PBS -N RunMoVRs_Pdec
#PBS -k o
#PBS -l nodes=1:ppn=20,vmem=64gb
#PBS -l walltime=8:00:00

echo "Launching MoVRs job"

module load meme
module load blat
module load blast

fastaFile=/N/dc2/projects/ParameciumPromoters/assemblies/pdec_mod.fa 
peakFile=/N/dc2/projects/ParameciumPromoters/Para-promoters-analysis/tss/PdTSS.pos

cd /N/dc2/projects/ParameciumPromoters/Para-promoters-analysis/

MoVRs -a $peakFile -G Pdec -o Pdec_60_40_ii --size [-60,40] -l 6,8,10 -k 5 -p 20 >& errPDEC_6040_ii

echo "Job complete"
