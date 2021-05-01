#!/usr/bin/sh

# TODO: need to add Ptred to the list of paramecium files
# TODO: need to reheader the *_flank.fa files somehow, as bedtools getFasta is pulling from the 3rd, not 9th, column (as it should for the gff file)

#filesList is a config file that contains all of the Paramecium annotations, assemblies, .genome files, respectively, and the associated paths

source /home/rraborn/Para-promoters-analysis/scripts/filesList

geneList=$1
annot=/home/rraborn/Para-promoters-analysis/paralogon/ParaGenes_ids.gff
Bedtools=/packages/7x/bedtools/2.17.0/bin/bedtools
reheaderFasta=/home/rraborn/Para-promoters-analysis/scripts/bash_scripts/reheaderFasta.sh
filesList=/home/rraborn/Para-promoters-analysis/scripts/filesList
listID=$(basename $1 .nt_ali.fasta.txt)_
outDir=/scratch/rraborn/Paramecium_ortho_groups/sample_test

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
	touch gene.out
	if egrep -q $i $annot; then
	    echo "Found"
	    egrep $i $annot >> gene.out
    else
    echo "Not found"
    fi
    done < $geneList

echo "Creating separate BED files from the genes grepped from the annotation file."

    listID=$(basename $listID .nt_ali.fasta.txt)
    mkdir out_files
    split -l 1 --additional-suffix=.gff gene.out $listID
    mv *.gff out_files

echo "Creating id files from each bed file."

    cd out_files
    for b in *.gff; do
	cut -f 9 $b | cut -d ';' -f 1 | tr -d 'ID=' > $(basename $b .gff)_id.txt
done

echo "Iterating through the bed files"

for b in *.gff

do

 echo "Reading $b"

 #echo $b
 eval "var=$(basename $b .gff)_id.txt";
 echo $var

	if grep -q "PDEC" $var;
then
	    $Bedtools flank -s -l 150 -r 0 -i $b -g $pdecGen > $(basename $b .gff)_flank.gff
	    echo "$Bedtools flank -i $b -g $pdecGen -b 150 > $(basename $b .bed)_flank.bed"
	    $Bedtools getfasta -name -s -fi $pdecFasta -bed $(basename $b .gff)_flank.gff -fo $(basename $b .gff)_flank.fa
	    $reheaderFasta $(basename $b .gff)_flank.fa $(basename $b .gff)_flank.gff
fi
        if grep -q "PDODEC" $var;
then
	    $Bedtools flank -s -l 150 -r 0 -i $b -g $pdodecGen > $(basename $b .gff)_flank.gff
	    $Bedtools getfasta -name -s -fi $pdodecFasta -bed $(basename $b .gff)_flank.gff -fo $(basename $b .gff)_flank.fa
	    $reheaderFasta $(basename $b .gff)_flank.fa $(basename $b .gff)_flank.gff
fi
       if grep -q "PTRED" $var;
then
	    $Bedtools flank -s -l 150 -r 0 -i $b -g $ptreGen > $(basename $b .gff)_flank.gff
	    $Bedtools getfasta -name -s -fi $ptreFasta -bed $(basename $b .gff)_flank.bed -fo $(basename $b .gff)_flank.fa
	    $reheaderFasta $(basename $b .gff)_flank.fa $(basename $b .gff)_flank.gff
fi
        if grep -q "PJENN" $var;
then
	    $Bedtools flank -s -l 150 -r 0 -i $b -g $pjennGen > $(basename $b .gff)_flank.gff
	    $Bedtools getfasta -name -s -fi $pjennFasta -bed $(basename $b .gff)_flank.gff -fo $(basename $b .gff)_flank.fa
	    $reheaderFasta $(basename $b .gff)_flank.fa $(basename $b .gff)_flank.gff
fi
        if grep -q "PNOV" $var;
then
	    $Bedtools flank -s -l 150 -r 0 -i $b -g $pnovGen > $(basename $b .gff)_flank.gff
	    $Bedtools getfasta -name -s -fi $pnovFasta -bed $(basename $b .gff)_flank.gff -fo $(basename $b .gff)_flank.fa
	    $reheaderFasta $(basename $b .gff)_flank.fa $(basename $b .gff)_flank.gff
