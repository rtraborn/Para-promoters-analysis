#!/usr/bin/sh

WD=/home/rraborn/Paramecium_data/assemblies

cd $WD

for file in *.fa.fai
do
echo "Processing"
echo $file
cut -f1-2 $file > $(basename $file .fa.fai).genome
done

echo "Job complete"
