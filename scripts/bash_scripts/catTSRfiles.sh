#!/usr/bin/sh

tsrDir=/home/rraborn/Para-promoters-analysis/tsr/MergedTSR_files/
outFile=all_TSRsetMerged.txt

cd $tsrDir

for tsr in `ls P*_TSRsetMerged_updated.txt`
do
echo $tsr
cat $tsr >> $outFile
done

echo "Job complete!"
