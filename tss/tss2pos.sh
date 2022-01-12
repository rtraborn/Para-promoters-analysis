#!/usr/bin/bash

PdTSS=Pd_TSSset-1filt.bed
PjTSS=Pj_TSSset-1filt.bed
PoTSS=Po_TSSset-1filt.bed
PnTSS=Pn_TSSset-1filt.bed

bed2pos.pl -o PdTSS.pos $PdTSS
bed2pos.pl -o PjTSS.pos $PjTSS
bed2pos.pl -o PoTSS.pos $PoTSS
bed2pos.pl -o PnTSS.pos $PnTSS
