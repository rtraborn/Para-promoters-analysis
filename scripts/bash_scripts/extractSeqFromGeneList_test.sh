#!/usr/bin/sh

# TODO: need to add Ptred to the list of paramecium files

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
annot=/home/rraborn/Para-promoters-analysis/paralogon/ParaGenes_ids.gff
Bedtools=/packages/7x/bedtools/2.17.0/bin/bedtools
filesList=/home/rraborn/Para-promoters-analysis/scripts/filesList
listID=$(basename $1 .txt)

source $filesList

cd $outDir

echo "Starting job."

#for annot in $pbi $ptet $pson $pprim $poct $pjen $pdodec $pcaud $pnov $psex $ppent $pdec $pquad;
#do

#awk 'BEGIN{OFS="\t";} $3=="gene" {print }' $annot > $(basename $annot .gff)_gene.gff
#done

echo "Creating the gene-only annotation files."

#cat *full_gene.gff > Para_genes.gff
    
    while read i; do
	echo $i
	touch test.out
	if egrep -q $i $annot; then
	    echo "Found"
	    egrep $i $annot >> test.out
    else
    echo "Not found"
    fi
    done < $geneList

echo "Creating separate BED files from the genes grepped from the annotation file."

    mkdir out_files
    split -l 1 --additional-suffix=.bed test.out out_files/$listID

echo "Creating id files from each bed file."

    cd out_files
    for b in *.bed; do
	cut -f 9 338_genelistaa.bed | cut -d ';' -f 1 | tr -d 'ID=' > $(basename $b .bed)_id.txt
done

echo "Iterating through the bed files"

### need to think about executing this loop the right way. I currently have incomplete cut statements and I need to fill those in

while read b

do

 echo "Reading $b"

 echo $b

        if [[`cut -d "." -f 1`=="PDEC"]]
then
	    $Bedtools flank -i $b -g $pdecGen -b 150
fi
        if [[`cut -d "." -f 1`=="PDODEC"]]
then
	    $Bedtools flank -i $b -g $pdodecGen -b 150
fi
       if [[`cut -d "." -f 1`=="PTRED"]]
then
	    $Bedtools flank -i $b -g $ptreGen -b 150
fi
        if [[`cut -d "." -f 1`=="PJENN"]]
then
	    $Bedtools flank -i $b -g $pjennGen -b 150
fi
        if [[`cut -d "." -f 1`=="PNOV"]]
then
	    $Bedtools flank -i $b -g $pnovGen -b 150
fi
        if [[`cut -d "." -f 1`=="POCT"]]
then
	    $Bedtools flank -i $b -g $poctGen -b 150
fi
        if [[`cut -d "." -f 1`=="PCAUD"]]
then
	    $Bedtools flank -i $b -g $pcaudGen -b 150
fi
        if [[`cut -d "." -f 1`=="PQUAD"]]
then
	    $Bedtools flank -i $b -g $pquadGen -b 150
fi
        if [[`cut -d "." -f 1`=="PSON"]]
then
	    $Bedtools flank -i $b -g $psonGen -b 150
fi
        if [[`cut -d "." -f 1`=="PPENT"]]
then
	    $Bedtools flank -i $b -g $ppentGen -b 150
fi
        if [[`cut -d "." -f 1`=="PBI"]]
then
	    $Bedtools flank -i $b -g $pbiGen -b 150
fi
        if [[`cut -d "." -f 1`=="PSEX"]]
then
	    $Bedtools flank -i $b -g $psexGen -b 150
fi
        if [[`cut -d "." -f 1`=="PSEPT"]]
then
	    $Bedtools flank -i $b -g $pseptGen -b 150
fi
        if [[`cut -d "." -f 1`=="PTET"]]
then
	    $Bedtools flank -i $b -g $ptetGen -b 150
fi
	    if [[$i=="NA"]]; then
echo "Made it here"
continue
fi

done < gene.ids
