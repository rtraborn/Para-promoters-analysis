#!/bin/bash

phastCons=/home/rraborn/genome_analysis/phast/bin/phastCons
outDir=/scratch/rraborn/Paramecium_ortho_groups/phastOut

phyloFile=$2
alnFile=$1
outFile=$(basename $alnFile .fasta).wig

usage () {
    cat <<HELP_USAGE

    $0  [-a] <file.fa> [-p] <file.mod>

   -a alignment_file.fa
   -p phyloFit_file.mod
HELP_USAGE
}

echo $HELP_USAGE;

echo "Running phastCons"

#cd $outDir

$phastCons $alnFile $phyloFile > $outFile

echo "Job complete."
