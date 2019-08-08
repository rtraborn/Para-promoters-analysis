### Repository for Paramecium promoters data analysis, in progress

#### To run a working example to create an object, please do the following from the /tsr directory

```
source("../scripts/buildTSSDb.R")
source("../scripts/tssToList.R")

sampleDb <- buildTSSDb(speciesNames=c("Pdec","Poct","Pnov", "Pjenn"), "Pd_TSRsetMerged.txt", "Po_TSRsetMerged.txt", "Pn_TSRsetMerged.txt", "Pj_TSRsetMerged.txt")

sampleDb[['Pdec']]['PDEC.223.1.G00010003']
```

After running the above commands, you should obtain the following output:

```
$PDEC.223.1.G00010003
$PDEC.223.1.G00010003$seq
[1] scaffold_0001
579 Levels: scaffold_0001 scaffold_0002 scaffold_0003 ... scaffold_0696

$PDEC.223.1.G00010003$coords
IRanges object with 1 range and 0 metadata columns:
          start       end     width
      <integer> <integer> <integer>
  [1]      1852      1852         1

$PDEC.223.1.G00010003$strand
[1] +
Levels: - +

$PDEC.223.1.G00010003$nTSSs
[1] 1

$PDEC.223.1.G00010003$nTAGs
[1] 128

$PDEC.223.1.G00010003$tsrPeak
[1] 1

$PDEC.223.1.G00010003$tsrWdth
[1] 1

$PDEC.223.1.G00010003$tsrSI
[1] 2

$PDEC.223.1.G00010003$tsrMSI
[1] 1
```

Coming soon: importing para-ortholog files into the same custom R object.