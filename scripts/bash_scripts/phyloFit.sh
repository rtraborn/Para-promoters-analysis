#!/bin/bash

phyloFit=/home/rraborn/genome_analysis/phast/bin/phyloFit
tree=$1
aln=$2
outDir=/scratch/rraborn/Paramecium_ortho_groups/phylo_out
outFile=$(basename $aln .fas)

cd $outDir

echo "Running phyloFit"

$phyloFit --tree $tree $aln --out-root $outFile

echo "Done"
