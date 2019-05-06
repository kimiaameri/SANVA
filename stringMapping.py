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

params = {

    "identifiers" : "\r".join(["p53", "BRCA1", "cdk2", "Q99835"]), # your protein list
    "species" : 9606, # species NCBI identifier 
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

c = 0
for line in response.text.strip().split("\n"):
    l = line.split("\t")
    print(l)
    input_identifier, string_identifier = l[0], l[2]
    print("Input:", input_identifier, "STRING:", string_identifier, sep="\t")
