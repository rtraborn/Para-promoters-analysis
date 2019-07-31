#!/bin/sh

paralogMaster=ParalogMatches_only4spp.txt 
PoTSRs=Po_TSRsetMerged_protID.txt
PjTSRs=Pj_TSRsetMerged_protID.txt
PnTSRs=Pn_TSRsetMerged_protID.txt

echo "Finding orthologous groups with TSR data."

cut -f12 $PoTSRs > po.tsrs
cut -f12 $PjTSRs > pj.tsrs
cut -f12 $PnTSRs > pn.tsrs


echo "Job complete."
