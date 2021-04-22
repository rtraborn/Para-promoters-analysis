#!/bin/bash

#SBATCH -n 1
#SBATCH -t 0-8:00
#SBATCH -A rraborn
#SBATCH -p serial
#SBATCH -q normal
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

scriptDir=/home/rraborn/Para-promoters-analysis/scripts/bash_scripts/
orthoGroupDir=/scratch/rraborn/Paramecium_ortho_groups/Filtered

cd $orthoGroupDir

for l in *.nt_ali.fasta.tre.txt; do
    $scriptDir/extractSeqFromGeneList.sh $l
done

echo "Job complete!"


