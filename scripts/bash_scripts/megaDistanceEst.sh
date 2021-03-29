#!/usr/bin/sh

megacc=/home/rraborn/genome_analysis/megacc/megacc
aln_file=$1
outFile=$2
maoFile=/home/rraborn/Para-promoters-analysis/paralogon/mao_files/distance_estimation_pairwise_nucleotide.mao

if [ "$1" == "-h" ]; then
  echo "Usage: megaDistanceEst.sh alignment_file output_file"
  exit 0
fi

$megacc -a $maoFile -d $aln_file -o $outFile

echo "Job complete!"


