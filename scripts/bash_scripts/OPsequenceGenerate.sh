#!/usr/bin/sh

WD=/home/rraborn/Para-promoters-analysis
OPlist=/home/rraborn/Para-promoters-analysis/paralogon/338_genelist.txt
AnnotDir=/home/rraborn/Paramecium_data/annotation

cd $WD

while read g; do 
echo $g 
egrep $g 
done < $OPlist

echo "Job complete"
