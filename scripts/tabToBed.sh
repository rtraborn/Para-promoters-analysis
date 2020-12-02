#!/usr/bin/sh

tsrDir=/home/rraborn/Para-promoters-analysis/tsr/MergedTSR_files
tsrFile=all_TSRsetMerged.txt
outFile=all_TSRsetMerged.bed

cd $tsrDir

echo "Starting conversion."

cut -f 1-3 $tsrFile > tsr1_3
cut -f 4 $tsrFile > tsr_strand
cut -f 12 $tsrFile > tsr_geneID
cut -f 6 $tsrFile > tsr_nTAGs

paste tsr1_3 tsr_geneID tsr_nTAGs tsr_strand > $outFile

echo "Job complete!"


