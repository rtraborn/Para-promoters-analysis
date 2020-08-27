#!/bin/bash

#SBATCH -J Pdec_MoVRs
#SBATCH -p serial
#SBATCH -n 24
#SBATCH -t 12:00:00

echo "Launching MoVRs job"

module load blast/2.9.0  

fastaFile=/home/rraborn/scratch/assemblies/pdec_mod.fa 
peakFile=/home/rraborn/scratch/Para-promoters-analysis/bed_files/PdSTRIPE_inr.pos

cd /home/rraborn/scratch/Para-promoters-analysis/

MoVRs -a $peakFile -G Pdec -o Pdec_60_40_i --size [-60,40] -k 10 --startfromstep step3 -p 10 >& errPDEC_6040_startstep3

echo "Job complete"
