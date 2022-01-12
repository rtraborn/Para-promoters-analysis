#!/usr/bin/sh

megacc=/home/rraborn/genome_analysis/megacc/megacc
aln_file=$1
outFile=$(basename $1 .best.fas)
outDir=$2
maoFile=/home/rraborn/Para-promoters-analysis/paralogon/mao_files/distance_estimation_pairwise_nucleotide.mao


if [ "$1" == "-h" ]; then
  echo "Usage: megaDistanceEst.sh alignment_file output_directory"
  exit 0
fi

$megacc -a $maoFile -d $aln_file -o $outFile

mv $outFile* $outDir

echo "Job complete!"