fi
        if  grep -q "POCT" $var;
then
	    $Bedtools flank -s -l 150 -r 0 -i $b -g $poctGen > $(basename $b .gff)_flank.gff
	    $Bedtools getfasta -name -s -fi $poctFasta -bed $(basename $b .gff)_flank.gff -fo $(basename $b .gff)_flank.fa
	    $reheaderFasta $(basename $b .gff)_flank.fa $(basename $b .gff)_flank.gff
fi
        if grep -q "PCAUD" $var;
then
	    $Bedtools flank -s -l 150 -r 0 -i $b -g $pcaudGen > $(basename $b .gff)_flank.gff
	    $Bedtools getfasta -name -s -fi $pcaudFasta -bed $(basename $b .gff)_flank.gff -fo $(basename $b .gff)_flank.fa
	    $reheaderFasta $(basename $b .gff)_flank.fa $(basename $b .gff)_flank.gff
fi
        if grep -q "PQUAD" $var;
then
	    $Bedtools flank -s -l 150 -r 0 -i $b -g $pquadGen > $(basename $b .gff)_flank.gff
	    $Bedtools getfasta -name -s -fi $pquadFasta -bed $(basename $b .gff)_flank.gff -fo $(basename $b .gff)_flank.fa
	    $reheaderFasta $(basename $b .gff)_flank.fa $(basename $b .gff)_flank.gff
fi
        if grep -q "PSON" $var;
then
	    $Bedtools flank -s -l 150 -r 0 -i $b -g $psonGen > $(basename $b .gff)_flank.gff
	    $Bedtools getfasta -name -s -fi $psonFasta -bed $(basename $b .gff)_flank.gff -fo $(basename $b .gff)_flank.fa
	    $reheaderFasta $(basename $b .gff)_flank.fa $(basename $b .gff)_flank.gff
fi
        if grep -q "PPENT" $var;
then
	    $Bedtools flank -s -l 150 -r 0 -i $b -g $ppentGen > $(basename $b .gff)_flank.gff
	    $Bedtools getfasta -name -s -fi $ppentFasta -bed $(basename $b .gff)_flank.gff -fo $(basename $b .gff)_flank.fa
	    $reheaderFasta $(basename $b .gff)_flank.fa $(basename $b .gff)_flank.gff
fi
        if grep -q "PBI" $var;
then
	    $Bedtools flank -s -l 150 -r 0 -i $b -g $pbiGen > $(basename $b .gff)_flank.gff
	    $Bedtools getfasta -name -s -fi $pbiFasta -bed $(basename $b .gff)_flank.gff -fo $(basename $b .gff)_flank.fa
	    $reheaderFasta $(basename $b .gff)_flank.fa $(basename $b .gff)_flank.gff
fi
        if grep -q "PSEX" $var;
then
	    $Bedtools flank -s -l 150 -r 0 -i $b -g $psexGen > $(basename $b .gff)_flank.gff
	    $Bedtools getfasta -name -s -fi $psexFasta -bed $(basename $b .gff)_flank.gff -fo $(basename $b .gff)_flank.fa
	    $reheaderFasta $(basename $b .gff)_flank.fa $(basename $b .gff)_flank.gff
fi
        if grep -q "PSEPT" $var;
then
	    $Bedtools flank -s -l 150 -r 0 -i $b -g $pseptGen > $(basename $b .gff)_flank.gff
	    $Bedtools getfasta -name -s -fi $pseptFasta -bed $(basename $b .gff)_flank.gff -fo $(basename $b .gff)_flank.fa
	    $reheaderFasta $(basename $b .gff)_flank.fa $(basename $b .gff)_flank.gff
fi
        if grep -q "PTET" $var;
then
	    $Bedtools flank -s -l 150 -r 0 -i $b -g $ptetGen > $(basename $b .gff)_flank.gff
	    $Bedtools getfasta -name -s -fi $ptetFasta -bed $(basename $b .gff)_flank.gff -fo $(basename $b .gff)_flank.fa
	    $reheaderFasta $(basename $b .gff)_flank.fa $(basename $b .gff)_flank.gff
fi

done

echo "Moving fasta flanking files into new directory"

mkdir fasta_files
mv *_flank.fa fasta_files

echo "Done"
