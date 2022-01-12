#!/home/rraborn/anaconda3/bin/python

import pandas as pd
import string
import argparse

parser = argparse.ArgumentParser(description="Converts Mega output to parsable matrix table for analysis")
parser.add_argument("mega_file", help="Mega dataset for input")

def meg2matrix():

    """Converts mega output to a parsable matrix format"""
    print("Starting mega")


myOutput = open(args.mega_data, "r")

lines = myOutput.readlines()
geneData = []
matData = []
for x in lines:
    # write code to begin after the ';'
    print("Code goes here")
myOutput.close()
