#!/usr/bin/sh


PdTSRs=Pd_TSRsetMerged_protID.txt
PoTSRs=Po_TSRsetMerged_protID.txt
PjTSRs=Pj_TSRsetMerged_protID.txt
PnTSRs=Pn_TSRsetMerged_protID.txt

paralogMatch=ParalogMatches_only4spp.txt

echo "Finding orthologous groups with TSR data."

cut -f 12 $PjTSRs > id.list.Pj
cut -f 12 $PoTSRs > id.list.Po
cut -f 12 $PnTSRs > id.list.Pn

touch countsFile_Po.txt
touch countsFile_Pj.txt
touch countsFile_Pn.txt


for i in $(cat id.list.Po); do
if [ $i = "NA" ]; then
    continue
else
    if grep -q $i $paralogMatch; then
        echo "Found"
	echo $i
	egrep $i $paralogMatch > tmp
	cat tmp >> countsFile_Po.txt
    else
        echo "Not Found"
fi
fi

done

for i in $(cat id.list.Pj); do
if [ $i = "NA" ]; then
    continue
else
    if grep -q $i $paralogMatch; then
        echo "Found"
	echo $i
	egrep $i $paralogMatch > tmp
	cat tmp >> countsFile_Pj.txt
    else
        echo "Not Found"
fi
fi

done

for i in $(cat id.list.Pn); do
if [ $i = "NA" ]; then
    continue
else
    if grep -q $i $paralogMatch; then
        echo "Found"
	echo $i
	egrep $i $paralogMatch > tmp
	cat tmp >> countsFile_Pn.txt
    else
        echo "Not Found"
fi
fi

done

echo "Job complete."
