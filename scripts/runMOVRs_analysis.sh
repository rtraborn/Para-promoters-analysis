#!/bin/bash

#PBS -N RunMoVRs_test
#PBS -k o
#PBS -l nodes=1:ppn=16,vmem=64gb
#PBS -l walltime=36:00:00

echo "Launching MoVRs job"

cd /N/dc2/projects/ParameciumPromoters/Para-promoters-analysis/

/N/u/rtraborn/Carbonate/genome_analysis/MoVRs/scripts/MoVRs -f fasta_files/PdSTRIPE_TATA.fasta -b Pdec_TATA_bg.fasta -S 10 -k 3 -p 9 --outputdir Pdec_TATAtest >& errTEST

echo "Job complete"
