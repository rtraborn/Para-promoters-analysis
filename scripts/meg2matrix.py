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
#str = r'\;'
str = r'\[d+ \]' #TODO need to fix this regex
new_file = []
for x in lines:
    match = re.search(str, x, re.MULTILINE)
    if match:
        new_line = match.group() + '\n'
        new_file.append(new_line)
        print(x)
    myOutput.close()

print(new_file)

print("Mega parser complete!")
