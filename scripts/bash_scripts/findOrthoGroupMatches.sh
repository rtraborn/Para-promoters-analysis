#!/usr/bin/sh

tsrDir=/home/rraborn/Para-promoters-analysis/tsr/MergedTSR_files
tsrFile=all_TSRsetMerged.bed
orthoGroupDir=/home/rraborn/scratch/Paramecium_ortho_groups/Filtered/

cd $tsrDir
mkdir orthoGroupMatches

for j in $orthoGroupDir/*.fasta.txt; do

echo "Reading $j"

while read g; do
  echo "$g"
  egrep $g $tsrFile >> orthoGroupMatches/$(basename $j .nt_ali.fasta.txt)_matches.bed
done < $j

done

#egrep "DEC.223.1.P00150033" $tsrFile > testOut.txt

echo "Job complete!"


