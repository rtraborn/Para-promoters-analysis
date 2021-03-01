#!/usr/bin/sh

treeDir=/scratch/rraborn/Paramecium_ortho_groups/Filtered

cd $treeDir

for i in *.tre; do

echo "Starting conversion."

echo $i

cat $i | tr -d '(' | tr ')' '\n' | tr ':' '\n' | tr -d ';' | tr ',' '\n' | sed --expression='/^$/d' | egrep 'P*P[0-9]+' > $(basename $i .tre).txt

done

echo "Job complete!"


