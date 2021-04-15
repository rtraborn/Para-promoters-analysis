#!/usr/bin/sh

#filesList is a config file that contains all of the Paramecium annotations and the associated paths

### if using Carbonate
#source /N/project/ParameciumPromoters/Para-promoters-analysis/scripts/filesList

#outDir=/N/project/ParameciumPromoters/Para-promoters-analysis/paralogon
#geneList=$1
#Bedtools=/N/soft/rhel7/bedtools/gnu/2.26.0/bin/bedtools

### if using Agave
source /home/rraborn/Para-promoters-analysis/scripts/filesList
outDir=/home/rraborn/Para-promoters-analysis/paralogon
geneList=$1
Bedtools=/packages/7x/bedtools/2.17.0/bin/bedtools
filesList=/home/rraborn/Para-promoters-analysis/scripts/filesList
listID=$(basename $1 .txt)

source $filesList

cd $outDir

echo "Starting job."

for annot in $pbi $ptet $pson $pprim $poct $pjen $pdodec $pcaud $pnov $psex $ppent $pdec $pquad;
do

awk 'BEGIN{OFS="\t";} $3=="gene" {print }' $annot > $(basename $annot .gff)_gene.gff
done

echo "Creating the gene-only annotation files."

cat *full_gene.gff > Para_genes.gff
    
    while read i; do
	touch test.out
	if egrep -q $i Para_genes.gff; then
	    echo "Found"
	    egrep $i Para_genes.gff >> test.out
    else
    echo "Not found"
    fi
    done < $geneList

echo "Made it here"
### need to convert P in the geneID to G again, because bioinformatics is wiild 
