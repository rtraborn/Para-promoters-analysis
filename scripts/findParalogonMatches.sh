#!/usr/bin/sh

tsrDir=/home/rraborn/Para-promoters-analysis/tsr/MergedTSR_files
tsrFile=all_TSRsetMerged.txt
paralogonFile=/home/rraborn/Para-promoters-analysis/paralogon/338_genelist.txt
outFile=tsrMatches.txt

cd $tsrDir

while read g; do
  echo "$g"
  egrep $g $tsrFile >> $outFile
done < $paralogonFile

egrep "DEC.223.1.P00150033" $tsrFile > testOut.txt

echo "Job complete!"


