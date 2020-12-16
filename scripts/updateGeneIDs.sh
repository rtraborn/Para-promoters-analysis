#!/usr/bin/sh

annotDir=/home/rraborn/Paramecium_data/annotations
annotFile=pbi-full.gff
annotOut=pbi-full-convert.gff

cd $annotDir

echo "Pbi"

cat $annotFile | awk 'BEGIN{OFS="\t";} $3=="gene" {print }' > intrim.file
perl -pe 's/(ID=PBIA\.V1\_4\.1\.)(G)(\d+)(\;Name=PBIA\.V1\_4\.1\.)(G)(\d+)/\1P\3\4P\6/g' intrim.file > $annotOut

echo "Starting conversion."

echo "Job complete!"


