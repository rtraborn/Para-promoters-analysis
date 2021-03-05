#!/bin/bash

module load bedtools

source /N/u/rtraborn/Carbonate/.bashrc


WD=/N/u/rtraborn/Carbonate/ParameciumPromoters/stripeSeq/paraSTRIPE_analysis 

orgID=Pjen
assemblyID=Pjen
baseDir=/N/dc2/projects/ParameciumPromoters
genomeFa=assemblies/pjen_mod.fa
gffFile=annotations/pjen-full.gff

cd $WD

echo "Loading a homer genome file for specified organism"
loadGenome.pl -name ${assemblyID} -fasta ${baseDir}/${genomeFa} -gtf ${baseDir}/${gffFile} -org ${orgID}

echo "Job Complete!"
