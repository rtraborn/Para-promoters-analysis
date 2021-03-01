#!/usr/bin/sh

treeDir=/scratch/rraborn/Paramecium_ortho_groups/Filtered

inputFile=4813.nt_ali.fasta.tre
geneListOut=$(basename $inputFile .tre).txt

cd $treeDir

echo "Starting conversion."

echo $inputFile
echo $geneListOut

cat $inputFile | tr -d '(' | tr ')' '\n' | tr ':' '\n' | tr -d ';' | tr ',' '\n' | sed --expression='/^$/d' | egrep 'P*P[0-9]+' > $geneListOut

echo "Job complete!"


