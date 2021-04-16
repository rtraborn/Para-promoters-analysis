#!/usr/bin/sh

myDir=/home/rraborn/Para-promoters-analysis/paralogon
fileName=$1
outFile=ParaGenes_ids.gff

cd $myDir

#replacing most of the ids
perl -pe 's/(\w+\.\S+\.\S+\.P\d+)(\,)(\w+\.\S+\.\S+\.P\d+)/\1\t\3/g' $fileName > tmp

#now for the annoying PPRIM ids:
perl -pe 's/(\sPPRIMP\d+)/\1\t\3/g' tmp > $outFile

echo "Job complete."
