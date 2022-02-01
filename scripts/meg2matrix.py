#!/home/rraborn/anaconda3/bin/python

import re
import pandas as pd
import string
import argparse

parser = argparse.ArgumentParser(description="Converts Mega output to parsable matrix table for analysis")
parser.add_argument("mega_data", help="Name of csv output file")
args = parser.parse_args()

def meg2matrix():

    """Converts mega output to a parsable matrix format"""
    print("Starting mega")

nTaxa = []
myOutput = open(args.mega_data, "r")
regex = r"(No. of Taxa:)(\d+)"
lines = myOutput.readlines()
for x in lines:
    if re.search(regex, x):
        mySplit=x.split(":")
        nTaxa=mySplit[1]
    myOutput.close()

n_taxa=int(nTaxa)
geneData = []
matData = []
endPoint=34+n_taxa
print(endPoint)

print("The number of taxa is:", nTaxa)

#obtaining the geneID list
for line in lines[34:endPoint]:
    line2=line.replace("\n", "")
    geneSplit=line2.split("#")
    geneID=geneSplit[1]
    geneData.append(geneID)
    myOutput.close()


newStart=endPoint+3
newEnd=endPoint+n_taxa+2
print("newStart is:", newStart)
print("newEnd is:", newEnd)

for line in lines[newStart:newEnd]:
    fixedLine=line.replace("\n", "")
    fixedLine2=fixedLine.replace(",", "")
    fixedLine3=fixedLine2.split("]")[1]
    matData.append(fixedLine3)
    myOutput.close()

matData_new = pd.DataFrame(matData)
print("The number of rows in matData_new is", matData_new.shape[0])

print(matData_new)

matData_new.to_csv(r'testOut.txt', header=geneData, index=None, sep=',', mode='a')
print("Mega parser complete!")

### TODO add header and index to output
### TODO remove quotes from output
### TODO add argument for outFile name
### TODO fix this issue when writing header= ValueError: Writing 1 cols but got 19 aliases
## need to do a 'text to columns' operation on the matrix values

print(geneData)
