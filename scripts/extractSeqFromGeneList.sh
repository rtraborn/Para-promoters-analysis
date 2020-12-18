#!/usr/bin/sh

#filesList is a config file that contains all of the Paramecium annotations and the associated paths
source /N/project/ParameciumPromoters/Para-promoters-analysis/scripts/filesList

outDir=/N/project/ParameciumPromoters/Para-promoters-analysis/paralogon
geneList=/N/project/ParameciumPromoters/Para-promoters-analysis/paralogon/98_genelist_updated.txt

cd $outDir

echo "Starting job."

for annot in $pbi $ptet $pson $pprim $poct $pjen $pdodec $pcaud $pnov $psex $ppent $pdec $pquad;
do

echo "basename $annot"
awk 'BEGIN{OFS="\t";} $3=="gene" {print }' $annot > basename $annot .gff_gene.gff
    
    while read i; do

	echo $annot
	if egrep -q $i (basename $annot .gff)_gene.gff; then
	    echo "Found"
	    egrep $i (basename $annot .gff)_gene.gff > test.out
    else
    echo "Not found"
fi

done < $geneList

done






