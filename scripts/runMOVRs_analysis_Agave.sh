#!/bin/bash

#SBATCH -p serial
#SBATCH -n 24
#SBATCH -t 08:00:00

module purge

echo "Launching MoVRs job"

cd /home/rraborn//scratch/Para-promoters-analysis/

/home/rraborn/genome_analysis/MoVRs/scripts/MoVRs -f fasta_files/PdSTRIPE_TATA.fasta -b Pdec_TATA_bg.fasta -S 10 -k 3 -p 9 --outputdir Pdec_TATAtest >& errTEST

echo "Job complete"
