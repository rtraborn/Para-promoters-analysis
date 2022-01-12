#!/usr/bin/sh

WD=/home/rraborn/scratch/Para-promoters-analysis/tsr/MergedTSR_files
file1=Pprim_TSRsetMerged.txt

cd $WD

for file in *_TSRsetMerged.txt; do
echo "Processing "
echo $file
cut -f 12 $file | perl -pi.bak -e 's/^(\w+\.\S+\.)(\d\.)G(\w\d+$)/\1\2P\3/' > ${file}_col12.txt
cut -f 1-11 $file > ${file}_col1_11.txt
paste ${file}_col1_11.txt ${file}_col12.txt > $(basename $file .txt)_updated.txt
done

echo "Processing Pprim, which is unusual."
echo $file1

cut -f 12 $file1 | perl -pi.bak -e 's/^(PPRIM)(G)(\d+$)/\1P\3/' | head
cut -f 12 $file1 | perl -pi.bak -e 's/^(PPRIM)(G)(\d+$)/\1P\3/' > ${file1}_col12.txt
cut -f 1-11 $file1 > ${file1}_col1_11.txt
paste ${file1}_col1_11.txt ${file1}_col12.txt > $(basename $file1 .txt)_updated.txt

echo "Job complete"
