#!/bin/bash

#SBATCH -J MoVRs_Pjen
#SBATCH -p serial
#SBATCH -n 24
#SBATCH -t 12:00:00

echo "Launching MoVRs job"

module load blast/2.9.0  
module load meme/4.11.4

fastaFile=/home/rraborn/scratch/assemblies/pjen_mod.fa 
peakFile=/home/rraborn/scratch/Para-promoters-analysis/bed_files/PjSTRIPE_inr.pos

cd /home/rraborn/scratch/Para-promoters-analysis/

MoVRs -a $peakFile -G Pjen -o Pjen_60_40 --size [-60,40] -k 10 -p 10 >& errPJEN_6040

echo "Job complete"
