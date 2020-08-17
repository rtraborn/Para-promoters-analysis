#!/bin/bash

#SBATCH -p serial
#SBATCH -n 24
#SBATCH -t 12:00:00

echo "Launching MoVRs job"

module load blast/2.9.0  

fastaFile=/home/rraborn/scratch/assemblies/poct_mod.fa 
peakFile=/home/rraborn/scratch/Para-promoters-analysis/bed_files/PoSTRIPE_inr.pos

cd /home/rraborn/scratch/Para-promoters-analysis/

MoVRs -a $peakFile -G Poct -o Poct_60_40 --size [-60,40] -k 10 -p 10 >& errPOCT_6040

echo "Job complete"
