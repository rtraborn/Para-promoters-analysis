#!/bin/bash

phyloFit=/home/rraborn/genome_analysis/phast/bin/phyloFit
tree=$1
aln=$2
outDir=/scratch/rraborn/Paramecium_ortho_groups/phylo_out

cd $outDir

echo "Running phyloFit"

	out=$(basename $aln .fas)
	$phyloFit --tree $tree $aln --out-root $out

echo "Done"
