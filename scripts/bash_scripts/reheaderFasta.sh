#!/bin/bash

fasta=$1
gff=$2

echo "Reheadering the fasta file"

myHeader=`cut -f 9 $gff | cut -f 1 -d ';' | tr -d 'ID\='`
echo $myHeader

sed -i "s/>gene/>$myHeader/g" "$fasta"

echo "Done"
