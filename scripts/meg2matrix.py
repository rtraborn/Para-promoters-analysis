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


newStart=endPoint+2
newEnd=endPoint+n_taxa
print("newStart is:", newStart)
print("newEnd is:", newEnd)

for line in lines[newStart:newEnd]:
    #print(line)
    fixedLine=line.replace("\n", "")
    matData.append(fixedLine)
    myOutput.close()
    
print(geneData)
print(matData)
print("Mega parser complete!")
