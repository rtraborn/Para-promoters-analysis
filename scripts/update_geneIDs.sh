#!/usr/bin/sh

WD=/home/rraborn/scratch/Para-promoters-analysis/tsr/MergedTSR_files

cd $WD

for file in P*_TSRsetMerged.txt;
do
echo "Processing "
echo $file
cut -f 12 $file | perl -pi.bak -e 's/^(\w+\.\d+\.)(\d\.)G(\w\d+$)/\1\2P\3/' > ${file}_col12.txt
cut -f 1-11 $file > ${file}_col1_11.txt
paste ${file}_col1_11.txt ${file}_col12.txt > $(basename $file .txt)_updated.txt
done

echo "Job complete"
