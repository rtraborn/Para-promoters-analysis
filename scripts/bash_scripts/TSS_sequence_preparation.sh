#!/bin/bash

module load bedtools
module load samtools

#Setting variables: 
#
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"  
source ${DIR}/PdSTRIPE.configfile 

genome=${baseDir}/${GENOME_DIR}/${GENOME_FILE}

cd $WD

echo "Creating the .genome file"

samtools faidx $genome
cut -f1,2 ${genome}.fai > ${speciesCode}.genome

awk '{ if ($5 >= 10) { print } }' $tssData > $tssDatafilt

echo "Creating intervals reflecting the desired genomic segments"

bedtools slop -i $tssDatafilt -g ${speciesCode}.genome -l 4 -r 6 -s > ${experimentID}_inr.bed
#bedtools flank -i $tssDatafilt -g ${speciesCode}.genome -l 40 -r 0 -s > ${experimentID}_TATAi.bed
#bedtools flank -i $tssDatafilt -g ${speciesCode}.genome -l 15 -r 0 -s > ${experimentID}_TATAii.bed
#bedtools subtract -s -a ${experimentID}_TATAi.bed -b ${experimentID}_TATAii.bed > ${experimentID}_TATA.bed

bedtools slop -i $tssDatafilt -g ${speciesCode}.genome -l 100 -r 50 -s > ${experimentID}_prox.bed

echo "Extracting sequence data from each bed file"

bedtools getfasta -fi $genome -bed ${experimentID}_inr.bed -fo ${experimentID}_inr.fasta
bedtools getfasta -fi $genome -bed ${experimentID}_TATA.bed -fo ${experimentID}_TATA.fasta
bedtools getfasta -fi $genome -bed ${experimentID}_prox.bed -fo ${experimentID}_prox.fasta

echo "Job Complete!"
