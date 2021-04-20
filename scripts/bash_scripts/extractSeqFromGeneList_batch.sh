#!/bin/bash

#SBATCH -n 1
#SBATCH -t 0-8:00
#SBATCH -A rraborn
#SBATCH -p cmecpu1
#SBATCH -q cmeqos
#SBATCH -o slurm.%j.out
#SBATCH -e slurm.%j.err

scriptDir=/home/rraborn/Para-promoters-analysis/scripts/bash_scripts
orthoGroupDir=/scratch/rraborn/Paramecium_ortho_grops/Filtered

cd $scriptDir

for l in ${orthoGroupDir}/*.nt_ali.fasta.txt; do
./extractSeqFromGeneList.sh $orthoGroupDir/$l
done

echo "Job complete!"


