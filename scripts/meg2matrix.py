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


myOutput = open(args.mega_data, "r")

lines = myOutput.readlines()
geneData = []
matData = []
str = "\;"
pat = re.compile(r"\bd\w*r\b", re.IGNORECASE)  # upper and lowercase will match
for x in lines:
    if pat.search(str) != None: # TODO: need to get this to match
        print("Found it.")
    myOutput.close()


print("Mega parser complete!")
