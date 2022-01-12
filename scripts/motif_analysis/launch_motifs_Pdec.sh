#!/bin/bash

#PBS -N Find_motifs_Pdec
#PBS -k o
#PBS -l nodes=1:ppn=16,vmem=32gb
#PBS -l walltime=4:00:00

echo "Launching job"

cd /N/u/rtraborn/Carbonate/ParameciumPromoters/stripeSeq/paraSTRIPE_analysis/scripts
./TSS_motif_discovery_Pdec.sh > err

echo "Job complete"
