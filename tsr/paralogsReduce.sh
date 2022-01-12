#!/bin/sh

paralogMatch=ParameciumParalogMatches.txt

touch test

echo "Finding orthologous groups with TSR data."

     awk '/PNOV/ || /POCT/ || /PJENN/' $paralogMatch > ParalogMatchesAtLeast2.txt
     awk '/PNOV/ && /POCT/ && /PJENN/' $paralogMatch > ParalogMatchesAll.txt
     awk '/PNOV/ && /POCT/' $paralogMatch > ParalogMatchesPnovPoct.txt
     awk '/PNOV/ && /PJENN/' $paralogMatch > ParalogMatchesPnovPjenn.txt
     awk '/POCT/ && /PJENN/' $paralogMatch > ParalogMatchesPoctPjenn.txt

echo "Job complete."
