#!/usr/bin/sh

myDir=/home/rraborn/Para-promoters-analysis/paralogon
fileName=$1
outFile=ParaGenes_ids.gff

cd $myDir

#replacing most of the ids
perl -pe 's/(\d+\.)(G)(\d+)/\1\P\3/g' $fileName > tmp

#now for the annoying PPRIM ids:
perl -pe 's/(PPRIM)(G)(\d+)/\1\P\3/g' tmp > $outFile

echo "Job complete."
