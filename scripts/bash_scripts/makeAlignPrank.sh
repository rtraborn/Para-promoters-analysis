#!/usr/bin/sh

prank=/home/rraborn/genome_analysis/prank-msa/src/prank
fasta=/home/rraborn/Para-promoters-analysis/tsr/MergedTSR_files/original_promoter_aln/promoter_seqs.fasta
outFile=$(basename $1 .fasta)
myDir=/home/rraborn/Para-promoters-analysis/scripts/bash_scripts

cd $myDir

$prank -o=$outFile -f=philips -showtree -support -d=$1

echo "Job complete!"


