#!/usr/bin/sh

#filesList is a config file that contains all of the Paramecium annotations and the associated paths

### if using Carbonate
#source /N/project/ParameciumPromoters/Para-promoters-analysis/scripts/filesList

#outDir=/N/project/ParameciumPromoters/Para-promoters-analysis/paralogon
#geneList=/N/project/ParameciumPromoters/Para-promoters-analysis/paralogon/98_genelist_updated.txt
#Bedtools=/N/soft/rhel7/bedtools/gnu/2.26.0/bin/bedtools

### if using Agave
source /home/rraborn/Para-promoters-analysis/scripts/filesList

outDir=/home/rraborn/Para-promoters-analysis/paralogon
geneList=/home/rraborn/Para-promoters-analysis/paralogon/98_genelist_updated.txt
Bedtools=/packages/7x/bedtools/2.17.0/bin/bedtools

cd $outDir

echo "Starting job."

for annot in $pbi $ptet $pson $pprim $poct $pjen $pdodec $pcaud $pnov $psex $ppent $pdec $pquad;
do

echo "basename $annot"
awk 'BEGIN{OFS="\t";} $3=="gene" {print }' $annot > $(basename $annot .gff)_gene.gff
    
    while read i; do
	touch test.out
	echo $annot
	if egrep -q $i $(basename $annot .gff)_gene.gff; then
	    echo "Found"
	    egrep $i $(basename $annot .gff)_gene.gff >> test.out
    else
    echo "Not found"
fi

done < $geneList

    mkdir out_files
    split -l 1 --additional-suffix=.bed test.out out_files/98_genelist_

#    for b in *_a*.bed; do
#	$Bedtools -i $b #this needs to be the bedtools flank command, which recognizes the individual -genome file
#	done

    for b in *_a*.bed; do
	bedtools subtract -s -a $(basename $i .bed)_flank.bed -b $i > $(basename $i _flank.bed)_promoter.bed;
    done

#### need to select the appropriate fasta file for the species in question
for p in *_promoter.bed; do
	bedtools getfasta -s -fi   -bed $(basename $i _flank.bed)_promoter.bed -fo $(basename $i _flank.bed)_promoter.fasta
    
done

### add prank alignment step in subsequent command
