#!/bin/bash

#PBS -N RunMoVRs_Pnov_6_8
#PBS -k o
#PBS -l nodes=1:ppn=20,vmem=64gb
#PBS -l walltime=10:00:00

echo "Launching MoVRs job"

module load meme
module load blat
module load blast

fastaFile=/N/dc2/projects/ParameciumPromoters/assemblies/pnov_mod.fa 
peakFile=/N/dc2/projects/ParameciumPromoters/Para-promoters-analysis/tss/PnTSS.pos

cd /N/dc2/projects/ParameciumPromoters/Para-promoters-analysis/

MoVRs -a $peakFile -G Pnov -o Pnov_60_40_ii --size [-60,40] -l 6,8 -k 5 -p 20 >& errPNOV_6040_6_8

echo "Job complete"
