#!/bin/bash

#SBATCH -J Pnov_MoVRs
#SBATCH -p serial
#SBATCH -n 24
#SBATCH -t 12:00:00

echo "Launching MoVRs job"

module load meme/4.11.4
module load blast/2.9.0  

fastaFile=/home/rraborn/scratch/assemblies/pnov_mod.fa 
peakFile=/home/rraborn/scratch/Para-promoters-analysis/bed_files/PnSTRIPE_inr.pos

cd /home/rraborn/scratch/Para-promoters-analysis/

MoVRs -a $peakFile -G Pnov -o Pnov_60_40 --size [-60,40] -k 10 -p 10 >& errPNOV_6040

echo "Job complete"
