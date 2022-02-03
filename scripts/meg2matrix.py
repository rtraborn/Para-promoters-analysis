#!/home/rraborn/anaconda3/bin/python

import re
import pandas as pd
import string
import argparse
import numpy as np

parser = argparse.ArgumentParser(description="Converts Mega output to parsable matrix table for analysis")
parser.add_argument("mega_data", help="Name of mega file to parse")
parser.add_argument("outFile", help="Name of csv file to write")
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

print("The number of genes is:", nTaxa)

#obtaining the geneID list
for line in lines[34:endPoint]:
    line2=line.replace("\n", "")
    geneSplit=line2.split("#")
    geneID=geneSplit[1]
    geneData.append(geneID)
    myOutput.close()


newStart=endPoint+2
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
matData_new2 = matData_new[0].str.split(' ', expand=True)
matData_new3 = matData_new2.drop([0, 1], axis=1)

print("The number of rows in matData_new is", matData_new3.shape[0])
print("The number of columns in matData_new is", matData_new3.shape[1])
genLen=len(geneData)
nCols=matData_new3.shape[1]
finalCol=nCols
df_seq=np.arange(genLen, nCols, 1)
newCols=np.arange(0, nCols, 1)
matData_final = matData_new3.set_axis(newCols, axis=1, inplace=False)
matData_final2=matData_final.drop(df_seq, axis=1)
matData_final3=matData_final2.set_axis(geneData, axis=1, inplace=False)
matData_final4=matData_final3.set_axis(geneData, axis=0, inplace=False)
print(matData_final4)

matData_final4.to_csv(args.outFile, header=True, index=True, sep=',', mode='a', na_rep=None)
print("Mega parser complete!")
