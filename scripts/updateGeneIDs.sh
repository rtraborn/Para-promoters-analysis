#!/usr/bin/sh

#annotDir=/home/rraborn/Paramecium_data/annotations
annotDir=/N/project/ParameciumPromoters/Para-promoters-analysis/paralogon

geneList=98_genelist.txt
geneListOut=98_genelist_updated.txt

cd $annotDir

echo "Starting conversion."

perl -pe 's/(\S+)(\.P)(\d+)/\1.G\3/g' $geneList | perl -pe 's/(PPRIM)(P)(\d+)/\1G\3/g' - > $geneListOut

echo "Job complete!"


