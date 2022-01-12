#!/usr/bin/sh

prank=/home/rraborn/genome_analysis/prank-msa/src/prank
fastaDir=$1
fastaID=$2

cd $fastaDir

cat *.fa > ${fastaID}.fa

$prank -o=${fastaID}_aln -f=philips -showtree -support -d=${fastaID}.fa

echo "Job complete!"


