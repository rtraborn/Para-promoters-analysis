#!/bin/sh

tsrSet=Pd_TSRsetMerged_protID.txt
paralogSet=../paralog_datasets/all_aurelias-cut-mod.poff
paralogMatch=ParameciumParalogMatches.txt

echo "Finding orthologous groups with TSR data."

cut -f 12 $tsrSet > id.list.Pd

cat "List of paralogs" > $paralogMatch

for i in $(cat id.list.Pd); do
if [ $i = "NA" ]; then
    continue
else
    if grep -q $i $paralogSet; then
        echo "Found"
	echo $i
	egrep $i $paralogSet > tmp
	cut -f1-3 --complement tmp > tmp2
	cat tmp2  >> $paralogMatch
    else
        echo "Not Found"
fi
fi

done

echo "Job complete."
