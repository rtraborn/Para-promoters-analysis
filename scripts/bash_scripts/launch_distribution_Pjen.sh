#!/bin/bash

#PBS -N Motif_distribution_Pjen
#PBS -k o
#PBS -l nodes=1:ppn=16,vmem=32gb
#PBS -l walltime=1:00:00
#PBS -q debug

echo "Launching job"

cd /N/u/rtraborn/Carbonate/ParameciumPromoters/stripeSeq/paraSTRIPE_analysis/scripts
./motif_distribution.sh > err

echo "Job complete"
