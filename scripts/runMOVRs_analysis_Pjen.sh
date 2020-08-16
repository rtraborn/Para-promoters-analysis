#!/bin/bash

#PBS -N RunMoVRs_Pjen
#PBS -k o
#PBS -l nodes=1:ppn=16,vmem=64gb
#PBS -l walltime=12:00:00

echo "Launching MoVRs job"

module load meme
module load blast

fastaFile=/N/dc2/projects/ParameciumPromoters/assemblies/pjen_mod.fa 
peakFile=/N/dc2/projects/ParameciumPromoters/Para-promoters-analysis/bed_files/PjSTRIPE_inr.pos

cd /N/dc2/projects/ParameciumPromoters/Para-promoters-analysis/

MoVRs -a $peakFile -G Pjen -o Pjen_60_40 --size [-60,40] -k 10 -p 10 >& errPJEN_6040

echo "Job complete"
