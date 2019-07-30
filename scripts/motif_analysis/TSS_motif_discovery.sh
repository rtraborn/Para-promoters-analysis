#!/bin/bash

module load bedtools

WD=/scratch/rtraborn/tsrchitect-figures

findMotifs=/N/u/rtraborn/Carbonate/genome_analysis/homer/bin/findMotifs.pl

baseDir=/N/u/rtraborn/Carbonate/ParameciumPromoters/stripeSeq/paraSTRIPE_analysis

Pdec_genome=/N/u/rtraborn/Carbonate/ParameciumPromoters/stripeSeq/PdGENOME/pdec_mod.fa
Pjen_genome=/N/u/rtraborn/Carbonate/ParameciumPromoters/stripeSeq/PjGENOME/pjen_mod.fa
Pnov_genome=/N/u/rtraborn/Carbonate/ParameciumPromoters/stripeSeq/PnGENOME/pnov_mod.fa
Poct_genome=/N/u/rtraborn/Carbonate/ParameciumPromoters/stripeSeq/PoGENOME/poct_mod.fa

Poct_genome_file=${baseDir}/Poct.genome
Pnov_genome_file=${baseDir}/Pnov.genome
Pjen_genome_file=${baseDir}/Pjen.genome
Pdec_genome_file=${baseDir}/Pdec.genome

#Pdec
PdSTRIPEinr="PdSTRIPE_inr.fasta"
PdSTRIPE_TATA="PdSTRIPE_TATA.fasta"
PdSTRIPE_prox="PdSTRIPE_prox.fasta"

cd $WD

echo "Creating TATA background"
bedtools random -l 16 -n 1000000 -g $Pdec_genome_file > Pdec_TATA_bg.bed
bedtools getfasta -fi $Pdec_genome -bed Pdec_TATA_bg.bed -fo Pdec_TATA_bg.fasta

echo "Creating Inr background"
bedtools random -l 10 -n 1000000 -g $Pdec_genome_file > Pdec_Inr_bg.bed
bedtools getfasta -fi $Pdec_genome -bed Pdec_Inr_bg.bed -fo Pdec_Inr_bg.fasta

echo "Creating Prox background"
bedtools random -l 150 -n 1000000 -g $Pdec_genome_file > Pdec_Prox_bg.bed
bedtools getfasta -fi $Pdec_genome -bed Pdec_Prox_bg.bed -fo Pdec_Prox_bg.fasta

echo "Finding motifs AtPEAT"
${findMotifs} $PdSTRIPEinr fasta PdSTRIPEinr_results -fasta Pdec_Inr_bg.fasta -len 4,6 -p 4
${findMotifs} $PdSTRIPE_TATA fasta PdSTRIPE_TATA_results -fasta Pdec_TATA_bg.fasta -len 6 -p 4
${findMotifs} $PdSTRIPE_prox fasta PdSTRIPE_prox_results -fasta At_Pdec_bg.fasta -len 6,8 -p 4

echo "Job Complete!"
