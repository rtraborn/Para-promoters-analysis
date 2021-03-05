#!/usr/bin/sh

myDir=/home/rraborn/scratch/Para-promoters-analysis/paralog_datasets
fileName=all_aurelias.poff

cd $myDir

for i in {1..19}; do
echo ${i}
cut -f $i $fileName > col_${i}.txt
done

echo "Job complete."
