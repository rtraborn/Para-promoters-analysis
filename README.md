### Repository for Paramecium promoters data analysis/

Raborn, Licknack et al., 2022, in Preparation

#### To run a working example to create an object, please do the following from the /tsr directory

```
source("../scripts/R_scripts/buildTSRDb.R")
source("../scripts/R_scripts/tssToList.R")

sampleDb <- buildTSRDb(speciesNames=c("Pdec","Poct","Pnov", "Pjenn"), "Pd_TSRsetMerged.txt", "Po_TSRsetMerged.txt", "Pn_TSRsetMerged.txt", "Pj_TSRsetMerged.txt")

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

#### Importing the ortho-paralog dataset into a new object:

```
source("../scripts/loadOrthoParalogs.R")
test.orthoPara <- loadOrthoParalogs("../paralog_datasets/Poff_table_updated_082020.txt")
```

#### The results should look like this:
```
> test.orthoPara[[1]]
$Pbi_1
                 Para1                  Para2 
                   "?" "PDEC.223.1.P00780011" 

$Pdec_1
                   Para1                    Para2 
"PDODEC.274.1.P00100052"                      "?" 

$Pdodec_1
Para1 Para2 
  "?"   "?" 

$Pjenn_1
                Para1                 Para2 
"PPENT.87.1.P0080167"         "PPRIMP00822" 

$Pnov_1
Para1 Para2 
  "?"   "?" 

... #results truncated for readability
```

#### Now let's build a gene database:

```
geneDb <- buildGeneDb(c("Pdec", "Pjenn", "Pnov", "Poct"), "../../annotations/pdec-full.gff", "../../annotations/pjen-full.gff", "../../annotations/pnov-full.gff", "../../annotations/poct-full.gff")
```

### To test isPresentOP.R (in progress)
```
opOut <- isPresentOP(test.orthoPara, sampleDb, sppIDs=c("Pdec", "Pjenn", "Pnov", "Poct"))
```

#### Building a TSS database
```
getwd("../tss")
source("../scripts/buildTSSDb.R")
sampleDb_tss <- buildTSSDb(speciesNames=c("Pdec","Poct","Pnov", "Pjenn"), "PdecTSS_intersect.bed", "PoctTSS_intersect.bed", "PnovTSS_intersect.bed", "PjenTSS_intersect.bed")
```
