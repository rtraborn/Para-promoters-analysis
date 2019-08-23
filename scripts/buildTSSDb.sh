#!/bin/bash

#PBS -N Build_TSSdb
#PBS -k o
#PBS -l nodes=1:ppn=16,vmem=32gb
#PBS -l walltime=1:00:00
#PBS -q debug

echo "Launching job"

cd /N/dc2/projects/ParameciumPromoters/Para-promoters-analysis/scripts

R CMD BATCH buildTSSDb.R

echo "Job complete"
