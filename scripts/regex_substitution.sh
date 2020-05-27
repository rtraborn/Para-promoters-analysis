#!/usr/bin/sh

myDir=/home/rraborn/scratch/Para-promoters-analysis/paralog_datasets
fileName=all_aurelias.poff
outFile=all_aurelias_tabs.poff

cd $myDir

#TODO there are still remaining instances with ",", please fix

perl -pe 's/(\sNA)(\,)(NA)/\1\t\3/g' all_aurelias.poff > tmp.1
perl -pe 's/(\w+\.\S+\.\S+\.P\d+)(\,)(\w+\.\S+\.\S+\.P\d+)/\1\t\3/g' tmp.1 > tmp.2
perl -pe 's/(\s\.)(\,)(\w+\.\S+\.\d+\.P\d+)/\1\t\3/g' tmp.2 > tmp.3
perl -pe 's/(\s\w+\.\S+\.\d+\.P\d+)(\,)(\.)/\1\t\3/g' tmp.3 > tmp.4
perl -pe 's/(\.)(\,)(\.)/\1\t\3/g' tmp.4 > tmp.5

echo "Made it to tmp.5"
perl -pe 's/(\s\w+\.\S+\.P\d+)(\,)(\w+\.\S+\.P\d+)/\1\t\3/g' tmp.5 > tmp.6
echo "Made it to tmp.6"
perl -pe 's/(\s\.)(\,)(\w+\.\S+\.P\d+)/\1\t\3/g' tmp.6 > tmp.7
echo "Made it to tmp.7"
perl -pe 's/(\s\w+\.\S+\.P\d+)(\,)(\.)/\1\t\3/g' tmp.7 > tmp.8
perl -pe 's/(\s\w+\.\S+\w+\.\S+\.P\d+)(\,)(\w+\.\S+\.P\d+)/\1\t\3/g' tmp.8 > tmp.9
echo "Made it to tmp.9"

#now for the annoying PPRIM ids:
perl -pe 's/(\sPPRIMP\d+)(\,)(\.)/\1\t\3/g' tmp.9 > tmp.10
perl -pe 's/(\.)(\,)(PPRIMP\d+)/\1\t\3/g' tmp.10 > tmp.11
perl -pe 's/(\sPPRIMP\d+)(\,)(PPRIMP\d+)/\1\t\3/g' tmp.11 > $outFile


echo "Job complete."
