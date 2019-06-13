#!/usr/bin/env python

##########################################################
## For a given list of proteins the script resolves them
## (if possible) to the best matching STRING identifier
## and prints out the mapping on screen in the TSV format
###########################################################

from __future__ import print_function
import sys
import requests
import random
inputFile = sys.argv[1]
output = sys.argv[2]

string_api_url = "http://string-db.org/api"
output_format = "tsv-no-header"
method = "get_string_ids"

## contruct params dictionary
f = open(inputFile)
genelist = f.readlines()
genelist = [x.strip() for x in genelist]
f.close()

params = {

    "identifiers" : "\r".join(genelist), # your protein list
    "species" : 1280, # species NCBI identifier 
    "limit" : 1, # only one (best) identifier per input protein
    "echo_query" : 1, # see your input identifiers in the output
    "caller_identity" : "www.awesome_app.org" # your app name

}

## contruct method URL

request_url = string_api_url + "/" + output_format + "/" + method

## Call STRING

try:
    response = requests.post(request_url, params=params)
except requests.exceptions.RequestException as e:
    print(e)
    sys.exit()

## Read and parse the results
f = open(output,'w')
c = 0
for line in response.text.strip().split("\n"):
    l = line.split("\t")
    print(l)
    input_identifier, string_identifier = l[0], l[2]
    f.write("Input:" + input_identifier + ":STRING:" + string_identifier +"\n")
    
f.close()
    
